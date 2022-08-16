package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dao.MenuDAO;
import kr.or.warehouse.dto.MenuVO;

public interface MenuService {

	List<MenuVO> getMainMenuList() throws SQLException;
	List<MenuVO> getSubMenuList(String mCode) throws SQLException;
	
	MenuVO getMenuByMcode(String mCode) throws SQLException;
	MenuVO getMenuByMname(String mName) throws SQLException;
}
