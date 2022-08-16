package kr.or.warehouse.controller.rest;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.dto.SignalVO;
import kr.or.warehouse.service.SignalService;

@RestController
@RequestMapping("/signal")
public class SignalRestController {
	
	@Resource(name = "signalService")
	private SignalService signalService;
	
	@RequestMapping("/sendSignal")
	public ResponseEntity<SignalVO> sendSignal(SignalVO signal) throws Exception{
		System.out.println("signal: " + signal);
		ResponseEntity<SignalVO> entity = null;
		SignalVO send = null;
		
		try {
			send = signalService.send(signal);
			entity = new ResponseEntity<SignalVO>(send, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<SignalVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}
	
	@RequestMapping("/countSignal")
	public ResponseEntity<Integer> countSignal(int eno) throws Exception{
		ResponseEntity<Integer> entity = null;
		int count = 0;
		try {
			count = signalService.countSignal(eno);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping("/readNoSync")
	public ResponseEntity<String> readNoSync(String signalNo) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			signalService.read(signalNo);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return entity;
	}
	
}
