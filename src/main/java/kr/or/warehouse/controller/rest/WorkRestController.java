package kr.or.warehouse.controller.rest;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.WorkModifyCommand;
import kr.or.warehouse.dto.CooperReqVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ObjectionVO;
import kr.or.warehouse.dto.ProxyReqVO;
import kr.or.warehouse.dto.WorkReplyVO;
import kr.or.warehouse.dto.WorkReportVO;
import kr.or.warehouse.dto.WorkVO;
import kr.or.warehouse.service.DepartMentService;
import kr.or.warehouse.service.KnowhowService;
import kr.or.warehouse.service.WorkReplyService;
import kr.or.warehouse.service.WorkService;

@RestController
@RequestMapping("/work")
public class WorkRestController {

	@Autowired
	private WorkReplyService workReplyService;

	@Autowired
	private WorkService workService;

	@Autowired
	private KnowhowService knowhowService;

	@RequestMapping("/replyList")
	public ResponseEntity<Map<String, Object>> replyList(@RequestParam String wcode, Criteria cri) throws Exception{
		cri.setPerPageNum(5);

		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataMap = workReplyService.getReplyList(wcode, cri);
			System.out.println(dataMap);
			result = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/replyRegist")
	public ResponseEntity<String> replyRegist(WorkReplyVO reply, HttpSession session) throws Exception{
		ResponseEntity<String> result = null;
		System.out.println(reply);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			workReplyService.registReply(reply, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/myWorkModify", method=RequestMethod.POST)
	public ResponseEntity<String> myWorkModify(WorkVO work) throws Exception{
		ResponseEntity<String> result = null;

		try {
			workService.modifyMyWork(work);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}


		return result;
	}

	@RequestMapping(value = "/toReqModify", method=RequestMethod.POST)
	public ResponseEntity<String> toReqModify(@RequestParam(name = "formData") String data) throws Exception{
		ResponseEntity<String> result = null;

		ObjectMapper mapper = new ObjectMapper();
		WorkModifyCommand modifyCommand = mapper.readValue(data, WorkModifyCommand.class);
		System.out.println(modifyCommand);
		try {
			workService.modifyToReqWork(modifyCommand);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/myWorkCooperReq" , method=RequestMethod.POST)
	public ResponseEntity<String> myWorkCooperReq(CooperReqVO cooper, HttpSession session) throws Exception{
		ResponseEntity<String> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			workService.myWorkCooperReq(cooper, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/myWorkProxyReq", method=RequestMethod.POST)
	public ResponseEntity<String> myWorkProxyReq(ProxyReqVO proxy,  HttpSession session) throws Exception{
		ResponseEntity<String> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		proxy.setEno(loginUser.getEno());
		System.out.println(proxy);
		try {
			workService.myWorkProxyReq(proxy);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getEmpByNodeId.do")
	public ResponseEntity<EmployeeVO> getEmpByNodeId(int eno) throws Exception{
		ResponseEntity<EmployeeVO> result = null;

		try {
			EmployeeVO employee = workService.getEmpByNodeId(eno);
			result = new ResponseEntity<EmployeeVO>(employee, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<EmployeeVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/cooperReqApprove", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> cooperReqModify(@RequestParam(name = "formData") String data) throws Exception{
		ResponseEntity<String> result = null;

		ObjectMapper mapper = new ObjectMapper();
		WorkModifyCommand modifyCommand = mapper.readValue(data, WorkModifyCommand.class);
		System.out.println(modifyCommand);
		try {
			workService.cooperReqApprove(modifyCommand);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/objectionApprove", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> objectionApprove(@RequestParam(name = "formData")String data , int eno)throws Exception{
		ResponseEntity<String> result = null;

		ObjectMapper mapper = new ObjectMapper();
		WorkModifyCommand modifyCommand = mapper.readValue(data, WorkModifyCommand.class);
		System.out.println(modifyCommand);
		try {
			workService.objectionApprove(modifyCommand, eno);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/proxyReqApprove", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> proxyReqApprove(@RequestParam(name = "formData")String data )throws Exception{
		ResponseEntity<String> result = null;

		ObjectMapper mapper = new ObjectMapper();
		WorkModifyCommand modifyCommand = mapper.readValue(data, WorkModifyCommand.class);
		System.out.println(modifyCommand);
		try {
			workService.proxyReqApprove(modifyCommand);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/workApprove")
	public ResponseEntity<String> workApprove(String wcode, HttpSession session) throws Exception{
		ResponseEntity<String> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			workService.myWorkApprove(wcode, loginUser.getEno());
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/reqObjection", method = RequestMethod.POST)
	public ResponseEntity<String> reqObjection(ObjectionVO obj, HttpSession session) throws Exception{
		ResponseEntity<String> result = null;
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		obj.setEno(loginUser.getEno());
		System.out.println(obj);
		try {
			workService.reqObjection(obj);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/cooperReqRefuse", method = {RequestMethod.POST})
	public ResponseEntity<String> cooperReqRefuse(@RequestParam String wcode, @RequestParam String content) throws Exception{
		ResponseEntity<String> result = null;

		try {
			workService.cooperReqRefuse(wcode, content);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/proxyReqRefuse", method=RequestMethod.POST)
	public ResponseEntity<String> proxyReqRefuse(@RequestParam String wcode, @RequestParam String content) throws Exception{
		ResponseEntity<String> result = null;

		try {
			workService.proxyReqRefuse(wcode, content);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/objectionRefuse", method=RequestMethod.POST)
	public ResponseEntity<String> objectionRefuse(@RequestParam String wcode, @RequestParam int eno, @RequestParam String content) throws Exception{
		ResponseEntity<String> result = null;

		try {
			workService.objectionRefuse(wcode,eno, content);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/getReportList", method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getReportList(String wcode, Criteria cri) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;
		cri.setPerPageNum(5);
		System.out.println("cri : " + cri);
		System.out.println("wcode : " + wcode);
		try {
			Map<String, Object> dataMap = workService.getReportList(wcode, cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getProceedList")
	public ResponseEntity<Map<String,Object>> getProceedList(String wcode, Criteria cri) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;
		cri.setPerPageNum(5);
		System.out.println("cri : " + cri);
		System.out.println("wcode : " + wcode);
		try {
			Map<String, Object> dataMap = workService.getProceedList(wcode, cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getThisWeekEndMyWorkList")
	public ResponseEntity<Map<String, Object>> getThisWeekEndMyWorkList(Criteria cri, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			Map<String, Object> dataMap = workService.getThisWeekMyWorkList(loginUser.getEno(), cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}


		return result;
	}

	@RequestMapping("/getThisWeekEndToReqList")
	public ResponseEntity<Map<String, Object>> getThisWeekEndToReqList(Criteria cri, HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			Map<String, Object> dataMap = workService.getThisWeekToReqList(loginUser.getEno(), cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getNotApproveMyWorkList")
	public ResponseEntity<Map<String,Object>> getNotApproveMyWorkList(Criteria cri, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			Map<String, Object> dataMap = workService.getNotApproveMyWorkList(loginUser.getEno(), cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getWaitToReqWorkList")
	public ResponseEntity<Map<String,Object>> getWaitToReqWorkList(Criteria cri, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			Map<String, Object> dataMap = workService.getWaitToReqWorkList(loginUser.getEno(), cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getObjection")
	public ResponseEntity<ObjectionVO> getObjection(String wcode, int eno, int result) throws Exception{
		ResponseEntity<ObjectionVO> res = null;

		try {
			ObjectionVO objection = workService.getObjection(wcode, eno, result);
			res = new ResponseEntity<ObjectionVO>(objection, HttpStatus.OK);
		} catch (Exception e) {
			res = new ResponseEntity<ObjectionVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return res;
	}

	@RequestMapping("/goWorkReport")
	public ResponseEntity<String> goWorkReport(WorkReportVO workReport){
		ResponseEntity<String> result = null;

		try {
			workService.workReportRegist(workReport);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getRelationKnowhow")
	public ResponseEntity<Map<String, Object>> getRelationKnowhow(@RequestParam String wcode, Criteria cri, HttpSession session){
		ResponseEntity<Map<String,Object>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			Map<String, Object> dataMap = knowhowService.getRecommendWorkList(cri, wcode, loginUser.getEno());
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/getRelationMentoWorkList")
	public ResponseEntity<Map<String,Object>> getRelationMentoWorkList(String wcode, Criteria cri, HttpSession session){
		ResponseEntity<Map<String,Object>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		try {
			Map<String, Object> dataMap = workService.getRelationMentoWorkList(cri, wcode, loginUser.getEno());
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/deleteWorkReply")
	public ResponseEntity<String> deleteWorkReply(String wrno){
		ResponseEntity<String> result = null;

		try {
			workReplyService.deleteWorkReply(wrno);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getWorkQnaList")
	public ResponseEntity<Map<String,Object>> getWorkQnaList(Criteria cri, String wcode, HttpSession session){
		ResponseEntity<Map<String,Object>> result = null;

		try {
			Map<String, Object> dataMap = workService.getWorkQnaList(cri, wcode);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getQnaReplyList")
	public ResponseEntity<Map<String,Object>> getQnaReplyList(Criteria cri, int qnaNo){
		ResponseEntity<Map<String,Object>> result = null;

		try {
			Map<String, Object> dataMap = workService.getWorkQnaReplyList(cri, qnaNo);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}
}


















