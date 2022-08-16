package kr.or.warehouse.controller.rest;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.MtoVO;
import kr.or.warehouse.service.MailService;
import kr.or.warehouse.service.WorkService;

@RestController
@RequestMapping("/mail")
public class MailRestController {

	@Autowired
	private MailService mailService;

	@Autowired
	private WorkService workService;

	@Resource(name = "fileUploadPath")
	private String fileUploadPath;

	// mail 중요 등록
	@RequestMapping(value = "/updateImpor", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> updateImpor(MailVO mail) {
		ResponseEntity<String> result = null;
		System.out.println(mail);

		try {
			mailService.imporUpdate(mail);
			result = new ResponseEntity<String>("중요 메일로 등록하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("중요 메일 등록에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	// mail 중요 해제
	@RequestMapping(value = "/updateImporCancel", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> updateImporCancel(MailVO mail) {
		ResponseEntity<String> result = null;

		try {
			mailService.imporCancelUpdate(mail);
			result = new ResponseEntity<String>("중요 메일을 해제하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("중요 메일 해제 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	// mto 중요 등록
	@RequestMapping(value = "/updateMtoImpor", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> updateMtoImpor(MtoVO mto, HttpSession session) {
		ResponseEntity<String> result = null;
		System.out.println(mto);

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		mto.setEno(eno);

		try {
			mailService.imporMtoUpdate(mto);
			result = new ResponseEntity<String>("중요 메일로 등록하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("중요 메일 등록에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	// mto 중요 해제
	@RequestMapping(value = "/updateMtoImporCancel", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> updateMtoImporCancel(MtoVO mto, HttpSession session) {
		ResponseEntity<String> result = null;

		// session에서 eno 가져오기
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		mto.setEno(eno);

		try {
			mailService.imporMtoCancelUpdate(mto);
			result = new ResponseEntity<String>("중요 메일을 해제하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("중요 메일 해제 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping(value = "/insertTemp", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> insertTemp(MailVO mail,
			@RequestParam(value = "receiver", required = false) List<Integer> receiver) {
		ResponseEntity<String> result = null;
		System.out.println(receiver);
		System.out.println(mail);

		try {

			System.out.println("RestController receiver : " + receiver);

			String savePath = this.fileUploadPath;
			List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(mail.getUploadFile(), savePath);

			mail.setAttachList(attachList);
			mailService.registTemp(mail, receiver);

			result = new ResponseEntity<String>("메일을 임시저장하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("메일 임시저장에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}

	@RequestMapping("/getEmpByNodeId.do")
	public ResponseEntity<EmployeeVO> getEmpByNodeId(int eno) throws Exception {
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
	
	
	@RequestMapping("/countMail")
	public ResponseEntity<Integer> countMail(int eno) throws Exception{
		ResponseEntity<Integer> entity = null;
		int count = 0;
		try {
			count = mailService.selectNoReadMailListCount(eno);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return entity;
	}
	
}
