package kr.or.warehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.dto.CommonVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.SignalVO;

public interface SignalDAO {

	List<SignalVO> selectSignalList(Map<String, Object> paramMap, RowBounds rowBounds) throws Exception;
	
	int selectSignalListCount(Map<String, Object> paramMap) throws Exception;
	
	int selectSignalCountByEno(int eno) throws Exception;
	
	CommonVO selectCommon(String classCode) throws Exception;
	
	void updateSignalCheck(String signalNo) throws Exception;
	
	void insertSignal(SignalVO signal) throws Exception;
	
	SignalVO selectSignalBySignalNo(String signalNo) throws Exception;
	
	String selectSignalSeqNext() throws Exception;
	
	void deleteSignalBySignalNo(String signalNo) throws Exception;
	
//	EmployeeVO selectEmpForFrom(int eno) throws Exception;
}
