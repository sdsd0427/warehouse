package kr.or.warehouse.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CalendarVO;
import kr.or.warehouse.service.CalendarService;

@RestController
@RequestMapping("/calendar")
public class CalendarRestController {

	@Autowired
	private CalendarService service;
	
	@RequestMapping("/getCalendar")
	public ResponseEntity<List<CalendarVO>> getCalendarList(Criteria cri, int eno) throws Exception{
		ResponseEntity<List<CalendarVO>> result = null;
		
		List<CalendarVO> calendarList = service.getCalendarList(cri, eno);
		result = new ResponseEntity<List<CalendarVO>>(calendarList, HttpStatus.OK);
		
		return result;
	}
	
}
