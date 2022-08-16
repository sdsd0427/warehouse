package kr.or.warehouse.controller.view;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import java.util.Map;

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
import kr.or.warehouse.controller.rest.GetAttachesByMultipartFileAdatpter;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.MentoringVO;
import kr.or.warehouse.dto.SubMentoringVO;
import kr.or.warehouse.dto.WorkVO;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.EmployeeService;
import kr.or.warehouse.service.HrService;
import kr.or.warehouse.service.MentoringService;
import kr.or.warehouse.service.WorkService;


@Controller
@RequestMapping("/mentoring")
public class MentoringController {
	@Autowired
	private MentoringService mentoringService;
	@Autowired
	private HrService hrService;
	@Autowired
	private WorkService workService;
	@Autowired
	private DepartMentService depService;


		@RequestMapping("/main")
		public ModelAndView main(ModelAndView mnv, HttpServletRequest request)throws Exception{
			String url="mentoring/main";


			HttpSession session = request.getSession();
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
			int eno = loginUser.getEno();

			EmployeeVO employee=hrService.getEmp(eno);
			List<SubMentoringVO> mentoList = mentoringService.getMyMentoListMain(eno);
			int mentoCount = mentoringService.getMyMentoListCountMain(eno);
			List<SubMentoringVO> menteeList = mentoringService.getMyMenteeListMain(eno);
			int menteeCount = mentoringService.getMyMenteeListCountMain(eno);
			List<SubMentoringVO> rankList = mentoringService.getMentoRank();
			List<WorkVO> myWorkList = mentoringService.getMyWorkList(eno);


			System.out.println("mentoList :" + mentoList);

			mnv.addObject("employee", employee);
			mnv.addObject("mentoList", mentoList);
			mnv.addObject("mentoCount", mentoCount);
			mnv.addObject("menteeList", menteeList);
			mnv.addObject("menteeCount", menteeCount);
			mnv.addObject("rankList", rankList);
			mnv.addObject("myWorkList", myWorkList);
			mnv.setViewName(url);

			return mnv;
		}

		@RequestMapping("/registForm")
		public ModelAndView registForm(SubMentoringVO sub, ModelAndView mnv,HttpSession session)throws Exception{
			String url="mentoring/apply";
			//System.out.println("organizationNode");
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

			List<DepartmentVO> departMentList = depService.getDepartMentList();
			List<OrganizationNode> organizationNode = workService.organization(departMentList);
			List<SubMentoringVO> mbtiList = mentoringService.getRecommendMbti(loginUser.getEno());

			mnv.addObject("organizationNode", organizationNode);
			mnv.addObject("mbtiList", mbtiList);
			mnv.setViewName(url);

			return mnv;
		}

		@RequestMapping(value="/regist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	    public String regist(SubMentoringVO subMentoring, RedirectAttributes rttr)throws Exception{
	       String url="redirect:/mentoring/main.do";

	       mentoringService.apply(subMentoring);

	       //알림
	       int signalMento = subMentoring.getMento();

	       rttr.addFlashAttribute("from","regist");
	       rttr.addFlashAttribute("signalMento",signalMento);

	       return url;
	    }

		@RequestMapping("/mentoDetail")
		public ModelAndView mentoDetail(int eno, ModelAndView mnv, HttpServletRequest request)throws Exception{
			String url="mentoring/mentoDetail";

			EmployeeVO mento=hrService.getEmp(eno);

			HttpSession session = request.getSession();
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
			int loginUserEno = loginUser.getEno();

			EmployeeVO employee=hrService.getEmp(loginUserEno);
			List<WorkVO> myWorkList = mentoringService.getMyWorkList(eno);

			mnv.addObject("mento", mento);
			mnv.addObject("employee", employee);
			mnv.addObject("myWorkList", myWorkList);
			mnv.setViewName(url);
			return mnv;
		}

		@RequestMapping("/menteeDetail")
		public ModelAndView menteeDetail(String smno, ModelAndView mnv)throws Exception{
			String url="mentoring/menteeDetail";

			System.out.println("menteeDetail smno : " + smno);
			SubMentoringVO mentee = mentoringService.getSubMenteeDetail(smno);
			mentoringService.read(smno);
			mnv.addObject("mentee",mentee);
			mnv.setViewName(url);

			return mnv;
		}

//		@RequestMapping("/read")
//		public String read(String smno, RedirectAttributes rttr) throws Exception{
//			String url = "redirect:/mentoring/main.do";
//			System.out.println("readCheck controller");
//			mentoringService.read(smno);
//
//			rttr.addAttribute("smno", smno);
//			rttr.addFlashAttribute("from", "read");
//			return url;
//		}

		@RequestMapping(value="/accept",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
		public String menteeAccept(MentoringVO mentoring, @RequestParam int menteeEno, HttpServletRequest request,RedirectAttributes rttr)throws Exception{
			String url="redirect:/mentoring/main.do";

			System.out.println("sdasdsa" + menteeEno);
			System.out.println("menteeAccept");
			mentoringService.acceptMentoring(mentoring);

			//알림
			rttr.addFlashAttribute("from", "accept");
			rttr.addFlashAttribute("menteeSignal", menteeEno);

			return url;
		}

		@RequestMapping(value="/refuse",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
		public String menteeRefuse(String smno, @RequestParam int menteeEno, HttpServletRequest request,RedirectAttributes rttr)throws Exception{
			String url="redirect:/mentoring/main.do";

			mentoringService.deleteSubMentoring(smno);
			rttr.addFlashAttribute("from", "refuse");
			rttr.addFlashAttribute("menteeSignal", menteeEno);
			return url;
		}

		@RequestMapping("/mento")
		public void mento(){
		}
		@RequestMapping("/mentee")
		public void mentee(){
		}

		@RequestMapping("/test")
		public String test() throws Exception{
			String url = "mentoring/test";

			return url;
		}

	}

