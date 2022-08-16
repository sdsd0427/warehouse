package kr.or.warehouse.controller.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.TodoVO;
import kr.or.warehouse.dto.WorkVO;
import kr.or.warehouse.service.BoardService;
import kr.or.warehouse.service.HomeService;
import kr.or.warehouse.service.NewApprovalService;
import kr.or.warehouse.service.TodoService;

@RestController
@RequestMapping("/home")
public class HomeRestController {

	@Autowired
	private TodoService todoService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private HomeService homeService;

	@Autowired
	private NewApprovalService approvalService;

	@RequestMapping(value = "/addTodo", method=RequestMethod.POST)
	public ResponseEntity<String> addTodo(TodoVO todo, HttpSession session) throws Exception{
		ResponseEntity<String> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			todo.setEno(loginUser.getEno());
			System.out.println("todo : " + todo);
			todoService.addTodo(todo);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}


		return result;
	}

	@RequestMapping("/getTodoDetail")
	public ResponseEntity<TodoVO> getTodoDetail(int todoNo){
		ResponseEntity<TodoVO> result = null;

		try {
			TodoVO todo = todoService.getTodoByTodoNo(todoNo);
			result = new ResponseEntity<TodoVO>(todo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<TodoVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/todoModifyGo", method=RequestMethod.POST)
	public ResponseEntity<String> todoModifyGo(TodoVO todo){
		ResponseEntity<String> result = null;
		System.out.println(todo);
		try {
			todoService.modifyTodo(todo);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/todoRemove")
	public ResponseEntity<String> todoRemove(int todoNo){
		ResponseEntity<String> result = null;

		try {
			todoService.removeTodo(todoNo);
			result = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return null;
	}

	@RequestMapping("/getNoticeList")
	public ResponseEntity<Map<String,Object>> getNoticeList(Criteria cri){
		ResponseEntity<Map<String,Object>> result = null;

		try {
			cri.setPerPageNum(5);
			Map<String, Object> dataMap = boardService.getBoardList(cri, "n", "no");
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getEventList")
	public ResponseEntity<Map<String,Object>> getEventList(Criteria cri){
		ResponseEntity<Map<String,Object>> result = null;

		try {
			cri.setPerPageNum(5);
			Map<String, Object> dataMap = boardService.getBoardList(cri, "e", "no");
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getMyWorkList")
	public ResponseEntity<List<WorkVO>> getMyWorkList(String tab, HttpSession session){
		ResponseEntity<List<WorkVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		List<WorkVO> workList = null;

		try {
			if(tab.equals("wait")) {
				workList = homeService.waitMyWork(loginUser.getEno());
			}else if(tab.equals("cooper")) {
				workList = homeService.cooperReqWork(loginUser.getEno());
			}else {
				workList = homeService.proxyReqWork(loginUser.getEno());
			}
			result = new ResponseEntity<List<WorkVO>>(workList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<WorkVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getToReqList")
	public ResponseEntity<List<WorkVO>> getToReqList(String tab, HttpSession session){
		ResponseEntity<List<WorkVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		List<WorkVO> workList = null;

		try {
			if(tab.equals("objection")) {
				workList = homeService.toReqObjectionList(loginUser.getEno());
			}else if(tab.equals("cooperReq")) {
				workList = homeService.toReqCooperReqList(loginUser.getEno());
			}else {
				workList = homeService.toReqProxyReqList(loginUser.getEno());
			}
			result = new ResponseEntity<List<WorkVO>>(workList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<WorkVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getMentoWorkList")
	public ResponseEntity<List<WorkVO>> getMentoWorkList(HttpSession session){
		ResponseEntity<List<WorkVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			List<WorkVO> workList = homeService.getMentoWorkList(loginUser.getEno());
			result = new ResponseEntity<List<WorkVO>>(workList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<WorkVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getMenteeWorkList")
	public ResponseEntity<List<WorkVO>> getMenteeWorkList(HttpSession session){
		ResponseEntity<List<WorkVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			List<WorkVO> workList = homeService.getMenteeWorkList(loginUser.getEno());
			result = new ResponseEntity<List<WorkVO>>(workList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<WorkVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getDraftList")
	public ResponseEntity<List<SignDocVO>> getDraftList(int state, HttpSession session){
		ResponseEntity<List<SignDocVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			Criteria cri = new Criteria();
			cri.setPage(1);
			cri.setPerPageNum(5);
			Map<String, Object> dataMap = approvalService.getDraftList(cri, loginUser.getEno(), state);
			List<SignDocVO> draftList = (List<SignDocVO>)dataMap.get("draftList");
			result = new ResponseEntity<List<SignDocVO>>(draftList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<SignDocVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getApproveList")
	public ResponseEntity<List<SignDocVO>> getApproveList(int state, HttpSession session){
		ResponseEntity<List<SignDocVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		try {
			Criteria cri = new Criteria();
			cri.setPage(1);
			cri.setPerPageNum(5);
			Map<String, Object> dataMap = approvalService.getApproveList(cri, loginUser.getEno(), state);
			List<SignDocVO> approveList = (List<SignDocVO>)dataMap.get("approveList");
			result = new ResponseEntity<List<SignDocVO>>(approveList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<SignDocVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getMentoringDocList")
	public ResponseEntity<List<SignDocVO>> getMentoringDocList(String tab, HttpSession session){
		ResponseEntity<List<SignDocVO>> result = null;

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		List<SignDocVO> docList = null;

		try {
			if(tab.equals("mento")) {
				docList = homeService.getMentoDraftDocList(loginUser.getEno());
			}else {
				docList = homeService.getMenteeDraftDocList(loginUser.getEno());
			}
			result = new ResponseEntity<List<SignDocVO>>(docList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<SignDocVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

}
