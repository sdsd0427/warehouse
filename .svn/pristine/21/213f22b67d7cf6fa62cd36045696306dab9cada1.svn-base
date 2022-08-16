package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.AttachVO;

public interface ManualAttachDAO {

	 List<AttachVO> selectManualAttachesByManualNo(String refNo)throws SQLException;

	 AttachVO selectManualAttachByMaNo(String attachNo)throws SQLException;

	 void insertManualAttach(AttachVO attach) throws SQLException;

	 void deleteManualAttach(String attachNo) throws SQLException;

	 void deleteAllManualAttach(String refNo) throws SQLException;

	 String selectMaNo() throws SQLException;
}
