package kr.or.warehouse.service;

import java.sql.SQLException;

import kr.or.warehouse.controller.advisor.InvalidPasswordException;
import kr.or.warehouse.controller.advisor.NotFoundIdException;
import kr.or.warehouse.dto.EmployeeVO;

public interface EmployeeService {
	public EmployeeVO getEmployee(int eno) throws SQLException;

	void login(int eno, String pwd) throws NotFoundIdException, InvalidPasswordException, SQLException;

}
