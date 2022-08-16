package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.QnaReplyVO;
import kr.or.warehouse.dto.QnaVO;

public interface QnaDAO {

	void insertQna(QnaVO qna) throws SQLException;
	void insertQnaReply(QnaReplyVO qnaReply) throws SQLException;
	void updateQna(QnaVO qna) throws SQLException;
	void updateQnaReply(QnaReplyVO qnaReply) throws SQLException;
	void deleteQna(int qnaNo) throws SQLException;
	void deleteQnaReply(int qrno) throws SQLException;
	List<QnaVO> selectWorkQnaList(String wcode, Criteria cri) throws SQLException;
	int selectWorkQnaTotalCount(String wcode) throws SQLException;
	List<QnaReplyVO> selectWorkQnaReplyList(int qnaNo, Criteria cri) throws SQLException;
	int selectWorkQnaReplyTotalCount(int qnaNo) throws SQLException;
	QnaVO selectWorkQnaDetail(int qnaNo) throws SQLException;
	QnaReplyVO selectWorkQnaReplyDetail(int qrno) throws SQLException;
}
