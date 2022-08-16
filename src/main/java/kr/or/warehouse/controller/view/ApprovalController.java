package kr.or.warehouse.controller.view;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.AllSignVO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.VacationVO;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.HrService;
import kr.or.warehouse.service.NewApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@Resource(name = "fileUploadPath")
	private String fileUploadPath;

	@Autowired
	private NewApprovalService newApprovalService;

	@Autowired
	private DepartMentService depService;

	@Autowired
	private HrService hrService;

	@RequestMapping("/main")
	public String main(HttpSession session, Model model) throws Exception {
		String url = "approval/main";

		return url;
	}

	@RequestMapping(value = "/registGo", method = RequestMethod.GET)
	public ModelAndView regist(Criteria cri, ModelAndView mnv, HttpServletRequest request,
			@RequestParam("sFormNo") String sFormNo) throws Exception {
		String url = "approval/regist";

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int dno = loginUser.getDno();

		int eno = loginUser.getEno();
		// System.out.println("sformno:"+sFormNo);

		// 관련문서
		Map<String, Object> dataMap = newApprovalService.getRelatedDocList(cri, sFormNo);

		// 참조자
		Map<String, Object> dataRefLine = newApprovalService.getRefLineList(cri);

		// 조직도
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organization = newApprovalService.organization(departMentList);

		// 결재자 리스트
		Map<String, Object> dataSignLine = newApprovalService.getSignLineList(cri, dno);

		// 개인결재선 그룹 리스트 - 그룹속한 사원들은 비동기로 보내기
		Map<String, Object> dataSignLineGr = newApprovalService.getSignLineGr(eno);
		System.out.println("organization : " + organization);

		VacationVO vacation = hrService.getVacation(eno);

		mnv.addObject("dataMap", dataMap);

		mnv.addObject("dataRefLine", dataRefLine);

		mnv.addObject("organization", organization);

		mnv.addObject("dataSignLine", dataSignLine);

		mnv.addObject("dataSignLineGr", dataSignLineGr);
		mnv.addObject("vacation", vacation);
		// System.out.println(dataSignLine.get("mySignLineList"));

		mnv.setViewName(url);

		return mnv;

	}

	// 문서저장
//	@RequestMapping(value = "/registSignDoc", method = RequestMethod.POST)
//	public String registSignDoc(SignDocVO signDoc, @RequestParam("signerMemberList") List<String> signerMemberList,
//			@RequestParam("reFMemberList") List<String> reFMemberList,
//			@RequestParam("viewerMemberList") List<String> viewerMemberList, HttpServletRequest request,
//			RedirectAttributes rttr) throws Exception {
//		// System.out.println("문서저장");
//		String url = "redirect:/approval/main.do";
//		System.out.println("컨트롤러 전체" + signDoc);
//		// System.out.println("signerMemberList:"+signerMemberList);
//
//		String savePath = this.fileUploadPath;
//		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(signDoc.getUploadFile(), savePath);
//
//		System.out.println("attachList컨트롤" + attachList);
//		signDoc.setAttachList(attachList);
//
//		newApprovalService.registSignDoc(signDoc, signerMemberList, reFMemberList, viewerMemberList);
//
//		rttr.addFlashAttribute("from", "regist");
//
//		return url;
//	}

	// 개인결재선 그룹 삭제
	@RequestMapping(value = "/removeSignGr", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String removeSignGr(String signGroupNo, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/approval/regist.do";

		newApprovalService.removeSignGr(signGroupNo);

		rttr.addAttribute("signGroupNo", signGroupNo);
		rttr.addFlashAttribute("from", "remove");
		return url;
	}

	// 결재문서함
	@RequestMapping("/approveList")
	public ModelAndView approveList(Criteria cri, @RequestParam(defaultValue = "1") int signState, ModelAndView mnv,
			HttpServletRequest request, HttpSession session) throws Exception {
		String url = "approval/approveList";

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = newApprovalService.readCheck(eno, "M122000");
		System.out.println(" noneCheckCnt : " + noneCheckCnt);
		Map<String, Object> dataMap = newApprovalService.getApproveList(cri, eno, signState);
		System.out.println("controller dataMap : " + dataMap);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("noneCheckCnt", noneCheckCnt);
		mnv.setViewName(url);

		return mnv;
	}

	// 기안문서함
	@RequestMapping("/draftList")
	public ModelAndView draftList(Criteria cri, @RequestParam(defaultValue = "1") int signState, ModelAndView mnv,
			HttpServletRequest request, HttpSession session) throws Exception {
		String url = "approval/draftList";

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = newApprovalService.readCheck(eno, "M124000");

		System.out.println("기안문서함 noneCheckCnt : ");

		Map<String, Object> dataMap = newApprovalService.getDraftList(cri, eno, signState);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("noneCheckCnt", noneCheckCnt);
		mnv.setViewName(url);

		return mnv;
	}

	// 참조문서함
	@RequestMapping("/viewerList")
	public ModelAndView viewerList(Criteria cri, @RequestParam(defaultValue = "1") int signState, ModelAndView mnv,
			HttpServletRequest request, HttpSession session) throws Exception {
		String url = "approval/viewerList";

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		System.out.println("test");
		Map<String, Integer> noneCheckCnt = null;
		noneCheckCnt = newApprovalService.readCheck(eno, "M123000");
		System.out.println("noneCheckCnt : " + noneCheckCnt);


		Map<String, Object> dataMap = newApprovalService.getViewerList(cri, eno, signState);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("noneCheckCnt", noneCheckCnt);
		mnv.setViewName(url);

		return mnv;
	}

	// 임시문서함
	@RequestMapping("/tempList")
	public ModelAndView tempList(Criteria cri, @RequestParam(defaultValue = "0") int signState, ModelAndView mnv,
			HttpServletRequest request, HttpSession session) throws Exception {
		String url = "approval/tempList";

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = newApprovalService.getTempList(cri, eno, signState);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		System.out.println("dataMap : " + dataMap);
		return mnv;
	}

	// 회람함
	@RequestMapping("/circulateList")
	public ModelAndView circulateList(Criteria cri, ModelAndView mnv, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "approval/circulateList";

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = newApprovalService.getCirculateList(cri, eno);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		System.out.println("dataMap : " + dataMap);
		return mnv;
	}

	// 상세보기
	@RequestMapping("/detailGo")
	public ModelAndView detail(Criteria cri, @RequestHeader Map<String, Object> requestHeader, String signNo, ModelAndView mnv, HttpSession session)
			throws Exception {
		String url = "approval/detail";
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		AllSignVO signDoc = null;
		AllSignVO allSign =  new AllSignVO();

		String sformNo = newApprovalService.getReSignDocBySignNo(signNo).getSformNo();
		System.out.println("cri: " + cri);
		allSign.setSignNo(signNo);
		allSign.setEno(loginUser.getEno());

		// 관련문서
		Map<String, Object> dataMap = newApprovalService.getRelatedDocList(cri, sformNo);


		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

		if (referMcode.equals("M121000")) {
			mnv.addObject("refer", referMcode);
			newApprovalService.updateSignerScehck(allSign);
		}
		if (referMcode.equals("M122000")) {
			mnv.addObject("refer", referMcode);
			newApprovalService.updateSignerScehck(allSign);
		}
		if (referMcode.equals("M123000")) {
			mnv.addObject("refer", referMcode);
			newApprovalService.updateSignViewerScehck(allSign);
		}
		if (referMcode.equals("M124000")) {
			mnv.addObject("refer", referMcode);
			newApprovalService.updateSingDocScehck(allSign);
		}
		if (referMcode.equals("M125000")) {
			mnv.addObject("refer", referMcode);
		}
		if (referMcode.equals("M126000")) {
			mnv.addObject("refer", referMcode);
		}
		signDoc = newApprovalService.getSignDocBySignNo(signNo);

		int cnt = newApprovalService.selectReaderCount(allSign);
		if(cnt < 1) {
			newApprovalService.insertSignReader(allSign);
		}

		// 파일명 재정의
		if (signDoc != null) {
			List<AttachVO> attachList = signDoc.getAttachList();
			if (attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		System.out.println("signDoc : "  + signDoc);

		mnv.addObject("signDoc", signDoc);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("loginUser", loginUser);
		mnv.setViewName(url);
		return mnv;
	}

	// 새창 상세보기
	@RequestMapping("/detail")
	public ModelAndView openDetail(Criteria cri, @RequestHeader Map<String, Object> requestHeader, String signNo, ModelAndView mnv, HttpSession session)
			throws Exception {
		String url = "approval/detail";
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		AllSignVO signDoc = null;
		AllSignVO allSign =  new AllSignVO();

		String sformNo = newApprovalService.getReSignDocBySignNo(signNo).getSformNo();
		System.out.println("cri: " + cri);
		allSign.setSignNo(signNo);
		allSign.setEno(loginUser.getEno());

		// 관련문서
		Map<String, Object> dataMap = newApprovalService.getRelatedDocList(cri, sformNo);


		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

		if (referMcode.equals("M120000") || referMcode.equals("M121000")) {
			mnv.addObject("refer", referMcode);
			newApprovalService.updateSignerScehck(allSign);
		}

		if(referMcode.equals("M000000")) {
			mnv.addObject("refer", referMcode);
			newApprovalService.updateSignerScehck(allSign);
		}
		signDoc = newApprovalService.getSignDocBySignNo(signNo);

		int cnt = newApprovalService.selectReaderCount(allSign);
		if(cnt < 1) {
			newApprovalService.insertSignReader(allSign);
		}

		// 파일명 재정의
		if (signDoc != null) {
			List<AttachVO> attachList = signDoc.getAttachList();
			if (attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		System.out.println("signDoc : "  + signDoc);

		mnv.addObject("signDoc", signDoc);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("loginUser", loginUser);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/getFile")
	public String getFile(String attachNo, Model model) throws Exception {
		String url = "downloadFile";

		AttachVO attach = newApprovalService.getSignAttachBySignAno(attachNo);

		model.addAttribute("savedPath", attach.getUploadPath());
		model.addAttribute("fileName", attach.getFileName());

		return url;
	}

	@RequestMapping(value = "/deleteSignDoc", method = RequestMethod.POST)
	public ModelAndView deleteSignDoc(String signNo, ModelAndView mnv, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/approval/draftList.do?mCode=M124000";

		System.out.println(signNo);
		newApprovalService.deleteSignDoc(signNo);
		newApprovalService.deleteHashTag(signNo);

		mnv.setViewName(url);
		rttr.addFlashAttribute("from", "remove");
		return mnv;
	}

	@RequestMapping(value = "/deleteTempSignDoc", method = RequestMethod.POST)
	public ModelAndView deleteTempSignDoc(String signNo, ModelAndView mnv, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/approval/tempList.do?mCode=M125000";

		System.out.println(signNo);
		newApprovalService.deleteSignDoc(signNo);
		newApprovalService.deleteHashTag(signNo);

		mnv.setViewName(url);
		rttr.addFlashAttribute("from", "tempRemove");
		return mnv;
	}

	// 재기안
	@RequestMapping("/reRegist")
	public ModelAndView reRegist(Criteria cri, String signNo, ModelAndView mnv) throws Exception {
		String url = "approval/reRegist";


		AllSignVO allSign = newApprovalService.getReSignDocBySignNo(signNo);
		System.out.println("allSign : " + allSign);

		// 조직도
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organization = newApprovalService.organization(departMentList);
		Map<String, Object> dataSignLineGr = newApprovalService.getSignLineGr(allSign.getEno());

		// 관련문서
		Map<String, Object> dataMap = newApprovalService.getRelatedDocList(cri, allSign.getSformNo());

		// 파일명 재정의
		if (allSign != null) {
			List<AttachVO> attachList = allSign.getAttachList();
			if (attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					if(fileName.length() >19) {
						fileName = fileName.substring(0, 13);
						fileName = fileName + "..." + fileName.substring(fileName.length()-5, fileName.length()) +"." + attach.getFileType().toLowerCase();
					}
					attach.setFileName(fileName);
				}
			}
		}


		mnv.addObject("allSign", allSign);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("organization", organization);
		mnv.addObject("dataSignLineGr", dataSignLineGr);
		mnv.setViewName(url);
		return mnv;
	}



	@RequestMapping("/vacationDoc")
	public ModelAndView teamHrList(Criteria cri, @RequestParam(defaultValue = "") String condition, ModelAndView mnv, HttpSession session)throws Exception {
		String url="approval/vacationDoc";

		System.out.println("condition : " + condition);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		Map<String, Object> dataMap = hrService.getSelectTeamHrList(cri, loginUser.getEno(), condition);

		Map<String, Integer> countMap = new HashMap<String, Integer>();
		int workingCount = hrService.selectTeamHrListCount(loginUser.getDno(), "업무중");
		int workoffCount = hrService.selectTeamHrListCount(loginUser.getDno(), "업무종료");
		int outCount = hrService.selectTeamHrListCount(loginUser.getDno(), "자리비움");

		int allCount = hrService.selectTeamHrListAllCount(loginUser.getDno());

		System.out.println("여기 : "+ workingCount + workoffCount + outCount);
		countMap.put("workingCount", workingCount);
		countMap.put("workoffCount", workoffCount);
		countMap.put("outCount", outCount);

		mnv.addObject("dataMap", dataMap);
		mnv.addObject("countMap", countMap);
		mnv.addObject("condition", condition);
		mnv.addObject("allCount", allCount);
		mnv.setViewName(url);
		return mnv;
	}
}
