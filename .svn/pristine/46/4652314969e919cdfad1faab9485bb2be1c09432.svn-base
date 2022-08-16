package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.MakeFileName;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.ApprovalDocBoxDAO;
import kr.or.warehouse.dao.EmployeeDAO;
import kr.or.warehouse.dao.MyPageDAO;
import kr.or.warehouse.dto.EmployeeVO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO myPageDAO;

	//회원정보
	@Override
	public Map<String, Object> getMyInfoList(int eno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("eno", eno);
		
		EmployeeVO myList = myPageDAO.selectMyList(dataMap);
		String photo = MakeFileName.parseFileNameFromUUID(myList.getPhoto(), "\\$\\$");
		String signpath = MakeFileName.parseFileNameFromUUID(myList.getSignpath(), "\\$\\$");
		myList.setPhoto(photo);
		myList.setSignpath(signpath);

		dataMap.put("myList", myList);

		return dataMap;
	}
	
	//정보수정
	@Override
	public void modifyInfo(EmployeeVO employee) throws SQLException {
		myPageDAO.updateMyInfo(employee);
	}

	
	
}
