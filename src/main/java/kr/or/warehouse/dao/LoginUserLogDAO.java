package kr.or.warehouse.dao;

import java.sql.SQLException;

import kr.or.warehouse.dto.LoginUserLogVO;

public interface LoginUserLogDAO {
	public void insertLoginUserLog(LoginUserLogVO logVO)throws SQLException;
	public void deleteLoginUserLog()throws SQLException;
}
