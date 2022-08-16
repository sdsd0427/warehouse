package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;


import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;

public interface DepartMentDAO {

	public List<DepartmentVO> selectDepartMentList() throws SQLException;

	//dno로 부서정보 select
	DepartmentVO selectDepartmentByDno(int dno) throws SQLException;

	//부서의 사원목록
	List<EmployeeVO> selectEmployeeListByDno(int dno) throws SQLException;
}
