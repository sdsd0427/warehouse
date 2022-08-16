package kr.or.warehouse.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.MakeFileName;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.command.WorkModifyCommand;
import kr.or.warehouse.controller.view.OrganizationNode;
import kr.or.warehouse.dao.ProceedingDAO;
import kr.or.warehouse.dao.QnaDAO;
import kr.or.warehouse.dao.ReportDAO;
import kr.or.warehouse.dao.WorkAttachDAO;
import kr.or.warehouse.dao.WorkDAO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.CooperReqVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ObjectionVO;
import kr.or.warehouse.dto.ProceedingVO;
import kr.or.warehouse.dto.ProxyReqVO;
import kr.or.warehouse.dto.QnaReplyVO;
import kr.or.warehouse.dto.QnaVO;
import kr.or.warehouse.dto.ReportVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkReportVO;
import kr.or.warehouse.dto.WorkVO;

@Service
public class WorkServiceImpl implements WorkService{

	@Autowired
	private WorkDAO workDAO;

	@Autowired
	private ReportDAO reportDAO;

	@Autowired
	private ProceedingDAO proDAO;

	@Autowired
	private WorkAttachDAO workAttachDAO;

	@Autowired
	private QnaDAO qnaDAO;

	private List<WorkVO> setWorkInfo(List<WorkVO> workList) throws SQLException{
		for(WorkVO work : workList) {
			//업무 담당자, 요청자 정보 가져오기
			String manager = work.getManager().split(",")[0];
			String managerPhoto = work.getManagerPhoto().split(",")[0];
			work.setManagerCnt(work.getManager().split(",").length - 1);
			work.setManager(manager);
			work.setManagerPhoto(managerPhoto);
			setDday(work);


			//요청대기일자, 마감임박표시
			if(work.getWstatus().equals("대기")) {
				// regDate + 3 < today
				setOverDay(work);
			}

		}
		return workList;
	}

	private void setDday(WorkVO work) {
		Date endDate = work.getWend();
		Date today = new Date();
		if(endDate.after(today)) {
			long endTime = endDate.getTime();
			long todayTime = today.getTime();
			long dTime = endTime - todayTime;
			int dDay = (int)(dTime / (24 * 60 * 60 * 1000));
			work.setdDay(dDay);
		}
	}

	private void setOverDay(WorkVO work) {
		Date today = new Date();
		Date regDate = work.getWdate();
		Calendar cal = Calendar.getInstance();
		cal.setTime(regDate);
		cal.add(Calendar.DATE, 3);
		if(today.after(cal.getTime())) {
			long todayTime = today.getTime();
			long regTime = regDate.getTime();
			long overTime = todayTime - regTime;
			int overDay = (int)(overTime/(24 * 60 * 60 * 1000));
			work.setOverDay(overDay);
		}
	}

	private void setWorkReadCheck(List<WorkVO> workList, int eno) throws SQLException{
		for(WorkVO work : workList) {
			int cnt = workDAO.workReadCheck(work.getWcode(), eno);
			if(cnt > 0) {
				work.setWcheck(1);
			}
		}
	}

	private Map<String, Integer> setNoneCheckCnt(List<WorkVO> workList, int eno) throws SQLException {
		Map<String, Integer> noneCheckMap = new HashMap<String, Integer>();
		noneCheckMap.put("0", 0);
		noneCheckMap.put("1", 0);
		noneCheckMap.put("2", 0);
		noneCheckMap.put("3", 0);
		noneCheckMap.put("4", 0);
		noneCheckMap.put("5", 0);

		for(WorkVO work : workList) {
			if(work.getWstatus().equals("대기")) {
				addCnt(noneCheckMap, work, eno, "0");
			}
			if(work.getWstatus().equals("진행")) {
				addCnt(noneCheckMap, work, eno, "1");
			}
			if(work.getWstatus().equals("완료")) {
				addCnt(noneCheckMap, work, eno, "2");
			}
			if(work.getWstatus().equals("협업요청")) {
				addCnt(noneCheckMap, work, eno, "3");
			}
			if(work.getWstatus().equals("대리요청")) {
				addCnt(noneCheckMap, work, eno, "4");
			}
		}

		return noneCheckMap;
	}

	private void addCnt(Map<String, Integer>noneCheckMap, WorkVO work, int eno, String wstatus) throws SQLException {
		int cnt = workDAO.workReadCheck(work.getWcode(), eno);
		if(cnt == 0) {
			noneCheckMap.put(wstatus, noneCheckMap.get(wstatus) + 1);
			noneCheckMap.put("5", noneCheckMap.get("5") + 1);
		}
	}

	public List<OrganizationNode> organization(List<DepartmentVO> depList){
		List<OrganizationNode> nodeList = new ArrayList<OrganizationNode>();

		for(DepartmentVO dep : depList) {
			OrganizationNode node = new OrganizationNode();
			node.setId(Integer.toString(dep.getDno()));
			node.setText(dep.getDname());
			if(dep.getUpdno() == 0) {
				node.setParent("#");
			}else {
				node.setParent(Integer.toString(dep.getUpdno()));
			}

			if(dep.getEmpList().size() > 0) {
				List<EmployeeVO> empList = dep.getEmpList();
				for(EmployeeVO emp : empList) {
					OrganizationNode childNode = new OrganizationNode();
					childNode.setId(Integer.toString(emp.getEno()));
					childNode.setText(emp.getName());
					childNode.setParent(Integer.toString(dep.getDno()));
					childNode.setIcon("fas fa-user");
					nodeList.add(childNode);

				}
			}

			node.setIcon("fas fa-building");

			nodeList.add(node);
		}

		return nodeList;
	}

	@Override
	public Map<String, Object> getMyWorkList(Criteria cri, int statusNo, int eno) throws SQLException {
		String wstatus = statusNo == 0 ? "대기" : statusNo == 1 ? "진행" : statusNo == 2 ? "완료" : statusNo == 3 ? "협업요청" :
			statusNo == 4 ? "대리요청" : "전체";

		Map<String, Object> dataMap = new HashMap<String, Object>();

		//workList
		List<WorkVO> myWorkList = null;
		int totalCount = 0;
		if(wstatus.equals("전체")) {
			myWorkList = workDAO.selectMyWorkAllStatusList(eno, cri);
		}else {
			myWorkList = workDAO.selectMyWorkList(eno,wstatus,cri);
		}
		totalCount = workDAO.selectMyWorkTotalCount(eno, wstatus,cri);

		//pageMaker
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		myWorkList = setWorkInfo(myWorkList);
		setWorkReadCheck(myWorkList, eno);
		for(WorkVO work : myWorkList) {
			String hashTag = workDAO.selectHashTagByWcode(work.getWcode());
			work.setHashTag(hashTag);
		}


		dataMap.put("myWorkList", myWorkList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("statusNo", statusNo);

		return dataMap;
	}

	@Override
	public Map<String, Integer> getNoneCheckCnt(String referMcode, Criteria cri, int eno, int dno) throws SQLException {

		List<WorkVO> selectWorkAllStatusList = null;
		//nonCheckWorkList
		if(referMcode.equals("M113000")) {
			selectWorkAllStatusList = workDAO.selectMyWorkReadCheckList(eno, cri);
		}

		if(referMcode.equals("M114000")) {
			selectWorkAllStatusList = workDAO.selectToReqReadCheckList(eno, cri);
		}

		if(referMcode.equals("M115000")) {
			selectWorkAllStatusList = workDAO.selectDepWorkReadCheckList(dno, cri);
		}
		Map<String, Integer> noneCheckCnt = setNoneCheckCnt(selectWorkAllStatusList,eno);

		return noneCheckCnt;
	}

	@Override
	public Map<String, Object> getToReqList(Criteria cri, int statusNo, int eno) throws SQLException {

		String wstatus = statusNo == 0 ? "대기" : statusNo == 1 ? "진행" : statusNo == 2 ? "완료" : statusNo == 3 ? "협업요청" :
			statusNo == 4 ? "대리요청" : "전체";

		Map<String, Object> dataMap = new HashMap<String, Object>();

		//workList
		List<WorkVO> toReqList = null;
		int totalCount = 0;
		if(wstatus.equals("전체")) {
			toReqList = workDAO.selectToReqAllStatusList(eno, cri);
		}else {
			toReqList = workDAO.selectToReqList(eno, wstatus, cri);
		}
		totalCount = workDAO.selectToReqTotalCount(eno, wstatus, cri);

		//pageMaker
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		toReqList = setWorkInfo(toReqList);
		setWorkReadCheck(toReqList, eno);
		for(WorkVO work : toReqList) {
			String hashTag = workDAO.selectHashTagByWcode(work.getWcode());
			work.setHashTag(hashTag);
		}



		dataMap.put("toReqList", toReqList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("statusNo", statusNo);

		return dataMap;
	}

	@Override
	public Map<String, Object> getDepWorkList(Criteria cri, int statusNo, int eno, int dno) throws SQLException {
		String wstatus = statusNo == 0 ? "대기" : statusNo == 1 ? "진행" : statusNo == 2 ? "완료" : statusNo == 3 ? "협업요청" :
			statusNo == 4 ? "대리요청" : "전체";

		Map<String, Object> dataMap = new HashMap<String, Object>();

		//workList
		List<WorkVO> depWorkList = null;
		int totalCount = 0;
		if(wstatus.equals("전체")) {
			depWorkList = workDAO.selectDepWorkAllStatusList(dno, cri);
		}else {
			depWorkList = workDAO.selectDepWorkList(dno, wstatus, cri);
		}
		totalCount = workDAO.selectDepWorkTotalCount(dno, wstatus, cri);

		//pageMaker
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		depWorkList = setWorkInfo(depWorkList);
		setWorkReadCheck(depWorkList, eno);
		for(WorkVO work : depWorkList) {
			String hashTag = workDAO.selectHashTagByWcode(work.getWcode());
			work.setHashTag(hashTag);
		}



		dataMap.put("depWorkList", depWorkList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("statusNo", statusNo);

		return dataMap;
	}

	@Override
	public WorkVO getWorkByWcode(String wcode, int eno) throws SQLException {
		WorkVO work = workDAO.selectWorkByWcode(wcode);
		EmployeeVO requestBy = workDAO.selectWorkRequestBy(wcode);
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(wcode);
		String hashTag = workDAO.selectHashTagByWcode(wcode);
		List<AttachVO> attachList = workAttachDAO.selectWorkAttachByWcode(wcode);
		if(attachList != null && attachList.size() > 0) {

			attachList = MakeFileName.parseFileNameFromAttaches(attachList, "\\$\\$");
			work.setAttachList(attachList);
		}

		work.setWorkManagerList(workManagerList);
		work.setRequestBy(requestBy);
		work.setHashTag(hashTag);
		int cnt = workDAO.workReadCheck(wcode, eno);
		if(cnt == 0) {
			workDAO.insertWorkReader(wcode, eno);
		}

		return work;
	}

	@Override
	public void modifyMyWork(WorkVO work) throws SQLException {
		workDAO.updateMyWork(work);
		workDAO.updateWorkHashTag(work);
		if(work.getWprogress() == 100) {
			workDAO.updateWorkWstatus(work.getWcode(), "완료", "B103");
			workDAO.updateHashTagClassCode(work.getWcode(), "B103");
			workDAO.deleteWorkReader(work.getWcode());
			if(work.getWopen() == 1) {
				workDAO.insertKnowHow(work.getWcode());
			}
		}
	}

	@Override
	public void myWorkCooperReq(CooperReqVO cooper, int eno) throws SQLException {
		cooper.setEno(eno);
		workDAO.insertCooperReq(cooper);
		workDAO.updateWorkManagerAnswer(cooper.getWcode(), eno, "협업요청");
		workDAO.updateWorkWstatus(cooper.getWcode(), "협업요청", "B105");
		workDAO.updateHashTagClassCode(cooper.getWcode(), "B105");
		workDAO.deleteWorkReader(cooper.getWcode());
	}

	@Override
	public CooperReqVO getCooperReq(String wcode) throws SQLException {
		CooperReqVO cooperReq = workDAO.selectCooperReq(wcode);
		if(cooperReq == null) {
			return null;
		}else {
			EmployeeVO cooperRequester = workDAO.selectCooperRequesterByEno(cooperReq.getEno());
			cooperReq.setRequester(cooperRequester);
		}

		return cooperReq;
	}

	@Override
	public EmployeeVO getEmpByNodeId(int eno) throws SQLException {
		return workDAO.selectEmpByNodeId(eno);
	}

	@Override
	public void cooperReqApprove(WorkModifyCommand modifyCommand) throws Exception {
		//data -> WorkVO
		WorkVO work = workDAO.selectWorkByWcode(modifyCommand.getWcode());
		work.setWcontent(modifyCommand.getWcontent());
		work.setWprogress(Integer.parseInt(modifyCommand.getWprogress()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		work.setWend(sdf.parse(modifyCommand.getWend()));
		work.setHashTag(modifyCommand.getHashTag());

		//담당자 수정
		List<String> newWorkManagerList = modifyCommand.getNewWorkManagerList();
		for(String newManager : newWorkManagerList) {
			WorkManagerVO manager = new WorkManagerVO();
			manager.setWcode(work.getWcode());
			manager.setAnswer("대기");
			manager.setEno(Integer.parseInt(newManager));
			manager.setIsafter(1);
			manager.setWmstep(0);
			manager.setWcheck(0);
			workDAO.insertNewWorkManager(manager);
		}


		//업무내용 수정
		workDAO.updateToReq(work);
		//해쉬태그 수정
		workDAO.updateWorkHashTag(work);

		//CooperReq Result 변경
		workDAO.updateCooperReqApprove(work.getWcode());



	}

	@Override
	public void myWorkApprove(String wcode, int eno) throws SQLException {
		workDAO.updateWorkManagerAnswer(wcode, eno, "승인");


		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(wcode);
		int answerCnt = 0;
		for(WorkManagerVO manager : workManagerList) {
			System.out.println(manager.getAnswer());
			String answer = manager.getAnswer();
			if(answer.equals("대기") || answer.equals("이의신청")) {
				answerCnt += 1;
			}
			if(answer.equals("대리요청")) {
				workDAO.deleteWorkManager(wcode, manager.getEno());
			}
		}
		System.out.println(answerCnt);
		if(answerCnt == 0) {
			for(WorkManagerVO manager : workManagerList) {
				int managerEno = manager.getEno();
				workDAO.updateWorkManagerAnswer(wcode, managerEno, "승인");
			}

			workDAO.updateWorkWstatus(wcode, "진행" , "B102");
			workDAO.updateHashTagClassCode(wcode, "B102");
			workDAO.deleteWorkReader(wcode);
		}

	}

	@Override
	public void reqObjection(ObjectionVO obj) throws SQLException {
		workDAO.insertObjection(obj);
		workDAO.updateWorkManagerAnswer(obj.getWcode(), obj.getEno(), "이의신청");
	}

	@Override
	public ObjectionVO getObjection(String wcode, int eno, int result) throws SQLException {
		return workDAO.selectObjection(wcode, eno, result);
	}

	@Override
	public void objectionApprove(WorkModifyCommand modifyCommand, int eno) throws Exception {
		//data -> WorkVO
		WorkVO work = workDAO.selectWorkByWcode(modifyCommand.getWcode());
		work.setWcontent(modifyCommand.getWcontent());
		if(!work.getWstatus().equals("대기")) {
			work.setWprogress(Integer.parseInt(modifyCommand.getWprogress()));
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		work.setWend(sdf.parse(modifyCommand.getWend()));
		work.setHashTag(modifyCommand.getHashTag());

		//담당자 지우기
		List<String> removeWorkManagerList = modifyCommand.getRemoveWorkManagerList();
		if(removeWorkManagerList != null && removeWorkManagerList.size() > 0) {
			for(String removeManager : removeWorkManagerList) {
				workDAO.deleteWorkManager(work.getWcode(), Integer.parseInt(removeManager));
			}
		}
		//담당자 추가하기

		List<String> newWorkManagerList = modifyCommand.getNewWorkManagerList();
		if(newWorkManagerList != null && newWorkManagerList.size() > 0) {
			for(String newManager : newWorkManagerList) {
				WorkManagerVO manager = new WorkManagerVO();
				manager.setWcode(work.getWcode());
				manager.setAnswer("대기");
				manager.setEno(Integer.parseInt(newManager));
				manager.setIsafter(1);
				manager.setWmstep(0);
				manager.setWcheck(0);
				workDAO.insertNewWorkManager(manager);
			}
		}
		System.out.println("wmstepEno : " + modifyCommand.getWmstep());
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(work.getWcode());
		for(WorkManagerVO manager : workManagerList) {
			if(manager.getEno() == modifyCommand.getWmstep()) {
				manager.setWmstep(1);
				workDAO.updateWorkManagerWmStep(manager);
			}

			if(manager.getEno() == eno) {
				workDAO.updateWorkManagerAnswer(work.getWcode(), eno, "승인");
			}
		}

		//업무 상태변경
		workManagerList = workDAO.selectWorkManagerList(work.getWcode());
		int answerCnt = 0;
		for(WorkManagerVO manager : workManagerList) {
			String answer = manager.getAnswer();
			if(answer.equals("대기") || answer.equals("이의신청") || answer.equals("반려")) {
				answerCnt += 1;
			}
		}

		if(answerCnt == 0) {
			for(WorkManagerVO manager : workManagerList) {
				int managerEno = manager.getEno();
				workDAO.updateWorkManagerAnswer(work.getWcode(), managerEno, "승인");
			}

			workDAO.updateWorkWstatus(work.getWcode(), "진행" , "B102");
			workDAO.updateHashTagClassCode(work.getWcode(), "B102");
			workDAO.deleteWorkReader(work.getWcode());
		}

		//업무내용 수정
		workDAO.updateToReq(work);
		//해쉬태그 수정
		workDAO.updateWorkHashTag(work);

		//Objection result변경
		workDAO.updateObjectionApprove(work.getWcode(), eno);
	}

	@Override
	public void myWorkProxyReq(ProxyReqVO proxy) throws SQLException {
		//insert proxyReq
		workDAO.insertProxyReq(proxy);
		//workmanager answer update
		workDAO.updateWorkManagerAnswer(proxy.getWcode(), proxy.getEno(), "대리요청");
		//work wstatus,classcode update
		workDAO.updateWorkWstatus(proxy.getWcode(), "대리요청", "B106");

		//hashtag classcode update
		workDAO.updateHashTagClassCode(proxy.getWcode(), "B106");
		//업무 안읽은상태로
		workDAO.deleteWorkReader(proxy.getWcode());
	}

	@Override
	public ProxyReqVO getProxyReq(String wcode) throws SQLException {
		return workDAO.selectProxyReq(wcode);
	}

	@Override
	public void proxyReqApprove(WorkModifyCommand modifyCommand) throws Exception {
		//data -> WorkVO
		WorkVO work = workDAO.selectWorkByWcode(modifyCommand.getWcode());
		work.setWcontent(modifyCommand.getWcontent());
		work.setWprogress(Integer.parseInt(modifyCommand.getWprogress()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		work.setWend(sdf.parse(modifyCommand.getWend()));
		work.setHashTag(modifyCommand.getHashTag());

		//담당자 삭제
		//담당자 추가
		//1. 책임자 확인
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(work.getWcode());
		int wmstepCnt = 0;
		ProxyReqVO proxyReq = workDAO.selectProxyReq(work.getWcode());
		for(WorkManagerVO manager : workManagerList) {
			if(manager.getEno() == proxyReq.getEno() && manager.getWmstep() == 1) {
				wmstepCnt += 1;
			}
		}
		List<String> newWorkManagerList = modifyCommand.getNewWorkManagerList();
		for(String newManager : newWorkManagerList) {
			WorkManagerVO manager = new WorkManagerVO();
			manager.setWcode(work.getWcode());
			manager.setAnswer("대기");
			manager.setEno(Integer.parseInt(newManager));
			manager.setIsafter(1);
			if(wmstepCnt >= 1) {
				manager.setWmstep(1);
			}else {
				manager.setWmstep(0);
			}
			manager.setWcheck(0);
			workDAO.insertNewWorkManager(manager);
		}
		//업무내용 수정
		workDAO.updateToReq(work);
		//해쉬태그 수정
		workDAO.updateWorkHashTag(work);

		//proxyReq Result 변경
		workDAO.updateProxyReqApprove(work.getWcode());
	}

	@Override
	public void cooperReqRefuse(String wcode, String content) throws SQLException {
		workDAO.updateCooperReqRefuse(wcode, content);
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(wcode);
		for(WorkManagerVO manager : workManagerList) {
			if(manager.getAnswer().equals("협업요청")) {
				workDAO.updateWorkManagerAnswer(wcode, manager.getEno(), "승인");
			}
		}

		workManagerList = workDAO.selectWorkManagerList(wcode);
		//업무 상태변경
		int answerCnt = 0;
		for(WorkManagerVO manager : workManagerList) {
			String answer = manager.getAnswer();
			if(answer.equals("대기") || answer.equals("이의신청")) {
				answerCnt += 1;
			}
		}

		if(answerCnt == 0) {
			for(WorkManagerVO manager : workManagerList) {
				int managerEno = manager.getEno();
				workDAO.updateWorkManagerAnswer(wcode, managerEno, "승인");
			}

			workDAO.updateWorkWstatus(wcode, "진행" , "B102");
			workDAO.updateHashTagClassCode(wcode, "B102");
			workDAO.deleteWorkReader(wcode);
		}
	}

	@Override
	public void objectionRefuse(String wcode, int eno, String content) throws SQLException {
		workDAO.updateObjectionRefuse(wcode, eno, content);
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(wcode);
		for(WorkManagerVO manager : workManagerList) {
			if(manager.getEno() == eno && manager.getAnswer().equals("이의신청")) {
				workDAO.updateWorkManagerAnswer(wcode, manager.getEno(), "반려");
			}
		}
//
//		workManagerList = workDAO.selectWorkManagerList(wcode);
//		//업무 상태변경
//		int answerCnt = 0;
//		for(WorkManagerVO manager : workManagerList) {
//			String answer = manager.getAnswer();
//			if(answer.equals("대기") || answer.equals("이의신청")) {
//				answerCnt += 1;
//			}
//		}
//
//		if(answerCnt == 0) {
//			for(WorkManagerVO manager : workManagerList) {
//				int managerEno = manager.getEno();
//				workDAO.updateWorkManagerAnswer(wcode, managerEno, "승인");
//			}
//
//			workDAO.updateWorkWstatus(wcode, "진행" , "B102");
//			workDAO.updateHashTagClassCode(wcode, "B102");
//			workDAO.deleteWorkReader(wcode);
//		}

	}

	@Override
	public void proxyReqRefuse(String wcode, String content) throws Exception {
		workDAO.updateProxyReqRefuse(wcode, content);
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(wcode);
		for(WorkManagerVO manager : workManagerList) {
			if(manager.getAnswer().equals("대리요청")) {
				workDAO.updateWorkManagerAnswer(wcode, manager.getEno(), "승인");
			}
		}

		workManagerList = workDAO.selectWorkManagerList(wcode);
		//업무 상태변경
		int answerCnt = 0;
		for(WorkManagerVO manager : workManagerList) {
			String answer = manager.getAnswer();
			if(answer.equals("대기") || answer.equals("이의신청")) {
				answerCnt += 1;
			}
		}

		if(answerCnt == 0) {
			for(WorkManagerVO manager : workManagerList) {
				int managerEno = manager.getEno();
				workDAO.updateWorkManagerAnswer(wcode, managerEno, "승인");
			}

			workDAO.updateWorkWstatus(wcode, "진행" , "B102");
			workDAO.updateHashTagClassCode(wcode, "B102");
			workDAO.deleteWorkReader(wcode);
		}

	}

	@Override
	public void modifyToReqWork(WorkModifyCommand modifyCommand) throws Exception {
		//data -> WorkVO
		WorkVO work = workDAO.selectWorkByWcode(modifyCommand.getWcode());
		work.setWcontent(modifyCommand.getWcontent());
		work.setWprogress(Integer.parseInt(modifyCommand.getWprogress()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		work.setWend(sdf.parse(modifyCommand.getWend()));
		work.setHashTag(modifyCommand.getHashTag());

		//업무내용 수정
		workDAO.updateToReq(work);
		//해쉬태그 수정
		workDAO.updateWorkHashTag(work);
		if(Integer.parseInt(modifyCommand.getWprogress()) == 100) {
			workDAO.updateWorkWstatus(work.getWcode(), "완료", "B103");
			workDAO.updateHashTagClassCode(work.getWcode(), "B103");
			workDAO.deleteWorkReader(work.getWcode());
		}
	}

	@Override
	public void reportRegist(ReportVO report) throws Exception {
		reportDAO.insertReport(report);
	}

	@Override
	public Map<String, Object> getReportList(String wcode, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ReportVO> reportList = reportDAO.selectReportList(wcode, cri);
		for(ReportVO report : reportList) {
			int eno = report.getEno();
			EmployeeVO writer = workDAO.selectEmpByNodeId(eno);
			report.setWriter(writer);
		}

		int totalCount = reportDAO.selectReportTotalCount(wcode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("reportList", reportList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public ReportVO getReportByRepNo(int repno) throws SQLException {
		ReportVO report = reportDAO.selectReportByRepNo(repno);
		int eno = report.getEno();
		EmployeeVO writer = workDAO.selectEmpByNodeId(eno);
		report.setWriter(writer);
		return report;
	}

	@Override
	public void removeReportFile(int repno) throws SQLException {
		reportDAO.deleteReportFile(repno);
	}

	@Override
	public void modifyReport(ReportVO report) throws SQLException {
		reportDAO.updateReport(report);
	}

	@Override
	public void deleteReport(int repno) throws SQLException {
		reportDAO.deleteReport(repno);
	}

	@Override
	public void proceedRegist(ProceedingVO proceed) throws SQLException {
		proDAO.insertProceed(proceed);
	}

	@Override
	public Map<String, Object> getProceedList(String wcode, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ProceedingVO> proceedList = proDAO.selectProceedList(wcode, cri);
		for(ProceedingVO proceed : proceedList) {
			int eno = proceed.getEno();
			EmployeeVO writer = workDAO.selectEmpByNodeId(eno);
			proceed.setWriter(writer);
		}

		int totalCount = proDAO.selectProceedTotalCount(wcode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("proceedList", proceedList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public ProceedingVO getProceedByProNo(int prono) throws SQLException {
		ProceedingVO proceed = proDAO.selectProceedByProNo(prono);
		int eno = proceed.getEno();
		EmployeeVO writer = workDAO.selectEmpByNodeId(eno);
		proceed.setWriter(writer);
		return proceed;
	}

	@Override
	public void removeProceedFile(int prono) throws SQLException {
		proDAO.deleteProceedFile(prono);
	}

	@Override
	public void modifyProceed(ProceedingVO proceed) throws SQLException {
		proDAO.updateProceed(proceed);
	}

	@Override
	public void deleteProceed(int prono) throws SQLException {
		proDAO.deleteProceed(prono);
	}

	@Override
	public Map<String, Object> getThisWeekMyWorkList(int eno, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		cri.setPerPageNum(5);
		List<WorkVO> thisWeekEndMyWorkList = workDAO.selectThisWeekEndMyWorkList(eno, cri);
		thisWeekEndMyWorkList = setWorkInfo(thisWeekEndMyWorkList);
		setWorkReadCheck(thisWeekEndMyWorkList, eno);
		int totalCount = workDAO.selectThisWeekEndMyWorkTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("thisWeekEndMyWorkList", thisWeekEndMyWorkList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getThisWeekToReqList(int eno, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		cri.setPerPageNum(5);
		List<WorkVO> thisWeekEndToReqList = workDAO.selectThisWeekEndToReqList(eno, cri);
		thisWeekEndToReqList = setWorkInfo(thisWeekEndToReqList);
		setWorkReadCheck(thisWeekEndToReqList, eno);
		int totalCount = workDAO.selectThisWeekEndToReqTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("thisWeekEndToReqList", thisWeekEndToReqList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getNotApproveMyWorkList(int eno, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		cri.setPerPageNum(5);
		List<WorkVO> notApproveMyWorkList = workDAO.selectNotApproveMyWorkList(eno, cri);
		notApproveMyWorkList = setWorkInfo(notApproveMyWorkList);
		setWorkReadCheck(notApproveMyWorkList, eno);
		int totalCount = workDAO.selectNotApproveMyWorkTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("notApproveMyWorkList", notApproveMyWorkList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> getWaitToReqWorkList(int eno, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);

		List<WorkVO> waitToReqWorkList = workDAO.selectWaitToReqWorkList(eno, cri);
		waitToReqWorkList = setWorkInfo(waitToReqWorkList);
		setWorkReadCheck(waitToReqWorkList, eno);
		int totalCount = workDAO.selectWaitToReqWorkTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("waitToReqWorkList", waitToReqWorkList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public WorkVO getWorkFromKnowHow(String wcode) throws SQLException {
		WorkVO work = workDAO.selectWorkByWcode(wcode);
		EmployeeVO requestBy = workDAO.selectWorkRequestBy(wcode);
		List<WorkManagerVO> workManagerList = workDAO.selectWorkManagerList(wcode);
		String hashTag = workDAO.selectHashTagByWcode(wcode);

		work.setWorkManagerList(workManagerList);
		work.setRequestBy(requestBy);
		work.setHashTag(hashTag);
		workDAO.increaseKnowHowViewCnt(wcode);
		return work;
	}

	@Override
	public void regist(WorkVO work, int dno, List<WorkManagerVO> workManagerList) throws Exception {
		int code = 0;
		String wcode = "";

		List<String> wcodeByDno = workDAO.selectWcodeByDno(dno);
		if(wcodeByDno != null && wcodeByDno.size() > 0) {
			String lastWcode = wcodeByDno.get(0);
			code = Integer.parseInt(lastWcode.substring(4));
		}

		code += 1;
		wcode = "W" + dno
				+ String.format( "%1$03d" , code );

		work.setWcode(wcode);

		workDAO.insertWork(work);
		workDAO.insertWorkHashTag(work);
		if(workManagerList != null) for(WorkManagerVO workManager : workManagerList) {
			workManager.setWcode(wcode);
			workDAO.insertWorkManager(workManager);
		}
		if (work.getAttachList() != null) for (AttachVO attach : work.getAttachList()) {
			String attachNo = workAttachDAO.selectWano();
			attach.setAttachNo(attachNo);
			attach.setRefNo(wcode);
			workAttachDAO.insertWorkAttach(attach);
		}
	}

	@Override
	public void workReportRegist(WorkReportVO workReport) throws SQLException {
		workDAO.insertWorkReport(workReport);
		workDAO.updateWorkManagerAnswer(workReport.getWcode(), workReport.getEno(), "신고");

	}

	@Override
	public Map<String, Object> getRelationMentoWorkList(Criteria cri, String wcode, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<WorkVO> relationMentoWork = workDAO.selectRelationMentoWork(cri, wcode, eno);

		int totalCount = workDAO.selectRelationMentoWorkCount(cri, wcode, eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);


		dataMap.put("relationMentoWork", relationMentoWork);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getWorkReportList(int result, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<WorkReportVO> workReportList = workDAO.selectWorkReportList(result, cri);

		int totalCount = workDAO.selectWorkReportListTotalCount(result);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("workReportList", workReportList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public WorkReportVO getWorkReportDetail(int wrepno) throws SQLException {
		return workDAO.selectWorkReportByWrepNo(wrepno);
	}

	@Override
	public void approveWorkReport(int wrepno) throws SQLException {
		workDAO.approveWorkReport(wrepno);

		WorkReportVO workReport = workDAO.selectWorkReportByWrepNo(wrepno);

		System.out.println(workReport.getWcode());
		System.out.println(workReport.getEno());
		workDAO.deleteWorkManager(workReport.getWcode(), workReport.getEno());


	}

	@Override
	public List<String> getHashTagListByWcode(String wcode) throws SQLException {
		return workDAO.selectHashTagListByWcode(wcode);
	}

	@Override
	public Map<String, Object> getWorkQnaList(Criteria cri, String wcode) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<QnaVO> workQnaList = qnaDAO.selectWorkQnaList(wcode, cri);
		for(QnaVO qna : workQnaList) {
			int eno = qna.getEno();
			EmployeeVO writer = workDAO.selectEmpByNodeId(eno);
			qna.setWriter(writer);
		}

		int totalCount = qnaDAO.selectWorkQnaTotalCount(wcode);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("workQnaList", workQnaList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getWorkQnaReplyList(Criteria cri, int qnaNo) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<QnaReplyVO> workQnaReplyList = qnaDAO.selectWorkQnaReplyList(qnaNo, cri);
		for(QnaReplyVO qnaReply : workQnaReplyList) {
			int eno = qnaReply.getEno();
			EmployeeVO writer = workDAO.selectEmpByNodeId(eno);
			qnaReply.setWriter(writer);
		}

		int totalCount = qnaDAO.selectWorkQnaReplyTotalCount(qnaNo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("workQnaReplyList", workQnaReplyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void registWorkQna(QnaVO qna) throws SQLException {
		qnaDAO.insertQna(qna);
	}

	@Override
	public void registWorkQnaReply(QnaReplyVO qnaReply) throws SQLException {
		qnaDAO.insertQnaReply(qnaReply);
	}

	@Override
	public void updateWorkQna(QnaVO qna) throws SQLException {
		qnaDAO.updateQna(qna);
	}

	@Override
	public void updateWorkQnaReply(QnaReplyVO qnaReply) throws SQLException {
		qnaDAO.updateQnaReply(qnaReply);
	}

	@Override
	public void removeWorkQna(int qnaNo) throws SQLException {
		qnaDAO.deleteQna(qnaNo);
	}

	@Override
	public void removeWorkQnaReply(int qrno) throws SQLException {
		qnaDAO.deleteQnaReply(qrno);
	}

	@Override
	public QnaVO getWorkQnaDetail(int qnaNo) throws SQLException {
		QnaVO qna = qnaDAO.selectWorkQnaDetail(qnaNo);
		EmployeeVO writer = workDAO.selectEmpByNodeId(qna.getEno());
		qna.setWriter(writer);
		return qna;
	}

	@Override
	public QnaReplyVO getWorkQnaReplyDetail(int qrno) throws SQLException {
		QnaReplyVO qnaReply = qnaDAO.selectWorkQnaReplyDetail(qrno);
		EmployeeVO writer = workDAO.selectEmpByNodeId(qnaReply.getEno());
		qnaReply.setWriter(writer);
		return qnaReply;
	}



}
