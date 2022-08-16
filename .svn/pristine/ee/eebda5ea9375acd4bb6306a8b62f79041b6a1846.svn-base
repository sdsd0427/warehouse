package kr.or.warehouse.controller.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.WorkVO;
import kr.or.warehouse.service.ApprovalDocBoxService;
import kr.or.warehouse.service.ApprovalService;
import kr.or.warehouse.service.KnowhowService;
import kr.or.warehouse.service.ManualService;
import kr.or.warehouse.service.WorkService;

@RestController
@RequestMapping("/kw")
public class KwRestController {

	@Autowired
	private ManualService manualService;

	@Autowired
	private KnowhowService knowhowService;

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private ApprovalDocBoxService approvalDocBoxService;

//	manual start
	@RequestMapping(value="/manual/registFav",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> registFav(ManualVO manual){
		ResponseEntity<String> result = null;


		try {
			manualService.favRegist(manual);
			result = new ResponseEntity<String>("관심 메뉴얼에 등록하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("관심 메뉴얼 등록에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value="/manual/removeFav",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> removeFav(ManualVO manual){
		ResponseEntity<String> result = null;


		try {
			manualService.favRemove(manual);
			result = new ResponseEntity<String>("관심 메뉴얼에서 삭제하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("관심 메뉴얼에서 삭제 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/manual/manualList")
	public ResponseEntity<Map<String, Object>> manualList(Criteria cri,int eno){
		ResponseEntity<Map<String, Object>> result = null;

		Map<String, Object> dataMap = null;
		try {
			dataMap = manualService.getManualList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}

	@RequestMapping("/manual/favManualList")
	public ResponseEntity<Map<String, Object>> favManualList(Criteria cri, int eno){

		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = null;
		try {
			dataMap = manualService.getFavManualList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}


//	manual End

//  kw dashBoard
	@RequestMapping("/manual/viewManualList")
	public ResponseEntity<Map<String, Object>> viewManualList(Criteria cri,int eno){

		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = null;
		try {
			dataMap = manualService.getViewManualList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}


	@RequestMapping("/knowhow/myWorkList")
	public ResponseEntity<List<WorkVO>> myWorkList(int eno){

		ResponseEntity<List<WorkVO>> result = null;
		List<WorkVO>  myWorkList = null;

		try {
			myWorkList = knowhowService.getMyWorkList(eno);
			result = new ResponseEntity<List<WorkVO>>(myWorkList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<WorkVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/approval/myReturnSignDocList")
	public ResponseEntity<List<SignDocVO>> myReturnSignDocList(int eno){

		ResponseEntity<List<SignDocVO>> result = null;
		List<SignDocVO>  myReturnSignDocList = null;

		try {
			myReturnSignDocList = approvalService.getMyReturnSignDocList(eno);
			result = new ResponseEntity<List<SignDocVO>>(myReturnSignDocList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<SignDocVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}


	@RequestMapping("/knowhow/recommendWorkList")
	public ResponseEntity<Map<String, Object>> recommendWorkList(Criteria cri,String wcode, HttpSession session){

		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		cri.setPerPageNum(8);
		try {
			dataMap = knowhowService.getRecommendWorkList(cri, wcode, loginUser.getEno());
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}

	@RequestMapping("/approval/requiredDocumentList")
	public ResponseEntity<Map<String, Object>> requiredDocumentList(Criteria cri,String signNo, HttpSession session){

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();
		
		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = null;
		try {
			dataMap = approvalService.getRequiredDocumentList(cri, signNo,eno);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}

	@RequestMapping("/knowhow/getAllKnowHowList")
	public ResponseEntity<Map<String,Object>> getAllKnowHowList(Criteria cri, HttpSession session){
		ResponseEntity<Map<String, Object>> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			Map<String, Object> dataMap  = knowhowService.getAllKnowHowList(cri, loginUser.getEno());
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/knowhow/addFavKnowhow")
	public ResponseEntity<String> addFavKnowhow(String wcode, HttpSession session){
		ResponseEntity<String> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			knowhowService.addFavKnowhow(wcode, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/knowhow/removeFavKnowhow")
	public ResponseEntity<String> removeFavKnowhow(String wcode, HttpSession session){
		ResponseEntity<String> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			knowhowService.removeFavKnowhow(wcode, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("knowhow/getFavKnowhowList")
	public ResponseEntity<Map<String,Object>> getFavKnowhowList(Criteria cri, HttpSession session){
		cri.setPerPageNum(5);
		ResponseEntity<Map<String,Object>> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			Map<String, Object> dataMap = knowhowService.getFavKnowhowList(cri, loginUser.getEno());
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}


		return result;
	}
	
	
	//전사문서함 리스트
	@RequestMapping("/getApprovalList")
	public ResponseEntity<Map<String,Object>> getApprovalList(Criteria cri,String sFormNo,int eno)throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			System.out.println("전사문서함양식번호컨트롤:"+sFormNo);
			Map<String, Object> dataMap = approvalDocBoxService.getApprovalList(cri,sFormNo,eno);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

	
	//관심문서 등록
	@RequestMapping("/approvalDocBox/addDocFavDoc")
	public ResponseEntity<String> addFavDoc(String signNo, HttpSession session){
		ResponseEntity<String> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			approvalDocBoxService.favRegist(signNo, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}
	
	
	//관심문서 가져오기
	@RequestMapping("approvalDocBox/getfavDocList")
	public ResponseEntity<Map<String, Object>> getFavDocList(Criteria cri, HttpSession session){
		cri.setPerPageNum(5);
		ResponseEntity<Map<String,Object>> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			Map<String, Object> dataMap = approvalDocBoxService.getFavDocList(cri, loginUser.getEno());
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	//관심문서 삭제
	@RequestMapping("approvalDocBox/favRemove")
	public ResponseEntity<String> favRemove(String signNo, HttpSession session){
		ResponseEntity<String> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			approvalDocBoxService.favRemove(signNo, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}
	
	
	/*
		@RequestMapping(value="/approvalDocBox/favRemove",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
		public ResponseEntity<String> removeFav(String signNo, int eno){
			ResponseEntity<String> result = null;


			try {
				approvalDocBoxService.favRemove(signNo,eno);
				result = new ResponseEntity<String>("관심 문서에서 삭제하였습니다.", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				result = new ResponseEntity<String>("관심 문서에서 삭제 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			return result;
		}
	*/
}






















