package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.PopularEmpVO;
import kr.or.warehouse.dto.PopularHashtagVO;

@Repository
public class KwDAOImpl implements KwDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<PopularHashtagVO> selectPopularHashTag() throws SQLException {
		return session.selectList("Kw-Mapper.selectPopularHashTag");
	}

	@Override
	public List<PopularEmpVO> selectPopularEmp() throws SQLException {
		return session.selectList("Kw-Mapper.selectPopularEmp");
	}

}
