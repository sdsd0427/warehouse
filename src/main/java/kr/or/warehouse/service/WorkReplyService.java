package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.WorkReplyVO;

public interface WorkReplyService {

	public Map<String, Object> getReplyList(String wcode, Criteria cri) throws SQLException;
	public void registReply(WorkReplyVO reply, int eno) throws SQLException;
	void deleteWorkReply(String wrno) throws SQLException;
}
