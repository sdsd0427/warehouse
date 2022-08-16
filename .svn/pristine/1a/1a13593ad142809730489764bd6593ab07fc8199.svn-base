package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReplyVO;

public interface ManualReplyDAO {

	void insertReply( ReplyVO reply) throws SQLException;
	void updateReply( ReplyVO reply) throws SQLException;
	void deleteReply( String rno) throws SQLException;

	String selectRno() throws SQLException;
	String selectName(String rno) throws SQLException;
	String selectPhoto(String rno) throws SQLException;
	List<ReplyVO> selectReplyListPage( String refNo,RowBounds rowBounds) throws SQLException;

	int countReply(String refNo) throws SQLException;
}
