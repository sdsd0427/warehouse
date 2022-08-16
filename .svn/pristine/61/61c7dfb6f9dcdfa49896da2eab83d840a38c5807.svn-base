package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.QnaReplyVO;
import kr.or.warehouse.dto.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession session;

	@Override
	public void insertQna(QnaVO qna) throws SQLException {
		session.insert("Qna-Mapper.insertQna", qna);
	}

	@Override
	public void insertQnaReply(QnaReplyVO qnaReply) throws SQLException {
		session.insert("Qna-Mapper.insertQnaReply", qnaReply);
	}

	@Override
	public void updateQna(QnaVO qna) throws SQLException {
		session.update("Qna-Mapper.updateQna", qna);
	}

	@Override
	public void updateQnaReply(QnaReplyVO qnaReply) throws SQLException {
		session.update("Qna-Mapper.updateQnaReply", qnaReply);
	}

	@Override
	public void deleteQna(int qnaNo) throws SQLException {
		session.delete("Qna-Mapper.deleteQna", qnaNo);
	}

	@Override
	public void deleteQnaReply(int qrno) throws SQLException {
		session.delete("Qna-Mapper.deleteQnaReply", qrno);
	}

	@Override
	public List<QnaVO> selectWorkQnaList(String wcode, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Qna-Mapper.selectWorkQnaList", wcode, rowBounds);
	}

	@Override
	public List<QnaReplyVO> selectWorkQnaReplyList(int qnaNo, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Qna-Mapper.selectWorkQnaReplyList", qnaNo, rowBounds);
	}

	@Override
	public QnaVO selectWorkQnaDetail(int qnaNo) throws SQLException {
		return session.selectOne("Qna-Mapper.selectWorkQnaDetail", qnaNo);
	}

	@Override
	public QnaReplyVO selectWorkQnaReplyDetail(int qrno) throws SQLException {
		return session.selectOne("Qna-Mapper.selectWorkQnaReplyDetail", qrno);
	}

	@Override
	public int selectWorkQnaTotalCount(String wcode) throws SQLException {
		return session.selectOne("Qna-Mapper.selectWorkQnaTotalCount", wcode);
	}

	@Override
	public int selectWorkQnaReplyTotalCount(int qnaNo) throws SQLException {
		return session.selectOne("Qna-Mapper.selectWorkQnaReplyTotalCount", qnaNo);
	}

}
