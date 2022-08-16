package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReplyVO;

public interface BoardReplyDAO {
	List<ReplyVO> selectReplyList(String boardNo, Criteria cri) throws SQLException;
	String selectReplyNo() throws SQLException;
	String selectName(String rno) throws SQLException;
	String selectPhoto(int eno) throws SQLException;

	int countReply(String boardNo) throws SQLException;

	void insertReply(ReplyVO reply) throws SQLException;
	int selectEno(String boardNo) throws SQLException;

	void updateReply(ReplyVO reply) throws SQLException;

	void deleteReply(String replyNo) throws SQLException;

	public void deleteAllReply(String boardNo)throws SQLException;

}
