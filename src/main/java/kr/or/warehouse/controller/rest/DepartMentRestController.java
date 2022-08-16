package kr.or.warehouse.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.service.DepartMentService;

@RestController
@RequestMapping("/departMent")
public class DepartMentRestController {

	@Autowired
	DepartMentService service;

	@RequestMapping("/list")
	public ResponseEntity<List<DepartmentVO>> list() throws Exception{
		ResponseEntity<List<DepartmentVO>> result = null;
		System.out.println("list");
		try {
			List<DepartmentVO> departMentList = service.getDepartMentList();
			result = new ResponseEntity<List<DepartmentVO>>(departMentList, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<List<DepartmentVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

}
