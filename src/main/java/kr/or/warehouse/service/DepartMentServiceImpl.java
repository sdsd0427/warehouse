package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.dao.DepartMentDAO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;

@Service
public class DepartMentServiceImpl implements DepartMentService{

	@Autowired
	private DepartMentDAO dao;

	@Override
	public List<DepartmentVO> getDepartMentList() throws SQLException {

		List<DepartmentVO> departMentList = dao.selectDepartMentList();
		for(DepartmentVO dep : departMentList) {
			int dno = dep.getDno();
			List<EmployeeVO> empList = dao.selectEmployeeListByDno(dno);
			dep.setEmpList(empList);
		}

		return departMentList;
	}


}
