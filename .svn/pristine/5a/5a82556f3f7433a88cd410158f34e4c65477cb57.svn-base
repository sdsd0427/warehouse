package kr.or.warehouse.controller.view;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
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
import kr.or.warehouse.dto.CommuBoardVO;
import kr.or.warehouse.dto.CommunityVO;
import kr.or.warehouse.dto.CommupostVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.service.CommunityService;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.MailService;
import kr.or.warehouse.service.WorkService;

@Controller
@RequestMapping("/community")
public class CommnuityConrtoller {

	@Autowired
	private CommunityService communityService;
	@Autowired
	private WorkService workService;
	@Autowired
	private DepartMentService depService;
	@Autowired
	private MailService mailService;

	@Resource(name = "picturePath")
	private String picturePath;
	
	@RequestMapping("/main")
	public void main()throws Exception{}

	@RequestMapping("/detail")
	public ModelAndView detail(String cmno, int eno, ModelAndView mnv)throws Exception{
		String url ="/community/detail";
		
		CommunityVO community = communityService.getCommunity(cmno,eno);
		
		mnv.addObject("community", community);
		mnv.setViewName(url);
		
		return mnv;
		
	}

	@RequestMapping("/commuRegistGo")
	public ModelAndView commuRegistGo(ModelAndView mnv)throws Exception{
		String url = "/community/commuRegistGo";
		
		List<CommunityVO> openCommunityList = communityService.getOpenCommuList();
		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		
		mnv.addObject("organizationNode", organizationNode);
		mnv.addObject("openCommunityList", openCommunityList);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
   @RequestMapping(value="/commuRegist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
   public String regist(CommunityVO community,@RequestParam(value="enoList",required=false) List<Integer> enoList, HttpServletRequest request,
                   RedirectAttributes rttr)throws Exception{
      String url="redirect:/community/main.do?mCode=M180000";
      
      
      String savePath=this.picturePath;
      savePath = savePath.replaceAll("\"", File.separator);
      MultipartFile multi = community.getImageFile();
      String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
      File target = new File(savePath, fileName);
	  target.mkdirs();
	  multi.transferTo(target);
	  
      community.setCname((String)request.getAttribute("XSScname"));
      community.setIntro((String)request.getAttribute("XSSintro"));
      
      community.setImage(fileName);
      
      
      communityService.insertCommunity(community,enoList);

      rttr.addFlashAttribute("from","regist");

      return url;
   }
	

	@RequestMapping("/commuApproval")
	public ModelAndView commuApproval(ModelAndView mnv, Criteria cri)throws Exception{
		String url = "/community/commuApproval";
		
		Map<String, Object> dataMap = communityService.getApproveCommuList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}

	@RequestMapping("/commuSub")
	public ModelAndView commuSub(String cmno, ModelAndView mnv, HttpSession session) throws Exception{
		String url = "/community/commuSub";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		
		
		String authority = communityService.getAuthority(eno, cmno);
		CommunityVO community = communityService.getCommunity(cmno);
		
		
		mnv.addObject("community", community);
		mnv.addObject("authority", authority);
		mnv.setViewName(url);
		
		return mnv;
	}

	
	 @RequestMapping(value="/removeJoinCommu",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	public String manualDetail(CommunityVO community,int ceno, String cname,HttpServletRequest request,
            RedirectAttributes rttr)throws Exception{
		 String url="redirect:/community/main.do?mCode=M180000";
		 
		 communityService.removeJoinCommu(community);
		
		 rttr.addFlashAttribute("from","removeJoinCommu");
		 rttr.addFlashAttribute("ceno",ceno);
		 rttr.addFlashAttribute("cname",cname);
		return url;
	}
	
	@RequestMapping("/commuInviteForm")
	public ModelAndView commuInviteForm(ModelAndView mnv, String cmno) throws Exception{
		String url = "/community/commuInviteForm";

		List<DepartmentVO> departMentList = depService.getDepartMentList();
		List<OrganizationNode> organizationNode = workService.organization(departMentList);
		
		mnv.addObject("organizationNode", organizationNode);
		mnv.addObject("cmno", cmno);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/commuInvite")
	public String commuInvite(String cmno, @RequestParam(value="eno",required=true) List<Integer> eno, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/community/commuSub.do?mCode=M180000&cmno=" + cmno;
		
		communityService.insertInviteCommu(cmno, eno);
		CommunityVO community = communityService.getCommunity(cmno);
		
		System.out.println("commu : " + community);
		rttr.addFlashAttribute("from", "invite");
		rttr.addFlashAttribute("community", community);
		rttr.addFlashAttribute("enoList", eno);
		

		return url; 
	}

	@RequestMapping("/boardGo")
	public ModelAndView boardGo(@RequestHeader Map<String,Object> requestHeader, @RequestParam(value="",required=false)String cmno,  ModelAndView mnv, HttpSession session) throws Exception{
		String url = "/community/board";
		System.out.println("cmno : " + cmno);
		String cboardNo = cmno.split("And")[1];
		cmno = cmno.split("And")[0];
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		
		String authority = communityService.getAuthority(eno, cmno);
		CommunityVO community = communityService.getCommunity(cmno);
		CommuBoardVO commuBoard = communityService.getCommuBoard(cboardNo);
		
		mnv.addObject("community", community);
		mnv.addObject("commuBoard", commuBoard);
		mnv.addObject("authority", authority);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/boardRegistForm")
	public ModelAndView boardRegistForm(String cboardNo, ModelAndView mnv)throws Exception{
		
		String url = "/community/boardRegistForm";
		
		mnv.addObject("cboardNo", cboardNo);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/commuPostRegist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	   public String regist(CommupostVO commuPost,HttpServletRequest request,
	                   RedirectAttributes rttr)throws Exception{
	      String url="redirect:/community/boardGo.do?cmno=aAndb";

	      commuPost.setTitle((String)request.getAttribute("XSStitle"));
	      communityService.insertCommuPost(commuPost);
	      
	      rttr.addFlashAttribute("from","regist");

	      return url;
	   }

	@RequestMapping("/boardDetail")
	public ModelAndView boardDetail(String cpostNo,String from, ModelAndView mnv)throws Exception{
		String url = "/community/boardDetail";
		
		CommupostVO commuPost =null;
		if(from!=null && from.equals("list")) {
			commuPost=communityService.getCommuPostByCpostNo(cpostNo);
			url="redirect:/community/boardDetail.do?cpostNo="+cpostNo;
		}else {
			commuPost=communityService.getCommuPostByCpostNoForModify(cpostNo);
		}
		mnv.addObject("commuPost", commuPost);
		mnv.setViewName(url);
		
		return mnv;
		
	}

	@RequestMapping("/boardModifyForm")
	public ModelAndView boardModifyForm(String cpostNo, ModelAndView mnv)throws Exception{
		String url = "/community/boardModifyForm";
		
		CommupostVO commuPost = communityService.getCommuPostByCpostNoForModify(cpostNo);
		
		mnv.addObject("commuPost", commuPost);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping(value="/boardModify",method=RequestMethod.POST)
	public String modifyPost(CommupostVO commuPost,HttpServletRequest request,
							 RedirectAttributes rttr) throws Exception{
		String url = "redirect:/community/boardDetail.do";

		communityService.updateCommuPost(commuPost);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("cpostNo",commuPost.getCpostNo());
		
		return url;
	}
	
	@RequestMapping(value="/boardRemove",method=RequestMethod.POST)
	public String remove(String cpostNo,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/community/boardDetail";

		communityService.deleteCommuPost(cpostNo);

		rttr.addAttribute("cpostNo",cpostNo);
		rttr.addFlashAttribute("from","remove");
		return url;
	}
	

	@RequestMapping("/management")
	public ModelAndView management(String cmno, ModelAndView mnv)throws Exception{
		String url = "/community/management";
		
		mnv.addObject("cmno", cmno);
		mnv.setViewName(url);
		
		return mnv;
		
	}

	@RequestMapping("/organizationForm")
	public String organization()throws Exception{
		String url = "/community/organization";
		return url;

	}
	
	@RequestMapping(value="/closingCommuGo",method=RequestMethod.POST)
	public String closingCommuGo(MailVO mail,@RequestParam(value="eno",required=false) List<Integer> eno,String cmno,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/community/main.do";
		
		String cname = communityService.getCommunity(cmno).getCname();
		mail.setTitle(cname + " 커뮤니티 폐쇄 알림");
		
		mailService.regist(mail, eno);
		communityService.approveDeleteCommunity(cmno);
		rttr.addFlashAttribute("from","remove");
		return url;
	}

}
