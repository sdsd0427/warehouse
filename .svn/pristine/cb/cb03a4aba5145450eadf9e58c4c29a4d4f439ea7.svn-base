package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ProceedingVO;

@Repository
public class ProceedingDAOImpl implements ProceedingDAO{

	@Autowired
	private SqlSession session;

	@Override
	public void insertProceed(ProceedingVO proceed) throws SQLException {
		session.insert("Proceed-Mapper.insertProceed", proceed);
	}

	@Override
	public List<ProceedingVO> selectProceedList(String wcode, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Proceed-Mapper.selectProceedList", wcode, rowBounds);
	}

	@Override
	public int selectProceedTotalCount(String wcode) throws SQLException {
		return session.selectOne("Proceed-Mapper.selectProceedTotalCount", wcode);
	}

	@Override
	public ProceedingVO selectProceedByProNo(int prono) throws SQLException {
		return session.selectOne("Proceed-Mapper.selectProceedByProNo", prono);
	}

	@Override
	public void deleteProceedFile(int prono) throws SQLException {
		session.update("Proceed-Mapper.deleteProceedFile", prono);
	}

	@Override
	public void updateProceed(ProceedingVO proceed) throws SQLException {
		session.update("Proceed-Mapper.updateProceed", proceed);
	}

	@Override
	public void deleteProceed(int prono) throws SQLException {
		session.delete("Proceed-Mapper.deleteProceed", prono);
	}

}
