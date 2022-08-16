package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.MtoVO;

@Repository
public class MailDAOImpl implements MailDAO {

	@Autowired
	private SqlSession session;

	@Override
	public String selectName(String mailNo) throws SQLException {
		return session.selectOne("Mail-Mapper.selectName", mailNo);
	}

	@Override
	public int selectEnoByName(String name) throws SQLException {
		return session.selectOne("Mail-Mapper.selectEnoByName", name);
	}

	@Override
	public String selectNameByEno(int eno) throws SQLException {
		return session.selectOne("Mail-Mapper.selectNameByEno", eno);
	}

	@Override
	public List<MtoVO> selectMtoList(String mailNo) throws SQLException {
		return session.selectList("Mail-Mapper.selectMtoList", mailNo);
	}
	
	@Override
	public String selectMailNo() throws SQLException {
		return session.selectOne("Mail-Mapper.selectMailNo");
	}

	@Override
	public List<MailVO> selectMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Mail-Mapper.selectMailList", paramMap, rowBounds);
	}

	@Override
	public int selectMailListCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectMailListCount", paramMap);
	}
	
	@Override
	public int selectNoReadMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectNoReadMailListCount", paramMap);
	}
	
	@Override
	public List<MailVO> selectSendMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Mail-Mapper.selectSendMailList", paramMap, rowBounds);
	}

	@Override
	public List<MtoVO> selectReceiver(String mailNo) throws SQLException {
		return session.selectList("Mail-Mapper.selectReceiver", mailNo);
	}

	@Override
	public int selectSendMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectSearchSendMailListCount", paramMap);
	}

	@Override
	public List<MailVO> selectImporMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Mail-Mapper.selectImporMailList", paramMap, rowBounds);
	}

	@Override
	public int selectImporMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectImporMailListCount", paramMap);
	}
	
	@Override
	public int selectNoReadImporMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectNoReadImporMailListCount", paramMap);
	}

	@Override
	public List<MailVO> selectTrashMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Mail-Mapper.selectTrashMailList", paramMap, rowBounds);
	}

	@Override
	public int selectTrashMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectSearchTrashMailListCount", paramMap);
	}

	@Override
	public List<MailVO> selectToMeMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Mail-Mapper.selectToMeMailList", paramMap, rowBounds);
	}

	@Override
	public int selectToMeMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectToMeMailListCount", paramMap);
	}
	
	@Override
	public int selectNoReadToMeMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectNoReadToMeMailListCount", paramMap);
	}

	@Override
	public List<MailVO> selectTempMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Mail-Mapper.selectTempMailList", paramMap, rowBounds);
	}

	@Override
	public int selectTempMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Mail-Mapper.selectSearchTempMailListCount", paramMap);
	}

	@Override
	public void insertMail(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.insertMail", mail);
	}

	@Override
	public void insertMto(MtoVO mto) throws SQLException {
		session.update("Mail-Mapper.insertMto", mto);
	}

	@Override
	public void insertTempMail(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.insertTempMail", mail);
	}

	@Override
	public void updateMailImportant(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.updateMailImportant", mail);
	}

	@Override
	public void updateMailImportantCancel(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.updateMailImportantCancel", mail);
	}
	
	@Override
	public void updateMtoImportant(MtoVO mto) throws SQLException {
		session.update("Mail-Mapper.updateMtoImportant", mto);
	}

	@Override
	public void updateMtoImportantCancel(MtoVO mto) throws SQLException {
		session.update("Mail-Mapper.updateMtoImportantCancel", mto);
	}
	
	@Override
	public MailVO selectMailByMailNo(String mailNo) throws SQLException {
		return session.selectOne("Mail-Mapper.selectMailByMailNo", mailNo);
	}

	@Override
	public void updateMailTrash(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.updateMailTrash", mail);
	}
	
	@Override
	public void updateMailTrashRevert(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.updateMailTrashRevert", mail);
	}
	
	@Override
	public void updateMailTrashMtoDel(MtoVO mto) throws SQLException {
		session.update("Mail-Mapper.updateMailTrashMtoDel", mto);
	}
	
	@Override
	public void updateMailTrashMFromDel(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.updateMailTrashMFromDel", mail);
	}

	@Override
	public void updateMailMtoCheck(MailVO mail) throws SQLException {
		session.update("Mail-Mapper.updateMailMtoCheck", mail);
	}

	@Override
	public void updateMailMtoCheckByChecked(MtoVO mto) throws SQLException {
		session.update("Mail-Mapper.updateMailMtoCheckByChecked", mto);
	}




	
}
