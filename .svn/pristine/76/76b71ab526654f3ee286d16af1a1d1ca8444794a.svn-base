package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.MenuVO;

public interface MenuDAO {

	//���θ޴�
	List<MenuVO> selectMainMenu() throws SQLException;
	
	//����޴�
	List<MenuVO> selectSubMenu(String mCode) throws SQLException;
	
	//�޴�����
	MenuVO selectMenuByMcode(String mCode) throws SQLException;
	MenuVO selectMenuByMname(String mName) throws SQLException;
}
