package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{

	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public EmployeeVO selectEmployeeByEno(int eno) throws SQLException {
		EmployeeVO employee=session.selectOne("Employee-Mapper.selectEmployeeByEno",eno);
		return employee;
	}

	@Override
	public List<String> userAuthorities(int eno) throws SQLException {
		return session.selectList("Employee-Mapper.userAuthorities",eno);
	}

}
