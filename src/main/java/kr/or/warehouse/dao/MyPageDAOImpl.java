package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.EmployeeVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public EmployeeVO selectMyList(Map<String, Object> dataMap) throws SQLException {
		return session.selectOne("Mypage-Mapper.selectMyList", dataMap);
	}

	@Override
	public void updateMyInfo(EmployeeVO employee) throws SQLException {
		 session.update("Mypage-Mapper.updateMyInfo", employee);
	}
	

}
