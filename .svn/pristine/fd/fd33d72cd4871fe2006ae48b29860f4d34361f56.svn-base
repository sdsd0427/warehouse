package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.dao.LoginUserLogDAO;
import kr.or.warehouse.dto.LoginUserLogVO;

@Service
public class LoginUserLogServiceImpl implements LoginUserLogService{
	@Autowired
	private LoginUserLogDAO loginUserLogDAO;
	public void setLoginUserLogDAO(LoginUserLogDAO loginUserLogDAO) {
		this.loginUserLogDAO = loginUserLogDAO;
	}


	@Override
	public void write(List<LoginUserLogVO> logList) throws SQLException {
		loginUserLogDAO.deleteLoginUserLog();
		for(LoginUserLogVO logVO : logList) {
			loginUserLogDAO.insertLoginUserLog(logVO);
		}
	}

}
