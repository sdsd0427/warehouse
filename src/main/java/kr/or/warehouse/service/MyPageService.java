package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;

public interface MyPageService {

	// 로그인 정보
	Map<String, Object> getMyInfoList(int eno) throws SQLException;
	
	//정보수정
	public void modifyInfo(EmployeeVO employee) throws SQLException;

}
