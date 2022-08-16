package kr.or.warehouse.controller.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CalAlarmVO;
import kr.or.warehouse.dto.CalRefVO;
import kr.or.warehouse.dto.CalendarVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.service.CalendarService;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.WorkService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@Autowired
	private CalendarService service;
	@Autowired
	private WorkService workService;
	@Autowired
	private DepartMentService depService;
	
//	@RequestMapping("/registForm")
//	public String registForm(CalendarVO calendar, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
//		String url = "calendar/regist";
//		
//		
//		return url;
//	}
	

	@RequestMapping("/search")
	public ModelAndView search(ModelAndView mv, String keyword, HttpSession session) throws Exception {
		String viewpage = "calendar/search";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		
		Criteria cri = new Criteria();
		cri.setCatecode1(1);
		cri.setCatecode2(2);
		cri.setCatecode3(3);
		cri.setKeyword(keyword);
		
		List<CalendarVO> calendarList = service.getCalendarList(cri, eno);
		System.out.println(calendarList);
		for(CalendarVO cal : calendarList) {
			cal.setStart(cal.getStart().split("T")[0]);
			cal.setEnd(cal.getEnd().split("T")[0]);
		}
		
		mv.addObject("calendarList", calendarList);
		mv.addObject("keyword", cri.getKeyword());
		mv.setViewName(viewpage);
		
		return mv;
	}

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView getCalendarList(ModelAndView mv, Criteria cri) throws Exception {
		String viewpage = "calendar/main";
		
//		List<CalendarVO> calendarList = calendarService.getCalendarList(cri);
//		for(CalendarVO calendar : calendarList) {
//			System.out.println(calendar);
//		}
//		
//		mv.addObject(calendarList);		
		mv.setViewName(viewpage);
		
		return mv;
	}
	
	@RequestMapping(value = "/registForm")
	public String registForm(String sdate, Model model, HttpSession session) throws Exception {
		System.out.println(sdate);
		String url = "calendar/regist";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		
		List<Integer> departmentEno = service.getEnoSameMyDno(eno);
		List<Integer> employeeEno = service.getAllEmployee();
		
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		
		model.addAttribute("organizationNode", organizationNode);
		model.addAttribute("departmentEno", departmentEno);
		model.addAttribute("employeeEno", employeeEno);
		model.addAttribute("sdate", sdate);
		return url;
	}
	
	@RequestMapping(value = "/regist")
	public String regist(int eno, CalendarVO calendar, @RequestParam(value="calRefEno",required=false) List<Integer> calRefEno, CalAlarmVO calalarm, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/calendar/main.do";
		calendar.setEno(eno);
//		System.out.println("calRefEno : " + calRefEno);
		service.registCalendar(calendar, calRefEno, calalarm);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping(value = "/detail")
	public String detail(String ccode, Model model) throws Exception{
		String url = "calendar/detail";
		
		CalendarVO calendar = service.getCalendarByCcode(ccode);
		List<EmployeeVO> employee = service.selectEnoByCcode(ccode);
		
//		System.out.println(calendar.getCalAlarm());
		
		model.addAttribute("calendar", calendar);
		model.addAttribute("employee", employee);
		
		return url;
	}
	
	@RequestMapping(value = "/modifyForm")
	public String modifyForm(String ccode, Model model) throws Exception{
		String url = "calendar/modify";
		
		CalendarVO calendar = service.getCalendarByCcode(ccode);
		List<EmployeeVO> employee = service.selectEnoByCcode(ccode);
		
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		
		model.addAttribute("organizationNode", organizationNode);
		
		model.addAttribute("calendar", calendar);
		model.addAttribute("employee", employee);
		
		return url;
	}
	
	@RequestMapping(value = "/modify")
	public String modify(CalendarVO calendar, CalAlarmVO calalarm, @RequestParam(value="calRefEno",required=false) List<Integer> calRefEno, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/calendar/detail.do";

		calendar.setCalAlarm(calalarm);

		service.modify(calendar, calRefEno);
		
		rttr.addAttribute("ccode", calendar.getCcode());
		rttr.addFlashAttribute("from", "modify");
		
		return url;
	}
	
	
	@RequestMapping(value="/calendarDetail")
	public String removeManualDetail() throws Exception{
		String url="/calendar/detail";
		return url;
	}
	
	@RequestMapping(value="/remove")
	public String remove(String ccode, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/calendar/calendarDetail";
		
		service.remove(ccode);
		
		rttr.addAttribute("ccode", ccode);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
	}
	
}
