package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.AttachVO;

public interface MailAttachDAO {

	List<AttachVO> selectMailAttachesByMailNo(String refNo) throws SQLException;

	AttachVO selectMailAttachByMaNo(String attachNo) throws SQLException;

	void insertMailAttach(AttachVO attach) throws SQLException;

	void deleteMailAttach(String attachNo) throws SQLException;

	void deleteAllMailAttach(String refNo) throws SQLException;

	String selectMaNo() throws SQLException;

}
