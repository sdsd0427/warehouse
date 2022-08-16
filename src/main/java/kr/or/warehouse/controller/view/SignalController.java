package kr.or.warehouse.controller.view;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.service.SignalService;

@Controller
@RequestMapping("/signal")
public class SignalController {

	@Resource(name = "signalService")
	private SignalService signalService;
	
	@RequestMapping("/signaldetail.do")
	public ModelAndView main(Criteria cri, ModelAndView mnv, HttpServletRequest request) throws Exception{
		String url = "signal/main";
		System.out.println(cri);
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		Map<String, Object> dataMap = null;
		dataMap = signalService.getSignalList(cri, eno);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/read")
	public String read(String signalNo, String classInit, String mCode, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/signal/signaldetail.do?classInit="+classInit+"&mCode="+mCode;
		System.out.println(mCode);
		signalService.read(signalNo);
		
		rttr.addAttribute("signalNo", signalNo);
		rttr.addFlashAttribute("from", "read");
		return url;
	}
	
	@RequestMapping("/remove")
	public String remove(String signalNo, String classInit, String mCode, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/signal/signaldetail.do?classInit="+classInit+"&mCode="+mCode;
		System.out.println(mCode);
		signalService.remove(signalNo);
		
		rttr.addAttribute("signalNo", signalNo);
		rttr.addFlashAttribute("from", "remove");
		return url;
	}
	
	@RequestMapping("/scriptForm")
	public String script() throws Exception{
		String url = "signal/scriptForSignal";
		
		return url;
	}
}
