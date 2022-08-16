package kr.or.warehouse.controller.view;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.MakeFileName;
import kr.or.warehouse.controller.rest.GetAttachesByMultipartFileAdatpter;
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
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.WorkService;

@Controller
@RequestMapping("/work")
public class WorkController {
	@Autowired
	private WorkService workService;

	@Autowired
	private DepartMentService depService;


	@Resource(name="fileUploadPath")
	private String fileUploadPath;

	@RequestMapping("/main")
	public String main(Model model, HttpSession session, Criteria cri) throws Exception{
		String url = "work/main";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = workService.getNoneCheckCnt("M113000", cri, loginUser.getEno(), loginUser.getDno());
		model.addAttribute("noneCheckCnt", noneCheckCnt);

		return url;
	}

	/**
	 * 내 업무리스트 출력(동기화)
	 * @param model
	 * @param cri -> pagination 설정정보(페이지:page, 한 페이지에 보여줄 데이터 수:perPageNum, 검색카테고리:searchType, 검색키워드:keyword)
	 * @param statusNo -> 업무 상태(0:대기, 1:진행, 2:완료, 3:이의신청, 4:협업요청, 5:대리요청, 6:전체)
	 * @return String model에 데이터를 심어서 보낼 화면 url
	 * @throws Exception
	 */
	@RequestMapping("/myWorkList")
	public String myWorkList(Model model, Criteria cri, @RequestParam(defaultValue = "0") int statusNo, HttpSession session) throws Exception{
		String url = "work/myWorkList";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = workService.getNoneCheckCnt("M113000",cri,loginUser.getEno(), loginUser.getDno());
		Map<String, Object> dataMap = workService.getMyWorkList(cri, statusNo,loginUser.getEno());

		System.out.println(dataMap.get("pageMaker"));
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("noneCheckCnt", noneCheckCnt);

		return url;
	}

	/**
	 * 내가 요청한 업무리스트 출력(동기화)
	 * @param model
	 * @param cri -> pagination 설정정보(페이지:page, 한 페이지에 보여줄 데이터 수:perPageNum, 검색카테고리:searchType, 검색키워드:keyword)
	 * @param statusNo -> 업무 상태(0:대기, 1:진행, 2:완료, 3:이의신청, 4:협업요청, 5:대리요청, 6:전체)
	 * @return String model에 데이터를 심어서 보낼 화면 url
	 * @throws Exception
	 */
	@RequestMapping("/toReqList")
	public String toReqList(Model model, Criteria cri, @RequestParam(defaultValue = "0") int statusNo, HttpSession session) throws Exception{
		String url = "work/toReqList";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = workService.getNoneCheckCnt("M114000",cri,loginUser.getEno(), loginUser.getDno());
		Map<String, Object> dataMap = workService.getToReqList(cri, statusNo, loginUser.getEno());

		model.addAttribute("dataMap", dataMap);
		model.addAttribute("noneCheckCnt", noneCheckCnt);

		return url;
	}

	/**
	 * 부서 목록 출력(동기화)
	 * @param model
	 * @param cri -> pagination 설정정보(페이지:page, 한 페이지에 보여줄 데이터 수:perPageNum, 검색카테고리:searchType, 검색키워드:keyword)
	 * @param statusNo -> 업무 상태(0:대기, 1:진행, 2:완료, 3:이의신청, 4:협업요청, 5:대리요청, 6:전체)
	 * @return String model에 데이터를 심어서 보낼 화면 url
	 * @throws Exception
	 */
	@RequestMapping("/depWorkList")
	public String depWorkList(Model model, Criteria cri, @RequestParam(defaultValue = "0") int statusNo, HttpSession session) throws Exception{
		String url = "work/depWorkList";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = workService.getNoneCheckCnt("M115000",cri,loginUser.getEno(), loginUser.getDno());
		Map<String, Object> dataMap = workService.getDepWorkList(cri, statusNo, loginUser.getEno(), loginUser.getDno());

		model.addAttribute("dataMap", dataMap);
		model.addAttribute("noneCheckCnt", noneCheckCnt);

		return url;
	}

	@RequestMapping("/declareList")
	public String declareList(@RequestParam(defaultValue = "0")int result, Criteria cri, Model model) throws Exception{
		String url = "work/declareList";

		Map<String, Object> dataMap = workService.getWorkReportList(result, cri);

		model.addAttribute("dataMap",dataMap);
		model.addAttribute("result", result);
		return url;
	}

	@RequestMapping("/getWorkReportDetail")
	public String getWorkReportDetail(int wrepno, Model model) throws Exception{
		String url = "work/workReportDetail";

		WorkReportVO workReportDetail = workService.getWorkReportDetail(wrepno);

		model.addAttribute("workReport", workReportDetail);
		return url;
	}

	//대기중 상세
	@RequestMapping("/waitDetail")
	public String waitDetail(@RequestHeader Map<String, Object> requestHeader, @RequestParam String wcode, Model model, HttpSession session) throws Exception{
		String url = "work/waitDetail";

		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

		if(referMcode.contains("M113")) {
			model.addAttribute("refer", referMcode);
		}else if(referMcode.contains("M114")) {
			model.addAttribute("refer", referMcode);
		}else if(referMcode.contains("M115")){
			model.addAttribute("refer",referMcode);
		}else if(referMcode.contains("M112") || referMcode.contains("M110")) {
			model.addAttribute("refer", referMcode);
		}

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		WorkVO work = workService.getWorkByWcode(wcode, loginUser.getEno());
		List<String> tagList = workService.getHashTagListByWcode(wcode);

		model.addAttribute("work", work);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("tagList", tagList);
		return url;
	}

	//진행중 상세
	@RequestMapping(value = "/workDetailGo", method=RequestMethod.GET)
	public String workDetailGo(@RequestHeader Map<String, Object> requestHeader, @RequestParam String wcode, Model model, HttpSession session) throws Exception{
		String url = "work/workDetail";

		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		CooperReqVO cooperReq = workService.getCooperReq(wcode);
		ProxyReqVO proxyReq = workService.getProxyReq(wcode);
		if(cooperReq != null) {
			model.addAttribute("cooperReq", cooperReq);
		}
		if(proxyReq != null) {
			model.addAttribute("proxyReq", proxyReq);
		}

		if(referMcode.contains("M113")) {
			model.addAttribute("refer", referMcode);
		}else if(referMcode.contains("M114")) {
			model.addAttribute("refer", referMcode);
		}else if(referMcode.contains("M115")){
			model.addAttribute("refer",referMcode);
		}else if(referMcode.contains("M112") || referMcode.contains("M110")) {
			model.addAttribute("refer", referMcode);
		}
		System.out.println(wcode);
		WorkVO work = workService.getWorkByWcode(wcode, loginUser.getEno());
		List<String> tagList = workService.getHashTagListByWcode(wcode);

		model.addAttribute("tagList",tagList);
		model.addAttribute("work", work);
		model.addAttribute("loginUser", loginUser);

		return url;
	}

	//새창상세
	@RequestMapping("/workDetail")
	public String workDetail(@RequestHeader Map<String, Object> requestHeader, Model model, String wcode, HttpSession session) throws Exception{
		String url = "work/workDetail";

		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.indexOf("=") + 1);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		if(referMcode.contains("M13")) {
			model.addAttribute("refer", "M13");
		}
		if(referMcode.contains("M00")) {
			model.addAttribute("refer", "M00");
		}

		CooperReqVO cooperReq = workService.getCooperReq(wcode);
		ProxyReqVO proxyReq = workService.getProxyReq(wcode);
		if(cooperReq != null) {
			model.addAttribute("cooperReq", cooperReq);
		}
		if(proxyReq != null) {
			model.addAttribute("proxyReq", proxyReq);
		}

		WorkVO work = workService.getWorkByWcode(wcode, loginUser.getEno());
		List<String> tagList = workService.getHashTagListByWcode(wcode);

		model.addAttribute("work", work);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("tagList", tagList);

		return url;
	}

	@RequestMapping("/knowhowDetail")
	public String knowhowDetail(Model model, String wcode) throws Exception{
		String url = "work/knowhowDetail";

		WorkVO work = workService.getWorkFromKnowHow(wcode);

		model.addAttribute("work", work);

		return url;
	}

	@RequestMapping("/reportRegistForm")
	public String reportRegistForm(String wcode, HttpSession session, Model model) throws Exception{
		String url = "work/reportRegistForm";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		model.addAttribute("wcode", wcode);
		model.addAttribute("loginUser", loginUser);

		return url;
	}

	@RequestMapping("/proceedRegistForm")
	public String proceedRegistForm(String wcode, HttpSession session, Model model) throws Exception{
		String url = "work/proceedRegistForm";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		model.addAttribute("wcode", wcode);
		model.addAttribute("loginUser", loginUser);

		return url;
	}


	@RequestMapping("/workRegistForm")
	public String workRegistForm(Model model, HttpSession session) throws Exception{
		String url = "work/workRegistForm";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		EmployeeVO emp = workService.getEmpByNodeId(eno);

		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);

		model.addAttribute("emp", emp);
		model.addAttribute("organizationNode", organizationNode);
		return url;
	}

	@RequestMapping(value="/workRegist", method=RequestMethod.POST, produces="text/plain; charset=utf-8")
	public String workRegist(WorkVO work, int dno, int wmstep, @RequestParam List<Integer> workManagerEno,  RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String url = "redirect:/work/workRegistForm.do";

		WorkManagerVO workManager = null;
		List<WorkManagerVO> workManagerList = new ArrayList<WorkManagerVO>();
		if(workManagerEno != null) for(int eno : workManagerEno) {
			workManager = new WorkManagerVO();
			workManager.setEno(eno);
			if(eno == wmstep) {
				workManager.setWmstep(1);
			} else {
				workManager.setWmstep(0);
			}
			workManagerList.add(workManager);
		}

		//파일 업로드
		String savePath = this.fileUploadPath;
	    List<AttachVO>attachList = GetAttachesByMultipartFileAdatpter.save(work.getUploadFile(),savePath);

		work.setWtitle((String)request.getAttribute("XSSwtitle"));
		work.setAttachList(attachList);
		workService.regist(work, dno, workManagerList);

		rttr.addFlashAttribute("retWorkManagerEno", workManagerEno);
		rttr.addFlashAttribute("retWorkTitle", work.getWtitle());
		rttr.addFlashAttribute("from", "regist");
		return url;
	}


	@RequestMapping("/toReqModifyForm")
	public String toReqModifyForm(@RequestHeader Map<String, Object> requestHeader, String wcode, @RequestParam(defaultValue = "0")int eno , Model model, HttpSession session) throws Exception{
		String url = "work/workModifyForm";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

		WorkVO work = workService.getWorkByWcode(wcode, loginUser.getEno());
		if(work.getWstatus().equals("대기")) {
			url = "work/waitWorkModifyForm";
		}
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);

		System.out.println("referMcode : " + referMcode);
		CooperReqVO cooperReq = workService.getCooperReq(wcode);
		System.out.println("cooperReq : " + cooperReq);
		ObjectionVO objection = workService.getObjection(wcode,eno,0);
		ProxyReqVO proxyReq = workService.getProxyReq(wcode);
		if(objection != null) {
			model.addAttribute("objection", objection);
		}
		if(cooperReq != null) {
			model.addAttribute("cooperReq", cooperReq);
		}
		if(proxyReq != null) {
			model.addAttribute("proxyReq", proxyReq);
		}
		if(referMcode.contains("M114")) {
			model.addAttribute("refer", referMcode);
		}else if(referMcode.contains("M115")){
			model.addAttribute("refer",referMcode);
		}else if(referMcode.contains("M112") || referMcode.contains("M110")) {
			model.addAttribute("refer",referMcode);
		}

		if(referMcode.contains("M13")) {
			model.addAttribute("refer", "M13");
		}
		if(referMcode.contains("M00")) {
			model.addAttribute("refer", "M00");
		}
		model.addAttribute("organizationNode", organizationNode);


		model.addAttribute("work", work);
		return url;
	}

	@RequestMapping(value = "/toReqModifyGo", method=RequestMethod.GET)
	public String myWorkModify(@RequestHeader Map<String, Object> requestHeader, String wcode, @RequestParam(defaultValue = "0")int eno , Model model, HttpSession session) throws Exception{
		String url = "work/workModifyForm";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

		WorkVO work = workService.getWorkByWcode(wcode, loginUser.getEno());
		if(work.getWstatus().equals("대기")) {
			url = "work/waitWorkModifyForm";
		}
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);

		System.out.println("referMcode : " + referMcode);
		CooperReqVO cooperReq = workService.getCooperReq(wcode);
		ObjectionVO objection = workService.getObjection(wcode,eno,0);
		ProxyReqVO proxyReq = workService.getProxyReq(wcode);
		if(objection != null) {
			model.addAttribute("objection", objection);
		}
		if(cooperReq != null) {
			model.addAttribute("cooperReq", cooperReq);
		}
		if(proxyReq != null) {
			model.addAttribute("proxyReq", proxyReq);
		}
		if(referMcode.contains("M114")) {
			model.addAttribute("refer", referMcode);
		}else if(referMcode.contains("M115")){
			model.addAttribute("refer",referMcode);
		}else if(referMcode.contains("M112") || referMcode.contains("M110")) {
			model.addAttribute("refer",referMcode);
		}
		model.addAttribute("organizationNode", organizationNode);


		model.addAttribute("work", work);
		return url;
	}

	@RequestMapping(value = "reportRegist", method=RequestMethod.POST)
	public String reportRegist(ReportVO report, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String url = "redirect:/work/reportRegistForm.do";

		String uploadPath = fileUploadPath;
		List<AttachVO> attach = GetAttachesByMultipartFileAdatpter.save(report.getUploadFile(), uploadPath);
		if(attach != null && attach.size() > 0) {
			report.setFileName(attach.get(0).getFileName());
			report.setUploadPath(uploadPath);
		}
		report.setTitle((String)request.getAttribute("XSStitle"));

		workService.reportRegist(report);
		rttr.addFlashAttribute("from", "reportRegist");

		return url;
	}

	@RequestMapping("/getReportDetail")
	public String getReportDetail(int repno, Model model, HttpSession session) throws Exception{
		String url = "work/reportDetail";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		ReportVO report = workService.getReportByRepNo(repno);
		String fileName = report.getFileName();
		if(fileName != null) {
			String parseFileNameFromUUID = MakeFileName.parseFileNameFromUUID(fileName, "\\$\\$");
			report.setFileName(parseFileNameFromUUID);
		}
		model.addAttribute("report", report);
		model.addAttribute("loginUser", loginUser);

		return url;
	}

	@RequestMapping("/getReportFile")
	public String getReportFile(int repno, Model model) throws Exception{
		String url ="downloadFile";

		ReportVO report = workService.getReportByRepNo(repno);
		String fileName = report.getFileName();
		String uploadPath = report.getUploadPath();
		model.addAttribute("fileName", fileName);
		model.addAttribute("savedPath", uploadPath);

		return url;
	}

	@RequestMapping("/getWorkFile")
	public String getWorkFile(int repno, Model model) throws Exception{
		String url ="downloadFile";

		ReportVO report = workService.getReportByRepNo(repno);
		String fileName = report.getFileName();
		String uploadPath = report.getUploadPath();
		model.addAttribute("fileName", fileName);
		model.addAttribute("savedPath", uploadPath);

		return url;
	}

	@RequestMapping("/reportModifyForm")
	public String reportModifyForm(int repno, Model model) throws Exception{
		String url = "work/reportModifyForm";

		ReportVO report = workService.getReportByRepNo(repno);
		String fileName = report.getFileName();
		if(fileName != null) {
			String parseFileNameFromUUID = MakeFileName.parseFileNameFromUUID(fileName, "\\$\\$");
			report.setFileName(parseFileNameFromUUID);
		}
		model.addAttribute("report", report);

		return url;
	}

	@RequestMapping(value = "/reportModify", method=RequestMethod.POST)
	public String reportModify(ReportVO report, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String url = "redirect:/work/getReportDetail.do?repno=" + report.getRepNo();


		if (report.getDeleteFile() != null) {
				File deleteFile = new File(fileUploadPath, report.getDeleteFile());

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				workService.removeReportFile(report.getRepNo());
		}

		List<AttachVO> attach = GetAttachesByMultipartFileAdatpter.save(report.getUploadFile(), fileUploadPath);
		if(attach != null && attach.size() > 0) {
			report.setFileName(attach.get(0).getFileName());
			report.setUploadPath(fileUploadPath);
		}

		report.setTitle((String)request.getAttribute("XSStitle"));
		workService.modifyReport(report);
		rttr.addFlashAttribute("from", "modify");
		return url;
	}

	@RequestMapping("/reportDelete")
	public String reportDelete(int repno, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/work/myWorkList.do";

		ReportVO report = workService.getReportByRepNo(repno);

		if(report.getFileName() != null) {
			File deleteFile = new File(fileUploadPath, report.getFileName());

			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}

		workService.deleteReport(repno);
		rttr.addFlashAttribute("from", "reportDelete");

		return url;
	}

	@RequestMapping(value = "/proceedRegist", method=RequestMethod.POST)
	public String proceedRegist(ProceedingVO proceed, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String url = "redirect:/work/proceedRegistForm.do";

		String uploadPath = fileUploadPath;
		List<AttachVO> attach = GetAttachesByMultipartFileAdatpter.save(proceed.getUploadFile(), uploadPath);
		if(attach != null && attach.size() > 0) {
			proceed.setFileName(attach.get(0).getFileName());
			proceed.setUploadPath(uploadPath);
		}
		proceed.setTitle((String)request.getAttribute("XSStitle"));

		workService.proceedRegist(proceed);
		rttr.addFlashAttribute("from", "proceedRegist");

		return url;
	}

	@RequestMapping("/getProceedDetail")
	public String getProceedDetail(int prono, Model model,HttpSession session) throws Exception {
		String url = "work/proceedDetail";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		ProceedingVO proceed = workService.getProceedByProNo(prono);
		String fileName = proceed.getFileName();
		if(fileName != null) {
			String parseFileNameFromUUID = MakeFileName.parseFileNameFromUUID(fileName, "\\$\\$");
			proceed.setFileName(parseFileNameFromUUID);
		}
		model.addAttribute("proceed", proceed);
		model.addAttribute("loginUser", loginUser);

		return url;
	}

	@RequestMapping("/proceedModifyForm")
	public String proceedModifyForm(int prono, Model model) throws Exception{
		String url = "work/proceedModifyForm";

		ProceedingVO proceed = workService.getProceedByProNo(prono);
		String fileName = proceed.getFileName();
		if(fileName != null) {
			String parseFileNameFromUUID = MakeFileName.parseFileNameFromUUID(fileName, "\\$\\$");
			proceed.setFileName(parseFileNameFromUUID);
		}
		model.addAttribute("proceed", proceed);

		return url;
	}

	@RequestMapping(value = "/proceedModify", method=RequestMethod.POST)
	public String proceedModify(ProceedingVO proceed, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/work/getProceedDetail.do?prono=" + proceed.getProNo();

		if(proceed.getDeleteFile() != null) {
			File deleteFile = new File(fileUploadPath, proceed.getDeleteFile());

			if(deleteFile.exists()) {
				deleteFile.delete();
			}
			workService.removeProceedFile(proceed.getProNo());
		}

		List<AttachVO> attach = GetAttachesByMultipartFileAdatpter.save(proceed.getUploadFile(), fileUploadPath);
		if(attach != null && attach.size() > 0) {
			proceed.setFileName(attach.get(0).getFileName());
			proceed.setUploadPath(fileUploadPath);
		}

		proceed.setTitle((String)request.getAttribute("XSStitle"));
		workService.modifyProceed(proceed);
		rttr.addFlashAttribute("from", "modify");
		return url;
	}

	@RequestMapping("/getProceedFile")
	public String getProceedFile(int prono, Model model) throws Exception{
		String url = "downloadFile";

		ProceedingVO proceed = workService.getProceedByProNo(prono);

		model.addAttribute("fileName", proceed.getFileName());
		model.addAttribute("savedPath", proceed.getUploadPath());

		return url;
	}

	@RequestMapping("/proceedDelete")
	public String proceedDelete(int prono, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/work/myWorkList.do";

		ProceedingVO proceed = workService.getProceedByProNo(prono);
		if(proceed.getFileName() != null) {
			File deleteFile = new File(fileUploadPath, proceed.getFileName());

			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}

		workService.deleteProceed(prono);
		rttr.addFlashAttribute("from", "proceedDelete");
		return url;
	}

	@RequestMapping("/approveWorkReport")
	public String approveWorkReport(int wrepno, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/work/declareList.do";

		workService.approveWorkReport(wrepno);

		rttr.addFlashAttribute("from", "approve");
		return url;
	}

	@RequestMapping("/qnaRegistForm")
	public String qnaRegistForm(String wcode, HttpSession session, Model model) throws Exception{
		String url = "work/qnaRegistForm";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		model.addAttribute("loginUser", loginUser);
		model.addAttribute("wcode", wcode);

		return url;
	}

	@RequestMapping("/qnaRegist")
	public String qnaRegist(QnaVO qna, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String url = "redirect:/work/qnaRegistForm";

		qna.setTitle((String)request.getAttribute("XSStitle"));
		workService.registWorkQna(qna);


		rttr.addFlashAttribute("from", "qnaRegist");
		return url;
	}

	@RequestMapping("/getQnaDetail")
	public String getQnaDetail(int qnaNo, Model model, HttpSession session) throws Exception{
		String url = "work/qnaDetail";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		QnaVO qna = workService.getWorkQnaDetail(qnaNo);

		model.addAttribute("qna", qna);
		model.addAttribute("loginUser", loginUser);

		return url;
	}

	@RequestMapping("/qnaModifyForm")
	public String qnaModifyForm(int qnaNo, Model model) throws Exception{
		String url = "work/qnaModifyForm";

		QnaVO qna = workService.getWorkQnaDetail(qnaNo);

		model.addAttribute("qna", qna);

		return url;
	}

	@RequestMapping("/qnaModify")
	public String qnaModify(QnaVO qna, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String url = "redirect:/work/getQnaDetail.do?qnaNo=" + qna.getQnaNo();

		qna.setTitle((String)request.getAttribute("XSStitle"));
		workService.updateWorkQna(qna);

		rttr.addFlashAttribute("from", "qnaModify");

		return url;
	}

	@RequestMapping("/qnaDelete")
	public String qnaDelete(int qnaNo, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/work/myWorkList.do";

		workService.removeWorkQna(qnaNo);

		rttr.addFlashAttribute("from", "qnaDelete");

		return url;
	}

	@RequestMapping("/qnaReplyRegist")
	public String qnaReplyRegist(QnaReplyVO qnaReply, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/work/getQnaDetail.do?qnaNo=" + qnaReply.getQnano();


		workService.registWorkQnaReply(qnaReply);

		rttr.addFlashAttribute("from", "replyRegist");

		return url;
	}

	@RequestMapping("/removeQnaReply")
	public String removeQnaReply(int qrno, RedirectAttributes rttr) throws Exception{
		QnaReplyVO qnaReply = workService.getWorkQnaReplyDetail(qrno);
		String url = "redirect:/work/getQnaDetail.do?qnaNo=" + qnaReply.getQnano();


		workService.removeWorkQnaReply(qrno);

		rttr.addFlashAttribute("from", "replyRemove");

		return url;
	}


}
