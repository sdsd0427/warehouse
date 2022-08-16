package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.AttachVO;

@Repository
public class MailAttachDAOImpl implements MailAttachDAO{

	@Autowired
	SqlSession session;

	@Override
	public List<AttachVO> selectMailAttachesByMailNo(String refNo) throws SQLException {
		return session.selectList("MailAttach-Mapper.selectMailAttachByMailNo", refNo);
	}

	@Override
	public AttachVO selectMailAttachByMaNo(String attachNo) throws SQLException {
		return session.selectOne("MailAttach-Mapper.selectMailAttachByMaNo",attachNo);
	}
	
	@Override
	public void insertMailAttach(AttachVO attach) throws SQLException {
		session.update("MailAttach-Mapper.insertMailAttach", attach);
	}

	@Override
	public void deleteMailAttach(String attachNo) throws SQLException {
		session.update("MailAttach-Mapper.deleteMailAttach", attachNo);
	}
	
	@Override
	public void deleteAllMailAttach(String refNo) throws SQLException {
		session.update("MailAttach-Mapper.deleteAllMailAttach",refNo);		
	}
	
	@Override
	public String selectMaNo() throws SQLException {
		return session.selectOne("MailAttach-Mapper.selectMaNo");
	}

	

}
