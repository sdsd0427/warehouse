package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.AttachVO;

@Repository
public class BoardAttachDAOImpl implements BoardAttachDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<AttachVO> selectAttachByBoardNo(String boardNo) throws SQLException {
		return session.selectList("BoardAttach-Mapper.selectAttachByBoardNo",boardNo);
	}

	@Override
	public AttachVO selectAttachByAttachNo(String attachNo) throws SQLException {
		return session.selectOne("BoardAttach-Mapper.selectAttachByAttachNo",attachNo);
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.insert("BoardAttach-Mapper.insertAttach",attach);
	}

	@Override
	public void deleteAttach(String attachNo) throws SQLException {
		session.delete("BoardAttach-Mapper.deleteAttach",attachNo);
	}

	@Override
	public void deleteAllAttach(String boardNo) throws SQLException {
		session.delete("BoardAttach-Mapper.deleteAllAttach",boardNo);
	}

	@Override
	public String selectAttachNo() throws SQLException {
		return session.selectOne("BoardAttach-Mapper.selectAttachNo");
	}

}
