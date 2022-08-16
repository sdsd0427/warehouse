package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.AttachVO;

@Repository
public class WorkAttachDAOImpl implements WorkAttachDAO{

	@Autowired
	SqlSession session;

	@Override
	public List<AttachVO> selectWorkAttachByWcode(String wcode) throws SQLException {
		return session.selectList("WorkAttach-Mapper.selectWorkAttachByWcode",wcode);
	}

	@Override
	public AttachVO selectWorkAttachByWano(String attachNo) throws SQLException {
		return session.selectOne("WorkAttach-Mapper.selectWorkAttachByWano",attachNo);
	}

	@Override
	public void insertWorkAttach(AttachVO attach) throws SQLException {
		session.update("WorkAttach-Mapper.insertWorkAttach",attach);
	}

	@Override
	public void deleteWorkAttach(String attachNo) throws SQLException {
		session.update("WorkAttach-Mapper.deleteWorkAttach",attachNo);
		
	}

	@Override
	public void deleteAllWorkAttach(String refNo) throws SQLException {
		session.update("WorkAttach-Mapper.deleteAllWorkAttach",refNo);
	}

	@Override
	public String selectWano() throws SQLException {
		return session.selectOne("WorkAttach-Mapper.selectWano");
	}

}
