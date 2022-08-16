package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ReportVO;

public interface ReportDAO {

	public void insertReport(ReportVO report) throws SQLException;
	public List<ReportVO> selectReportList(String wcode, Criteria cri) throws SQLException;
	public int selectReportTotalCount(String wcode) throws SQLException;
	public ReportVO selectReportByRepNo(int repno) throws SQLException;
	public void deleteReportFile(int repno) throws SQLException;
	public void updateReport(ReportVO report) throws SQLException;
	public void deleteReport(int repno) throws SQLException;
}
