package kr.or.warehouse.controller.view;

import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.ManualRegistCommand;
import kr.or.warehouse.controller.rest.GetAttachesByMultipartFileAdatpter;
import kr.or.warehouse.dto.AllSignVO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.PopularEmpVO;
import kr.or.warehouse.dto.PopularHashtagVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.WorkVO;
import kr.or.warehouse.service.ApprovalDocBoxService;
import kr.or.warehouse.service.ApprovalService;
import kr.or.warehouse.service.KnowhowService;
import kr.or.warehouse.service.KwService;
import kr.or.warehouse.service.ManualService;
import kr.or.warehouse.service.NewApprovalService;

@Controller
@RequestMapping("/kw")
public class KwController {

	@Autowired
	private ManualService manualService;

	@Autowired
	private KwService kwService;

	@Autowired
	private KnowhowService knowhowService;

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private ApprovalDocBoxService approvalDocBoxService;
	
	@Autowired
	private NewApprovalService newApprovalService;
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;

	// kw dashboard start
	@RequestMapping("/main")
	public ModelAndView main( ModelAndView mnv)throws Exception{

		String url="/kw/main";

//		List<PopularHashtagVO> popularHashtagList = kwService.getPopularHashTag();
//		List<PopularEmpVO> populareEmpList = kwService.getPopularEmp();
//
//		mnv.addObject("popularHashtagList",popularHashtagList);
//		mnv.addObject("populareEmpList",populareEmpList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/hashTagListForm")
	public ModelAndView hashTagListForm(ModelAndView mnv)throws Exception{
		String url="/kw/hashTagListForm";

		List<PopularHashtagVO> popularHashtagList = kwService.getPopularHashTag();
		mnv.addObject("popularHashtagList",popularHashtagList);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping("/empWorkListForm")
	public ModelAndView empWorkListForm(ModelAndView mnv, int eno, String name)throws Exception{
		String url="/kw/empWorkListForm";

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<WorkVO> popularWorkList = knowhowService.getPopularEmpWorkList(eno);

		dataMap.put("popularWorkList", popularWorkList);
		dataMap.put("name", name);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping("/empDocumentListForm")
	public ModelAndView empDocumentListForm(ModelAndView mnv, int eno, String name)throws Exception{
		String url="/kw/empDocumentListForm";
		System.out.println(eno);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SignDocVO> popularApprovalList = approvalService.getPopularApprovalList(eno);

		dataMap.put("popularApprovalList", popularApprovalList);
		dataMap.put("name", name);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;

	}
	// kw dashboard end

	// manual start
	@RequestMapping("/manual/list")
	public ModelAndView manual(Criteria cri, Criteria favCri, ModelAndView mnv)throws Exception{
		String url="/kw/manual";

//		Map<String,Object> dataMap = manualService.getManualList(cri);
//		Map<String,Object> favdataMap = manualService.getFavManualList(favCri);
//
//		mnv.addObject("dataMap",dataMap);
//		mnv.addObject("favdataMap",favdataMap);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping("/manual/manualRegistForm")
	public String manualRegistForm()throws Exception{
		String url="/kw/manualRegistForm";
		return url;
	}

	 @RequestMapping(value="/manual/manualRegist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	   public String regist(ManualVO manual,HttpServletRequest request,
	                   RedirectAttributes rttr)throws Exception{
	      String url="redirect:/kw/manual/list.do";

	      String savePath=this.fileUploadPath;
	      List<AttachVO>attachList=GetAttachesByMultipartFileAdatpter.save(manual.getUploadFile(),savePath);


	      manual.setManualTitle((String)request.getAttribute("XSSmanualTitle"));
	      manual.setAttachList(attachList);
	      manualService.regist(manual);

	      rttr.addFlashAttribute("from","regist");

	      return url;
	   }


	@RequestMapping("/manual/manualDetail")
	public ModelAndView manualDetail(String manualNo,String from, ModelAndView mnv )throws Exception{
		String url="/kw/manualDetail";

		ManualVO manual =null;
		if(from!=null && from.equals("list")) {
			manual=manualService.getManual(manualNo);
			url="redirect:/kw/manual/manualDetail.do?manualNo="+manualNo;
		}else {
			manual=manualService.getManualForModify(manualNo);
		}

		 //파일명 재정의
	      if(manual!=null) {
	         List<AttachVO>attachList=manual.getAttachList();
	         if(attachList!=null) {
	            for(AttachVO attach:attachList) {
	               String fileName=attach.getFileName().split("\\$\\$")[1];
	               attach.setFileName(fileName);
	            }
	         }

	      }

		mnv.addObject("manual",manual);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/manual/getFile")
	   public String getFile(String attachNo,Model model)throws Exception{
	      String url="downloadFile";

	      AttachVO attach=manualService.getManualAttachByMaNo(attachNo);

	      model.addAttribute("savedPath",attach.getUploadPath());
	      model.addAttribute("fileName",attach.getFileName());

	      return url;
	   }

	@RequestMapping("/manual/manualmodifyForm")
	public ModelAndView manualmodifyForm(String manualNo, ModelAndView mnv)throws Exception{
		String url="/kw/manualmodifyForm";

		ManualVO manual = manualService.getManualForModify(manualNo);

		//파일명 재정의
	      if(manual!=null) {
	         List<AttachVO>attachList=manual.getAttachList();
	         if(attachList!=null) {
	            for(AttachVO attach:attachList) {
	               String fileName=attach.getFileName().split("\\$\\$")[1];
	               attach.setFileName(fileName);
	            }
	         }

	      }

		mnv.addObject("manual",manual);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value="/manual/manualModify",method=RequestMethod.POST)
	public String modifyPost(ManualVO manual,HttpServletRequest request,
							 RedirectAttributes rttr) throws Exception{

		String url = "redirect:/kw/manual/manualDetail.do";

		 //파일 삭제
	      if(manual.getDeleteFile()!=null&&manual.getDeleteFile().length>0) {
	         for(String attachNo:manual.getDeleteFile()) {
	            AttachVO attach=manualService.getManualAttachByMaNo(attachNo);

	            File deleteFile=new File(attach.getUploadPath(),attach.getFileName());

	            if(deleteFile.exists()) {
	               deleteFile.delete();//File 삭제
	            }
	            manualService.removeManualAttachByMaNo(attachNo);
	         }
	      }

	     //파일 저장
	     List<AttachVO>attachList=GetAttachesByMultipartFileAdatpter.save(manual.getUploadFile(),fileUploadPath);

	    manual.setAttachList(attachList);
		manual.setManualTitle((String)request.getAttribute("XSSmanualTitle"));

		manualService.modify(manual);

		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("manualNo",manual.getManualNo());

		return url;
	}

	@RequestMapping(value="/manualDetail")
	public String removeManualDetail() throws Exception{
		String url="/kw/manualDetail";
		return url;
	}

	@RequestMapping(value="/manual/manualRemove",method=RequestMethod.POST)
	public String remove(String manualNo,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/kw/manualDetail";

		//첨부파일 삭제
        List<AttachVO>attachList= manualService.getManualForModify(manualNo).getAttachList();
        if(attachList!=null) {
           for(AttachVO attach:attachList) {
             File target=new File(attach.getUploadPath(),attach.getFileName());
             if(target.exists()) {
                target.delete();
             }
          }
        }

		manualService.remove(manualNo);

		rttr.addAttribute("manualNo",manualNo);
		rttr.addFlashAttribute("from","remove");
		return url;
	}
	// manual end


	@RequestMapping("/knowHowList")
	public String knowHowList(HttpSession session, Model model) throws Exception{
		String url = "kw/knowHowList";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		List<String> workHashTagList = knowhowService.getMyWorkHashTagList(loginUser.getEno());

		model.addAttribute("workHashTagList", workHashTagList);

		return url;
	}

	//전사문서함
	@RequestMapping("/approvalList")
	public String approvalList(Criteria cri,ModelAndView mnv,HttpSession session, Model model) throws Exception{
		String url = "/kw/approvalList";
		
		//문서양식 리스트
		Map<String, Object> dataMap = approvalDocBoxService.getSignForm();
		
		mnv.addObject("dataMap",dataMap);
		
		mnv.setViewName(url);
		
		
		//해시태그
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		List<String> DocHashTagList = approvalDocBoxService.getMyDocHashTagList(loginUser.getEno());

		model.addAttribute("DocHashTagList", DocHashTagList);
		
		
		//전사문서함 저장 //List<SignDocVO> signDoc
		//System.out.println("signDoc전사컨트롤:"+signDoc);
		//approvalDocBoxService.registApprovalDocBox(signDoc);
		
		return url;
	}

	//전사문서함 상세
	@RequestMapping("/approvalDocBox/approvalDetail")
	public String approvalDetailGo(String manualNo,String from, ModelAndView mnv)throws Exception{
		String url="/kw/approvalDetailGo";
		return url;
	}
	
	
	// 상세보기
		@RequestMapping("/detailGo")
		public ModelAndView detail(@RequestHeader Map<String, Object> requestHeader, String signNo, ModelAndView mnv, HttpSession session)
				throws Exception {
			String url = "approval/kwApprovalDetail";
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
			AllSignVO signDoc = null;
			AllSignVO allSign =  new AllSignVO();
			allSign.setSignNo(signNo);
			allSign.setEno(loginUser.getEno());
			

			String refer = requestHeader.get("referer").toString();
			String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

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
			newApprovalService.insertSignReader(allSign);
			
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

			mnv.addObject("signDoc", signDoc);
			mnv.setViewName(url);
			return mnv;
			
			
			
		}
	
	
		
		// 전사문서함 상세
		@RequestMapping("/detailform")
		public ModelAndView detailRelated(@RequestHeader Map<String, Object> requestHeader, String signNo, ModelAndView mnv, HttpSession session)
				throws Exception {
			String url = "approval/kwApprovalDetail";
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
			AllSignVO signDoc = null;
			AllSignVO allSign =  new AllSignVO();
			allSign.setSignNo(signNo);
			allSign.setEno(loginUser.getEno());
			

			String refer = requestHeader.get("referer").toString();
			String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

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
			newApprovalService.insertSignReader(allSign);
			
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

			mnv.addObject("signDoc", signDoc);
			mnv.setViewName(url);
			return mnv;
			
			
			
		}
		
		
		// 관련문서
		@RequestMapping("/RelateddetailDocform")
		public ModelAndView detailDocform(@RequestHeader Map<String, Object> requestHeader, String signNo, ModelAndView mnv, HttpSession session)
				throws Exception {
			String url = "approval/RelateddetailDocform";
			EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
			AllSignVO signDoc = null;
			AllSignVO allSign =  new AllSignVO();
			allSign.setSignNo(signNo);
			allSign.setEno(loginUser.getEno());
			

			String refer = requestHeader.get("referer").toString();
			String referMcode = refer.substring(refer.lastIndexOf("=") + 1);

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
			newApprovalService.insertSignReader(allSign);
			
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

			mnv.addObject("signDoc", signDoc);
			mnv.setViewName(url);
			return mnv;
			
			
			
		}
	

}
