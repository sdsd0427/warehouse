package kr.or.warehouse.service;

import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.SignalVO;

public interface SignalService {

	Map<String, Object> getSignalList(Criteria cri, int eno) throws Exception;
	
	void read(String signalNo) throws Exception;
	
	SignalVO send(SignalVO signal) throws Exception;
	
	int countSignal(int eno) throws Exception;
	
	void remove(String signalNo) throws Exception;
	
//	EmployeeVO getEmpForFrom(int eno) throws Exception;
}
