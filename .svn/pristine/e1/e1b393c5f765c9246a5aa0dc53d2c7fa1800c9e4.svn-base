package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;

@Repository
public class DepartMentDAOImpl implements DepartMentDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<DepartmentVO> selectDepartMentList() throws SQLException {
		return session.selectList("Department-Mapper.selectDepartMentList");
	}

	@Override
	public DepartmentVO selectDepartmentByDno(int dno) throws SQLException {
		return session.selectOne("Department-Mapper.selectDepartmentByDno", dno);
	}

	@Override
	public List<EmployeeVO> selectEmployeeListByDno(int dno) throws SQLException {
		return session.selectList("Department-Mapper.selectEmployeeListByDno", dno);
	}

}
