package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.PopularEmpVO;
import kr.or.warehouse.dto.PopularHashtagVO;

public interface KwService {
	
	List<PopularHashtagVO> getPopularHashTag()throws SQLException;
	
	List<PopularEmpVO> getPopularEmp()throws SQLException;
}
