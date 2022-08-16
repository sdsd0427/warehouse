package kr.or.warehouse.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.MentoringDAO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MentoringVO;
import kr.or.warehouse.dto.SubMentoringVO;
import kr.or.warehouse.dto.WorkVO;


@Service
public class MentoringServiceImpl implements MentoringService{
	@Autowired
	private MentoringDAO mentoringDAO;

	@Override
	public List<SubMentoringVO> getMyMentoListMain(int eno) throws Exception {
		List<SubMentoringVO> mentoList = mentoringDAO.selectMyMentoMain(eno);

		return mentoList;
	}
	@Override
	public int getMyMentoListCountMain(int eno) throws Exception {
		int count = mentoringDAO.selectMyMentoCountMain(eno);
		return count;
	}

	@Override
	public List<SubMentoringVO> getMyMenteeListMain(int eno) throws Exception {
		List<SubMentoringVO> menteeList = mentoringDAO.selectMyMenteeMain(eno);

		return menteeList;
	}
	@Override
	public int getMyMenteeListCountMain(int eno) throws Exception {
		int count = mentoringDAO.selectMyMenteeCountMain(eno);
		return count;
	}

	@Override
	public Map<String,Object> getMyMentoList(Criteria cri, int eno) throws Exception {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SubMentoringVO> mentoList = mentoringDAO.selectMyMento(cri, eno);
		System.out.println("mentoList : "+mentoList);

		int mentoCount = mentoringDAO.selectMyMentoCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mentoCount);

		dataMap.put("mentoList", mentoList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String,Object> getMyMenteeList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SubMentoringVO> menteeList = mentoringDAO.selectMyMentee(cri, eno);
		System.out.println("menteeList : " + menteeList);
		int menteeCount = mentoringDAO.selectMyMenteeCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(menteeCount);

		dataMap.put("menteeList", menteeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<SubMentoringVO> getMentoRank() throws Exception {
		List<SubMentoringVO> rankList = mentoringDAO.selectMentoRank();
		return rankList;
	}

	@Override
	public Map<String, Object> getSubMentoringList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> subMentoringList = mentoringDAO.subMentoringList(cri, eno);


		int totalCount = mentoringDAO.subMentoringListCount(cri,eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("subMentoringList", subMentoringList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getEndMentoringList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> endMentoringList = mentoringDAO.endMentoringList(cri, eno);

		//System.out.println("endMentoringList : " + endMentoringList);
		int endCount = mentoringDAO.endMentoringListCount(cri,eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(endCount);

		dataMap.put("endMentoringList", endMentoringList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<WorkVO> getMyWorkList(int eno) throws Exception {
		//System.out.println("workservice");
		List<WorkVO> myWorkList = mentoringDAO.myWorkList(eno);
		return myWorkList;
	}

	@Override
	public void apply(SubMentoringVO subMentoring) throws Exception {
		String smno = mentoringDAO.selectSmno();
		subMentoring.setSmno(smno);

		String photo = mentoringDAO.selectPhoto(subMentoring.getMento());
		subMentoring.setPhoto(photo);
		mentoringDAO.applyMentoring(subMentoring);
	}

	@Override
	public int getSubMentoring(int mento, int mentee) throws Exception {
		int cnt = mentoringDAO.subMentoring(mento, mentee);
		return cnt;
	}

	@Override
	public Map<String, Object> getMyMentoWorkList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> myMentoWorkList = mentoringDAO.myMentoWorkList(cri, eno);

		int totalCount = mentoringDAO.myMentoWorkListCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myMentoWorkList", myMentoWorkList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getMyMentoDocList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> myMentoDocList = mentoringDAO.myMentoDocList(cri, eno);

		int totalCount = mentoringDAO.myMentoDocListCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myMentoDocList", myMentoDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void removeMentoring(String smno) throws Exception {
		mentoringDAO.endMentoring(smno);
	}

	@Override
	public Map<String, Object> getMyMenteeWorkList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> myMenteeWorkList = mentoringDAO.myMenteeWorkList(cri, eno);

		int totalCount = mentoringDAO.myMenteeWorkListCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myMenteeWorkList", myMenteeWorkList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getMyMenteeDocList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> myMenteeDocList = mentoringDAO.myMenteeDocList(cri, eno);

		int totalCount = mentoringDAO.myMenteeDocListCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myMenteeDocList", myMenteeDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void exdateApply(SubMentoringVO subMentoring) throws Exception {
		mentoringDAO.exdateApply(subMentoring);
	}

	@Override
	public SubMentoringVO getSubMenteeDetail(String smno) throws Exception {
		SubMentoringVO mentee = mentoringDAO.subMenteeDetail(smno);

		return mentee;
	}

	@Override
	public void acceptMentoring(MentoringVO mentoring) throws Exception {
		String mtno = mentoringDAO.selectMtno();
		mentoring.setMtno(mtno);

		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);

		if(mentoring.getPeriod() == 0) {
			cal.add(Calendar.MONTH, 6);
		}else {
			cal.add(Calendar.MONTH, 12);
		}
		mentoring.setEndDate(cal.getTime());

		mentoringDAO.acceptMentoring(mentoring);
	}

	@Override
	public Map<String,Object> getSysdateMentoWork(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> sysdateMentoWork = mentoringDAO.sysdateMentoWork(cri, eno);

		int totalCount = mentoringDAO.sysdateMentoWorkCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("sysdateMentoWork", sysdateMentoWork);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String,Object> getSysdateMenteeWork(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SubMentoringVO> sysdateMenteeWork = mentoringDAO.sysdateMenteeWork(cri, eno);

		int totalCount = mentoringDAO.sysdateMenteeWorkCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("sysdateMenteeWork", sysdateMenteeWork);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String,Object> getSysdateMentoringAllWork(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("allWork service");
		List<SubMentoringVO> sysdateAllWork = mentoringDAO.sysdateMentoringAllWork(cri, eno);

		int totalCount = mentoringDAO.sysdateMentoringAllWorkCount(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("sysdateAllWork", sysdateAllWork);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void read(String smno) throws Exception {
		mentoringDAO.updateReadCheck(smno);
	}
	@Override
	public void deleteEndDateMentoring() throws Exception {
		System.out.println("deleteEndDateMentoring service");
		mentoringDAO.deleteEndDateMentoring();
	}
	@Override
	public List<SubMentoringVO> getRecommendMbti(int eno) throws Exception {
		List<SubMentoringVO> recommendMbti = mentoringDAO.recommendMbti(eno);

		return recommendMbti;
	}
	@Override
	public void deleteSubMentoring(String smno) throws Exception {
		mentoringDAO.refuseSubMentoring(smno);
	}
	@Override
	public List<EmployeeVO> getMbtiList(int eno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}







}
