package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Autowired
	private SqlSession session;


	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		return session.selectList("Menu-Mapper.selectMainMenu");
	}


	@Override
	public List<MenuVO> selectSubMenu(String mCode) throws SQLException {
		return session.selectList("Menu-Mapper.selectSubMenu",mCode);
	}


	@Override
	public MenuVO selectMenuByMcode(String mCode) throws SQLException {
		return session.selectOne("Menu-Mapper.selectMenuByMcode",mCode);
	}


	@Override
	public MenuVO selectMenuByMname(String mName) throws SQLException {
		return session.selectOne("Menu-Mapper.selectMenuByMname",mName);
	}


}
