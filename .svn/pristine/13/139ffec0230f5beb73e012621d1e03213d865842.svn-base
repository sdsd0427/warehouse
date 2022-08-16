package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReportVO;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SqlSession session;

	@Override
	public void insertReport(ReportVO report) throws SQLException {
		session.insert("Report-Mapper.insertReport", report);
	}

	@Override
	public List<ReportVO> selectReportList(String wcode, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Report-Mapper.selectReportList", wcode, rowBounds);
	}

	@Override
	public int selectReportTotalCount(String wcode) throws SQLException {
		return session.selectOne("Report-Mapper.selectReportTotalCount", wcode);
	}

	@Override
	public ReportVO selectReportByRepNo(int repno) throws SQLException {
		return session.selectOne("Report-Mapper.selectReportByRepNo", repno);
	}

	@Override
	public void deleteReportFile(int repno) throws SQLException {
		session.delete("Report-Mapper.deleteReportFile", repno);
	}

	@Override
	public void updateReport(ReportVO report) throws SQLException {
		session.update("Report-Mapper.updateReport", report);
	}

	@Override
	public void deleteReport(int repno) throws SQLException {
		session.delete("Report-Mapper.deleteReport", repno);
	}

}
