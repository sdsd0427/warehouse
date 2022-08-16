package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.WorkReplyVO;

public interface WorkReplyDAO {

	public List<WorkReplyVO> selectReplyList(String wcode, Criteria cri) throws SQLException;
	public int selectReplyTotalCount(String wcode) throws SQLException;
	public String selectMaxReplyNo()throws SQLException;
	public void insertWorkReply(WorkReplyVO reply) throws SQLException;
	public EmployeeVO selectReplyWriterByEno(int eno) throws SQLException;
	void deleteWorkReply(String wrno) throws SQLException;
}
