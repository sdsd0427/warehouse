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
public class BoardReplyDAOImpl implements BoardReplyDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<ReplyVO> selectReplyList(String boardNo, Criteria cri) throws SQLException {
		System.out.println("rdao");
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		return session.selectList("BoardReply-Mapper.selectReplyList",boardNo,rowBounds);
	}

	@Override
	public String selectReplyNo() throws SQLException {
		return session.selectOne("BoardReply-Mapper.selectReplyNo");
	}

	@Override
	public int countReply(String boardNo) throws SQLException {
		return session.selectOne("BoardReply-Mapper.countReply",boardNo);
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		System.out.println("insertReplydao");
		session.insert("BoardReply-Mapper.insertReply",reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		session.update("BoardReply-Mapper.updateReply",reply);
	}

	@Override
	public void deleteReply(String replyNo) throws SQLException {
		session.delete("BoardReply-Mapper.deleteReply",replyNo);
	}

	@Override
	public String selectName(String rno) throws SQLException {
		return session.selectOne("BoardReply-Mapper.selectName",rno);
	}

	@Override
	public int selectEno(String boardNo) throws SQLException {
		return session.selectOne("BoardReply-Mapper.selectEno", boardNo);
	}

	@Override
	public void deleteAllReply(String boardNo) throws SQLException {
		session.delete("BoardReply-Mapper.deleteAllReply",boardNo);
	}

	@Override
	public String selectPhoto(int eno) throws SQLException {
		return session.selectOne("BoardReply-Mapper.selectPhoto", eno);
	}

}
