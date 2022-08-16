package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.AttachVO;

public interface BoardAttachDAO {
	public List<AttachVO> selectAttachByBoardNo(String boardNo)throws SQLException;
	public AttachVO selectAttachByAttachNo(String attachNo)throws SQLException;

	public void insertAttach(AttachVO attach) throws SQLException;

	public void deleteAttach(String attachNo) throws SQLException;

	public void deleteAllAttach(String boardNo)throws SQLException;

	String selectAttachNo() throws SQLException;
}
