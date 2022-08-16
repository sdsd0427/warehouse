package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.SignDocVO;

public interface MyPageDAO {

	//로그인 정보
	EmployeeVO selectMyList(Map<String, Object> dataMap) throws SQLException;
	
	//정보수정
	public void updateMyInfo(EmployeeVO employee) throws SQLException;


}
