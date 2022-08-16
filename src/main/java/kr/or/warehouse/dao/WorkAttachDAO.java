package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.AttachVO;

public interface WorkAttachDAO {

	 List<AttachVO> selectWorkAttachByWcode(String refNo)throws SQLException;

	 AttachVO selectWorkAttachByWano(String attachNo)throws SQLException;

	 void insertWorkAttach(AttachVO attach) throws SQLException;

	 void deleteWorkAttach(String attachNo) throws SQLException;

	 void deleteAllWorkAttach(String refNo) throws SQLException;

	 String selectWano() throws SQLException;
}
