package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.WorkVO;

public interface HomeDAO {

	//요청받은업무
	public List<WorkVO> selectWaitMyWork(int eno) throws SQLException;
	public List<WorkVO> selectCooperReqToMeList(int eno) throws SQLException;
	public List<WorkVO> selectProxyReqToMeList(int eno) throws SQLException;

	//요청한 업무
	public List<WorkVO> selectToReqCooperReqList(int eno) throws SQLException;
	public List<WorkVO> selectToReqProxyReqList(int eno) throws SQLException;
	public List<WorkVO>selectToReqObjectionList(int eno) throws SQLException;

	//멘토
	public List<WorkVO> selectMentoWorkList(int eno) throws SQLException;
	public List<SignDocVO> selectMentoDraftDocList(int eno) throws SQLException;

	//멘티
	public List<WorkVO> selectMenteeWorkList(int eno) throws SQLException;
	public List<SignDocVO> selectMenteeDraftDocList(int eno) throws SQLException;
}
