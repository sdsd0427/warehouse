package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ProceedingVO;

public interface ProceedingDAO {

	public void insertProceed(ProceedingVO proceed) throws SQLException;
	public List<ProceedingVO> selectProceedList(String wcode, Criteria cri) throws SQLException;
	public int selectProceedTotalCount(String wcode) throws SQLException;
	public ProceedingVO selectProceedByProNo(int prono) throws SQLException;
	public void deleteProceedFile(int prono) throws SQLException;
	public void updateProceed(ProceedingVO proceed) throws SQLException;
	public void deleteProceed(int prono) throws SQLException;
}
