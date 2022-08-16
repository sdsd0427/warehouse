package kr.or.warehouse.controller.view;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.EmployeeCommand;
import kr.or.warehouse.controller.rest.MypageRestController;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.service.MyPageService;
import kr.or.warehouse.service.NewApprovalService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	MypageRestController MypageRestController;
	
	@Resource(name = "picturePath")
	private String picturePath;
	

	@RequestMapping("/profile")
	public ModelAndView profile(@RequestHeader Map<String,Object> requestHeader, ModelAndView mnv, HttpServletRequest request) throws Exception{
		String url="mypage/profile";
		String refer = requestHeader.get("referer").toString();
		String referMcode = refer.substring(refer.lastIndexOf("=") + 1);
		
		System.out.println(referMcode);
		if(referMcode.contains("M23")) {
			mnv.addObject("refer", "M23");
		}
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		
		Map<String, Object> dataMyLine = myPageService.getMyInfoList(eno);
		
		mnv.addObject("dataMyLine", dataMyLine);
		mnv.setViewName(url);

		return mnv;
	}

	
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST, 
				produces = "text/plain;charset=utf-8")
	public String modify(EmployeeVO employee,HttpServletRequest request, RedirectAttributes rttr) throws Exception {
	
	String url = "redirect:/mypage/profile.do?mCode=M230000";
	
	HttpSession session = request.getSession();
	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
	int eno = loginUser.getEno();
	System.out.println(employee);
	
//	EmployeeVO employee = new EmployeeVO();
	employee.setEno(eno);
	
	// 신규 파일 변경 및 기존 파일 삭제
	String oldPicture = employee.getOldPicture();
	if (employee.getUploadFile() != null && !employee.getUploadFile().isEmpty()) {
//		String fileName = MypageRestController.savePicture(oldPicture, employee.getUploadFile());
//		System.out.println(fileName);
//		employee.setPhoto(picturePath + fileName);
		employee.setPhoto("/warehouse/resources/images/" + employee.getUploadFile().getOriginalFilename());
	} else {
		employee.setPhoto(oldPicture);
	}
	
	//결제수단
	String oldSignFile = employee.getOldSignFile();
	if (employee.getSignFile() != null && !employee.getSignFile().isEmpty()) {
		String fileName2 = MypageRestController.savePicture(oldSignFile, employee.getSignFile());
		employee.setSignpath(picturePath + fileName2);
	} else {
		employee.setSignpath(oldSignFile);
	}
	
	
	//DB 내용 수정
	
	
	myPageService.modifyInfo(employee);
	
	rttr.addFlashAttribute("from","modify");
	
	return url;
	}

	
	
	
	@RequestMapping("/activity")
	public void activity() {
	}

	@RequestMapping("/work")
	public void work() {
	}
}
