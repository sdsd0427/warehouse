package kr.or.warehouse.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.LoginUserLogVO;

@Repository
public class LoginUserLogDAOImpl implements LoginUserLogDAO{
	@Autowired
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertLoginUserLog(LoginUserLogVO logVO) throws SQLException {
		session.update("LoginUserLog-Mapper.insertLoginUserLog",logVO);
	}

	@Override
	public void deleteLoginUserLog() throws SQLException {
		session.update("LoginUserLog-Mapper.deleteLoginUserLog");
	}

}
