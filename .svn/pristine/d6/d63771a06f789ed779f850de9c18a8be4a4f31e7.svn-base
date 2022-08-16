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
public class CommunityReplyDAOImpl implements CommunityReplyDAO{

	@Autowired
	private SqlSession session;

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		session.selectOne("CommunityReply-Mapper.insertReply",reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		session.selectOne("CommunityReply-Mapper.updateReply",reply);
	}

	@Override
	public void deleteReply(String rno) throws SQLException {
		session.selectOne("CommunityReply-Mapper.deleteReply",rno);
	}

	@Override
	public String selectRno() throws SQLException {
		return session.selectOne("CommunityReply-Mapper.selectReplyNo");
	}

	@Override
	public List<ReplyVO> selectReplyListPage(String refNo, RowBounds rowBounds) throws SQLException {
		return session.selectList("CommunityReply-Mapper.selectReplyList",refNo,rowBounds);
	}

	@Override
	public int countReply(String refNo) throws SQLException {
		return session.selectOne("CommunityReply-Mapper.countReply",refNo);
	}

}
