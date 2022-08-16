package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SignDocVO> selectRequiredDocumentList(String signNo, RowBounds rowBounds) throws SQLException {
		return session.selectList("Approval-Mapper.selectRequiredDocumentList",signNo,rowBounds);
	}

	@Override
	public int selectRequiredDocumentListCount(String signNo) throws SQLException {
		return session.selectOne("Approval-Mapper.selectRequiredDocumentListCount",signNo);
	}

	@Override
	public String selectName(String signNo) {
		return session.selectOne("Approval-Mapper.selectName",signNo);
	}

	@Override
	public SignFormVO selectSignForm(String sFormNo) {
		return session.selectOne("Approval-Mapper.selectSignForm",sFormNo);
	}

	@Override
	public List<SignDocVO> selectPopularApprovalList(int eno) throws SQLException {
		return session.selectList("Approval-Mapper.selectPopularApprovalList", eno);
	}

	@Override
	public List<SignDocVO> selectMyReturnSignDocList(int eno) throws SQLException {
		return session.selectList("Approval-Mapper.selectMyReturnSignDocList", eno);
	}

}
