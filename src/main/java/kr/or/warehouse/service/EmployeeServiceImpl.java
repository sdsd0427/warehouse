package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.controller.advisor.InvalidPasswordException;
import kr.or.warehouse.controller.advisor.NotFoundIdException;
import kr.or.warehouse.dao.EmployeeDAO;
import kr.or.warehouse.dto.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDAO employeeDAO;
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}


	@Override
	public EmployeeVO getEmployee(int eno) throws SQLException {
		EmployeeVO employee = null;
		System.out.println(employeeDAO);
		employee = employeeDAO.selectEmployeeByEno(eno);
		employee.setAname(employeeDAO.userAuthorities(eno));
		return employee;
	}


	@Override
	public void login(int eno, String pwd) throws NotFoundIdException, InvalidPasswordException, SQLException {
			EmployeeVO employee = employeeDAO.selectEmployeeByEno(eno);
			if (employee == null)
				throw new NotFoundIdException();
			if (!pwd.equals(employee.getPwd()))
				throw new InvalidPasswordException();

	}

}
