package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReplyVO;

public interface BoardReplyService {
	Map<String, Object> getReplyList(String boardNo, Criteria cri) throws SQLException;

	int getReplyListCount(String boardNo) throws SQLException;

	void registReply(ReplyVO reply) throws SQLException;

	void modifyReply(ReplyVO reply) throws SQLException;

	void removeReply(String replyNo) throws SQLException;
}
