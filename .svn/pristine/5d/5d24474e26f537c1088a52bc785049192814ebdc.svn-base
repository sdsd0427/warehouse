package kr.or.warehouse.controller.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.dto.VacLogVO;
import kr.or.warehouse.dto.VacProduceVO;
import kr.or.warehouse.service.HrService;

@RestController
@RequestMapping("/ehr")
public class EhrRestController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EhrRestController.class);

	@Autowired
	private HrService hrService;

	//주간 섬네일 계산
	@RequestMapping("/weekCalc")
	public ResponseEntity<List<Map<String, Object>>> weekCalc(HrVO hr) throws Exception{
		ResponseEntity<List<Map<String, Object>>> entity = null;

		System.out.println("cotroller : "+hr);

		List<Map<String, Object>> weekCalc = null;

		try {
			weekCalc = hrService.getWeekCalc(hr);
			System.out.println(weekCalc);
			entity = new ResponseEntity<List<Map<String, Object>>>(weekCalc, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Map<String, Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}
	
	//주간 근태 테이블 가져오기
	@RequestMapping("/weekTable")
	public ResponseEntity<List<HrVO>> weekTable(int eno, String weekStart) throws Exception{
		ResponseEntity<List<HrVO>> entity = null;
		System.out.println("cotroller : "+weekStart);
		List<HrVO> weekTable = null;
		
		try {
			weekTable = hrService.getWeekTable(eno, weekStart);
			System.out.println(weekTable);
			entity = new ResponseEntity<List<HrVO>>(weekTable, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<HrVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return entity;
	}

	//근무상태 변경
	@RequestMapping("/changeCondition")
	public ResponseEntity<String> changeCondition(EmployeeVO employee) throws Exception{
		ResponseEntity<String> entity = null;

		try {
			hrService.changeCondition(employee);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	//출근하기
	@RequestMapping("/goToWork")
	public ResponseEntity<String> goToWork(HrVO hr, HttpServletRequest request) throws Exception{
		ResponseEntity<String> entity = null;
		String ip = request.getRemoteAddr();
		System.out.println(ip);
		System.out.println(hr);

		try {
			String result = hrService.goToWorklogFile(hr, ip);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	//csv에서 출근시간 가져오기
	@RequestMapping("/getOnTime")
	public ResponseEntity<String> getOnTime(int eno) throws Exception{
		ResponseEntity<String> entity = null;

		try {
			String onTime = hrService.getOnTime(eno);
			entity = new ResponseEntity<String>(onTime, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	//퇴근하기
	@RequestMapping("/leaveWork")
	public ResponseEntity<String> leaveWork(HrVO hr, HttpServletRequest request) throws Exception{
		ResponseEntity<String> entity = null;

		String ip = request.getRemoteAddr();
		System.out.println("remoteIp : " + ip);

		try {
			String result = hrService.leaveWorklogFile(hr, ip);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	//csv에서 퇴근시간 가져오기
	@RequestMapping("/getOffTime")
	public ResponseEntity<String> getOffTime(int eno) throws Exception{
		ResponseEntity<String> entity = null;

		try {
			String onTime = hrService.getOffTime(eno);
			entity = new ResponseEntity<String>(onTime, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping("/vacationUsageHistory")
	public ResponseEntity<List<VacLogVO>> vacationUsageHistory(int eno, String vyear) throws Exception{
		ResponseEntity<List<VacLogVO>> entity = null;

		List<VacLogVO> vacationUsageHistory = null;
		try {
			vacationUsageHistory = hrService.VacationUsageHistory(eno, vyear);
			entity = new ResponseEntity<List<VacLogVO>>(vacationUsageHistory, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<VacLogVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping("/vacationProduceHistory")
	public ResponseEntity<List<VacProduceVO>> vacationProduceHistory(int eno, String vyear) throws Exception{
		ResponseEntity<List<VacProduceVO>> entity = null;

		List<VacProduceVO> vacationUsageHistory = null;
		try {
			vacationUsageHistory = hrService.VacationProduceHistory(eno, vyear);
			entity = new ResponseEntity<List<VacProduceVO>>(vacationUsageHistory, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<VacProduceVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}



}
