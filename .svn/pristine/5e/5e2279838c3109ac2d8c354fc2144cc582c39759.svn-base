package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReplyVO;

public interface ManualReplyService {

	// 리스트보기
	Map<String, Object> getReplyList(String refNo, Criteria cri) throws SQLException;

	// 리스트 개수
	int getReplyListCount(String refNo) throws SQLException;

	// 등록
	void registReply(ReplyVO reply) throws SQLException;

	// 수정
	void modifyReply(ReplyVO reply) throws SQLException;

	// 삭제
	void removeReply(String rno) throws SQLException;

}
