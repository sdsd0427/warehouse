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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ContactgrVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MycontactVO;
import kr.or.warehouse.service.ContactService;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.HrService;

@Controller
@RequestMapping("/contact")
public class ContactController {

	
	@Autowired
	private ContactService service;

	@Autowired
	private DepartMentService depService;

	@Autowired
	private HrService hrService;

	@RequestMapping("/main")
	 public ModelAndView main(Criteria cri,ModelAndView mnv,HttpServletRequest request)throws Exception{

		  String url="contact/main";

		  List<DepartmentVO> departMentList = depService.getDepartMentList();   //조직도
		  List<OrganizationNode> organization = service.organization(departMentList); //조직도

		  Map<String,Object> dataMap = service.getContactList(cri);

		  mnv.addObject("dataMap",dataMap);
		  mnv.addObject("organization", organization);
		  mnv.setViewName(url);
		  
		  
		// session에서 eno 가져오기
			HttpSession session = request.getSession();
			EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
			int eno = loginUser.getEno();
					
			 Map<String,Object> groupMap = service.getContactGroupList(cri,eno); //그룹만 있는 리스트
			 Map<String,Object> personalMap = service.getPersonalList(cri,eno); //개인주소록 전체리스트

			  mnv.addObject("groupMap",groupMap);
			  mnv.addObject("personalMap", personalMap);

			  mnv.setViewName(url);

		  return mnv;

	}

		


	@RequestMapping("/deptList")
	public ModelAndView deptList(Criteria cri, ModelAndView mnv,HttpServletRequest request)throws Exception{
		String url="contact/deptList";

		// session에서 eno 가져오기
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int dno = loginUser.getDno();
		int eno = loginUser.getEno();
//		EmployeeVO employee=hrService.getEmp(dno);


		  Map<String,Object> dataDepMap = service.getDepartmentList(cri,dno);
		   Map<String,Object> groupMap = service.getContactGroupList(cri,eno); //그룹만 있는 리스트

		  mnv.addObject("dataDepMap",dataDepMap);
		  mnv.addObject("groupMap",groupMap);

		  //mnv.addObject("employee",employee);

		  mnv.setViewName(url);

		  return mnv;
	}


	@RequestMapping(value="/groupRegist",method=RequestMethod.POST,produces = "text/plain; charset=utf-8")
	public String regist(ContactgrVO contactgr, MycontactVO mycontact,     @RequestParam("empList")List<String> empList ,
		HttpServletRequest request, RedirectAttributes rttr)throws Exception{
		String url="redirect:/contact/personalList.do";
		//contactgr.setEno(14310056);
		
		// session에서 eno 가져오기
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		System.out.println("eno:"+eno);
		
		contactgr.setEno(eno);
		//그룹 저장
		String cogroupcode = service.regist(contactgr);

		//그룹 사원정보 저장
		System.out.println(empList);
		service.registInfo(cogroupcode, empList);

		rttr.addFlashAttribute("from","regist");

		return url;
	}


	//전체주소록 그룹지정 저장
	@RequestMapping(value="/registAllcontactGroupAssign",method=RequestMethod.POST,produces = "text/plain; charset=utf-8")
	public String registAllcontactGroupAssign(ContactgrVO contactgr, MycontactVO mycontact,  String cogroupcode,
			@RequestParam("empList")List<String> empList ,
			HttpServletRequest request, RedirectAttributes rttr)throws Exception{

		String url="redirect:/contact/main.do";
		//contactgr.setEno(14310056);

		//그룹 사원정보 저장
		service.registInfo(cogroupcode, empList);

		rttr.addFlashAttribute("from","regist");

		return url;
	}
	
	
	

	//개인주소록 그룹지정
	@RequestMapping(value="/registGroupAssign",method=RequestMethod.POST,produces = "text/plain; charset=utf-8")
	public String registGroupAssign(ContactgrVO contactgr, MycontactVO mycontact,  String cogroupcode,
			@RequestParam("empList")List<String> empList ,
			HttpServletRequest request, RedirectAttributes rttr)throws Exception{

		String url="redirect:/contact/personalList.do";
		//contactgr.setEno(14310056);

		//그룹 사원정보 저장
		service.registInfo(cogroupcode, empList);

		rttr.addFlashAttribute("from","regist");

		return url;
	}
	


	@RequestMapping("/personalList")
	public ModelAndView personalList(Criteria cri, ModelAndView mnv,HttpServletRequest request)throws Exception{
		String url="contact/personalList";

	
		// session에서 eno 가져오기
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
				
		 Map<String,Object> groupMap = service.getContactGroupList(cri,eno); //그룹만 있는 리스트
		 Map<String,Object> personalMap = service.getPersonalList(cri,eno); //개인주소록 전체리스트

		  mnv.addObject("groupMap",groupMap);
		  mnv.addObject("personalMap", personalMap);

		  mnv.setViewName(url);

		  return mnv;

	}


	@RequestMapping(value = "/remove", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String remove(RedirectAttributes rttr, String cogroupcode, @RequestParam List<String> empList) throws Exception{
		String url = "redirect:/contact/personalList.do";
		//System.out.println("cogroupcode : " + cogroupcode);
		//System.out.println("empList : " + empList);
		service.remove(empList,cogroupcode);

		rttr.addFlashAttribute("from","remove");

		return url;
	}

	@RequestMapping(value="/removeGr",method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String removeGr(String cogroupcode,RedirectAttributes rttr)throws Exception{
		String url = "redirect:/contact/personalList.do";

		service.removeGr(cogroupcode);

		rttr.addAttribute("cogroupcode", cogroupcode);
		rttr.addFlashAttribute("from", "remove");
		return url;
	}


	
	@RequestMapping("/ContactHrDetail")
	public ModelAndView teamHrCard(ModelAndView mnv, int eno)throws Exception {
		String url="ehr/ContactHrList";

		EmployeeVO hrDetail = hrService.getEmp(eno);
		mnv.addObject("hrDetail",hrDetail);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	

	@RequestMapping("/test")
	public String organization()throws Exception{
		String url="contact/test";
		return url;
	}




}
