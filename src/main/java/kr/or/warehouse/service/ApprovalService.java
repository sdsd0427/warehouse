package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.SignDocVO;

public interface ApprovalService {
	
	Map<String,Object> getRequiredDocumentList(Criteria cri, String signNo, int eno)throws SQLException;
	
	List<SignDocVO> getPopularApprovalList(int eno) throws SQLException;
	
	List<SignDocVO> getMyReturnSignDocList(int eno) throws SQLException;
}
