package kr.or.warehouse.controller.view;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.MakeFileName;
import kr.or.warehouse.controller.rest.GetAttachesByMultipartFileAdatpter;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.MtoVO;
import kr.or.warehouse.dto.PdsVO;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.MailService;
import kr.or.warehouse.service.PdsService;
import kr.or.warehouse.service.WorkService;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MailService mailService;
	@Autowired
	private WorkService workService;
	@Autowired
	private DepartMentService depService;
	@Autowired
	private PdsService pdsService;

	@Resource(name = "fileUploadPath")
	private String fileUploadPath;

	@RequestMapping("/main")
	public ModelAndView mail(Criteria cri, ModelAndView mnv, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "/mail/main";

		// session에서 eno 가져오기
//		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = mailService.getMailList(cri, eno);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/sendMail")
	public ModelAndView sendMail(Criteria cri, ModelAndView mnv, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "/mail/sendMail";

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = mailService.getSendMailList(cri, eno);
//		System.out.println(dataMap.get("SendMailList"));
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/tempMail")
	public ModelAndView tempMail(Criteria cri, ModelAndView mnv, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "/mail/tempMail";

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = mailService.getTempMailList(cri, eno);
//		System.out.println(dataMap.get("imporMailList"));
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/importantMail")
	public ModelAndView importantMail(Criteria cri, ModelAndView mnv, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "/mail/importantMail";

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = mailService.getImporMailList(cri, eno);
//		System.out.println(dataMap.get("imporMailList"));
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/trash")
	public ModelAndView trash(Criteria cri, ModelAndView mnv, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "/mail/trash";

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = mailService.getTrashMailList(cri, eno);
//		System.out.println(dataMap.get("trashMailList"));
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/toMeMail")
	public ModelAndView toMeMail(Criteria cri, ModelAndView mnv, HttpSession session) throws Exception {
		String url = "/mail/toMeMail";

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		Map<String, Object> dataMap = mailService.getToMeMailList(cri, eno);
//		System.out.println(dataMap.get("toMeMailList"));
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/registFormGo")
	public ModelAndView send(ModelAndView mnv, @RequestParam(defaultValue = "") String mailNo) throws Exception {
		String url = "/mail/registForm";

		if (!"".equals(mailNo)) {
			MailVO mail = mailService.getMail(mailNo);
			// 나중에 여러명이 되면 List로 바꿔라
			List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
			if (mail.getMtoList().size() > 0) {
				for(MtoVO mto : mail.getMtoList()) {
					EmployeeVO emp = workService.getEmpByNodeId(mto.getEno());
					employeeList.add(emp);
				}
			}
			
			// 파일명 재정의
			if (mail != null) {
				List<AttachVO> attachList = mail.getAttachList();
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
			
			mnv.addObject("mail", mail);
			mnv.addObject("employeeList", employeeList);
		}

		
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);

		mnv.addObject("organizationNode", organizationNode);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	@RequestMapping("/registForm")
	public ModelAndView send2(ModelAndView mnv, int mFrom) throws Exception {
		String url = "/mail/openRegistForm";

		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
		EmployeeVO emp = workService.getEmpByNodeId(mFrom);
		employeeList.add(emp);

		mnv.addObject("employeeList", employeeList);
		mnv.addObject("organizationNode", organizationNode);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/joinCommuEmpregistForm")
	public ModelAndView joinCommuEmpregistForm(ModelAndView mnv, @RequestParam(value="eno",required=true) List<Integer> eno) throws Exception {
		String url = "/mail/openRegistForm";
		
		List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
		for(int e : eno) {
			EmployeeVO emp = workService.getEmpByNodeId(e);
			employeeList.add(emp);
		}
		
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		
		mnv.addObject("employeeList", employeeList);
		mnv.addObject("organizationNode", organizationNode);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/resendRegistFormGo")
	public ModelAndView send(ModelAndView mnv, int mFrom) throws Exception {
		String url = "/mail/registForm";

		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
		EmployeeVO emp = workService.getEmpByNodeId(mFrom);
		employeeList.add(emp);

		mnv.addObject("employeeList", employeeList);
		mnv.addObject("organizationNode", organizationNode);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping(value = "/joinCommuEmpMailRegist", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String joinCommuEmpMailRegist(MailVO mail, @RequestParam(value="receiver",required=true) List<Integer> receiver, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/mail/main.do?mCode=M210000";
		
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(mail.getUploadFile(), savePath);
		
		mail.setTitle((String) request.getAttribute("XSStitle"));
		mail.setAttachList(attachList);
		
		mailService.regist(mail, receiver);
		
		rttr.addFlashAttribute("from", "commuRegist");
		
		return url;
	}

	@RequestMapping("/detailGo")
	public ModelAndView detail(String mailNo, String test, String from, int eno, ModelAndView mnv) throws Exception {
		String url = "/mail/detail";
		MailVO mail = null;
		MailVO mtoMail = new MailVO();

		mail = mailService.getMail(mailNo);
		
		mtoMail.setMailNo(mailNo);
		mtoMail.setmFrom(eno);

		mailService.mailMtoCheck(mtoMail);

		// 파일명 재정의
		if (mail != null) {
			List<AttachVO> attachList = mail.getAttachList();
			if (attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}
		
		mnv.addObject("mail", mail);
		mnv.addObject("test", test);
		mnv.addObject("from", from);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/getFile")
	public String getFile(String attachNo, Model model) throws Exception {
		String url = "downloadFile";

		AttachVO attach = mailService.getMailAttachByMaNo(attachNo);

		model.addAttribute("savedPath", attach.getUploadPath());
		model.addAttribute("fileName", attach.getFileName());

		return url;
	}

	@RequestMapping("/trashUpdate")
	public String trashUpdate(MailVO mail, String mCode, String move, RedirectAttributes rttr) throws Exception {

		String url = "";
		if (move.equals("main")) {
			url = "redirect:/mail/main.do?mCode=" + mCode;
		}
		if (move.equals("send")) {
			url = "redirect:/mail/sendMail.do?mCode=" + mCode;
		}
		if (move.equals("impor")) {
			url = "redirect:/mail/importantMail.do?mCode=" + mCode;
		}
		if (move.equals("tome")) {
			url = "redirect:/mail/toMeMail.do?mCode=" + mCode;
		}
		if (move.equals("temp")) {
			url = "redirect:/mail/tempMail.do?mCode=" + mCode;
		}
		if (move.equals("trash")) {
			url = "redirect:/mail/trash.do?mCode=" + mCode;
		}

		MailVO temp = mailService.getMail(mail.getMailNo());
		System.out.println(temp);

		if (temp.getClean() == 0) {
			mailService.trashUpdate(mail);
		} else {
			mailService.trashRevertUpdate(mail);
		}

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("mailNo", mail.getMailNo());

		return url;
	}

	@RequestMapping("/mtoDel")
	public String mtoDelUpdate(MtoVO mto, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mail/trash.do?mCode=M218000";

		mailService.trashMtoDelUpdate(mto);

		rttr.addFlashAttribute("from", "mailDel");

		return url;
	}

	@RequestMapping("/mFromDel")
	public String mFromDelUpdate(MailVO mail, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mail/trash.do?mCode=M218000";

		System.out.println(mail);

		mailService.trashMFromDelUpdate(mail);

		rttr.addFlashAttribute("from", "mailDel");
		rttr.addAttribute("mailNo", mail.getMailNo());
		rttr.addAttribute("eno", mail.getmFrom());

		return url;
	}

	@RequestMapping("/mtoCheck")
	public String mtoCheck(MtoVO mto, String mCode, String move, RedirectAttributes rttr, HttpSession session) throws Exception {
		String url = "redirect:/mail/"+move+".do?mCode=" + mCode;
		System.out.println(mto);
		
		mailService.updateMailMtoCheckByChecked(mto);
		
		rttr.addFlashAttribute("from", "mtoCheck");
		return url;
	}
	

	@RequestMapping(value = "/mailRegist", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String regist(MailVO mail, @RequestParam(value="receiver",required=true) List<Integer> receiver, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/mail/main.do?mCode=M210000";
		
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(mail.getUploadFile(), savePath);

		mail.setTitle((String) request.getAttribute("XSStitle"));
		mail.setAttachList(attachList);

		mailService.regist(mail, receiver);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}
	
	//자료실 메일 첨부
	@RequestMapping("/pdsRegistForm")
	public ModelAndView pdsRegistForm(ModelAndView mnv, @RequestParam(value="pno",required=false) List<String> pnoList) throws Exception {
		String url = "/mail/openPdsMailRegistForm";
		System.out.println(pnoList);
		
		List<PdsVO> pdsList = new ArrayList<PdsVO>();
		PdsVO pds = null;
		
		if(pnoList != null) for(String pno : pnoList) {
			pds = pdsService.getPdsByPno(pno);
			pdsList.add(pds);
		}
		
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		
		mnv.addObject("pdsList", pdsList);
		mnv.addObject("organizationNode", organizationNode);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/pdsMailRegist", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String registToPds(@RequestParam(value="pno",required=false) List<String> pnoList, MailVO mail, @RequestParam(value="receiver",required=true) List<Integer> receiver, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/mail/main.do?mCode=M210000";
		
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(mail.getUploadFile(), savePath);
		
		//pds첨부파일 작업
		PdsVO pds = null;
		AttachVO attach = null;
		if(pnoList != null) for(String pno : pnoList) {
			pds = pdsService.getPdsByPno(pno);
			
			//파일 복사
			String fileName = MakeFileName.toUUIDFileName(pds.getFileName(), "$$");
			String inFilePath = pds.getUploadPath() + File.separator + pds.getFileName(); // 원래경로
			String outFilePath = savePath + File.separator + fileName; //복사할 경로
			commonFileCopy(inFilePath, outFilePath);
			
			//attachList 추가
			attach = new AttachVO();
			attach.setAttachNo(pno);
			attach.setUploadPath(savePath);
			attach.setFileName(fileName);
			attach.setFileType(pds.getFileType());
			attachList.add(attach);
		}
		
		mail.setTitle((String) request.getAttribute("XSStitle"));
		mail.setAttachList(attachList);
		
		mailService.regist(mail, receiver);
		
		rttr.addFlashAttribute("from", "commuRegist");
		
		return url;
	}
	
	//파일 복사
	public static boolean commonFileCopy(String inFilePath, String outFilePath) {
	    File orgFile = new File(inFilePath);
	    File outFile = new File(outFilePath);

	    try {
	        FileUtils.copyFile(orgFile, outFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return false;
	    }
	    return true;
	}

}
