package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.WorkReplyVO;

@Repository
public class WorkReplyDAOImpl implements WorkReplyDAO{

	@Autowired
	private SqlSession session;

	@Override
	public List<WorkReplyVO> selectReplyList(String wcode, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("WorkReply-Mapper.selectReplyList", wcode, rowBounds);
	}

	@Override
	public EmployeeVO selectReplyWriterByEno(int eno) throws SQLException {
		return session.selectOne("WorkReply-Mapper.selectReplyWriterByEno", eno);
	}

	@Override
	public int selectReplyTotalCount(String wcode) throws SQLException {
		return session.selectOne("WorkReply-Mapper.selectReplyTotalCount", wcode);
	}

	@Override
	public String selectMaxReplyNo() throws SQLException {
		return session.selectOne("WorkReply-Mapper.selectMaxReplyNo");
	}

	@Override
	public void insertWorkReply(WorkReplyVO reply) throws SQLException {
		session.insert("WorkReply-Mapper.insertWorkReply", reply);
	}

	@Override
	public void deleteWorkReply(String wrno) throws SQLException {
		session.delete("WorkReply-Mapper.deleteWorkReply", wrno);
	}


}
