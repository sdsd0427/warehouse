package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.dao.KwDAO;
import kr.or.warehouse.dto.PopularEmpVO;
import kr.or.warehouse.dto.PopularHashtagVO;

@Service
public class KwServiceImpl implements KwService{

	@Autowired
	private KwDAO kwDAO;
	
	@Override
	public List<PopularHashtagVO> getPopularHashTag() throws SQLException {
		return kwDAO.selectPopularHashTag();
	}

	@Override
	public List<PopularEmpVO> getPopularEmp() throws SQLException {
		return kwDAO.selectPopularEmp();
	}

}
