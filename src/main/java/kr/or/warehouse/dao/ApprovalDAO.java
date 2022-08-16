package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;


public interface ApprovalDAO {
	
	public List<SignDocVO> selectRequiredDocumentList(String signNo, RowBounds rowBounds) throws SQLException;
	
	public int selectRequiredDocumentListCount(String signNo) throws SQLException;
	
	public String selectName(String signNo);
	
	public SignFormVO selectSignForm(String sFormNo);
	
	public List<SignDocVO> selectPopularApprovalList(int eno) throws SQLException;
	
	public List<SignDocVO> selectMyReturnSignDocList(int eno) throws SQLException;
	
	
}
