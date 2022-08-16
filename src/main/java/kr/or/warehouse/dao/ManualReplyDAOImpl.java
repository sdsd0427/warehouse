package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReplyVO;

@Repository
public class ManualReplyDAOImpl implements ManualReplyDAO{

	@Autowired
	private SqlSession session;

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		System.out.println(reply);
		session.update("ManualReply-Mapper.insertReply",reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		session.update("ManualReply-Mapper.updateReply",reply);
	}

	@Override
	public void deleteReply(String rno) throws SQLException {
		session.update("ManualReply-Mapper.deleteReply",rno);
	}

	@Override
	public String selectRno() throws SQLException {
		return session.selectOne("ManualReply-Mapper.selectReplyNo");
	}

	@Override
	public List<ReplyVO> selectReplyListPage(String refNo, RowBounds rowBounds) throws SQLException {
		return session.selectList("ManualReply-Mapper.selectReplyList",refNo,rowBounds);
	}

	@Override
	public int countReply(String refNo) throws SQLException {
		return session.selectOne("ManualReply-Mapper.countReply",refNo);
	}

	@Override
	public String selectName(String rno) throws SQLException {
		return session.selectOne("ManualReply-Mapper.selectName",rno);
	}

	@Override
	public String selectPhoto(String rno) throws SQLException {
		return session.selectOne("ManualReply-Mapper.selectPhoto",rno);
	}

}
