package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.LoginUserLogVO;

public interface LoginUserLogService {
	public void write(List<LoginUserLogVO> logList)throws SQLException;

}
