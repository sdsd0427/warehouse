package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.WorkVO;

public interface HomeService {

	//요청받은업무
	public List<WorkVO> waitMyWork(int eno) throws SQLException;
	public List<WorkVO> cooperReqWork(int eno) throws SQLException;
	public List<WorkVO> proxyReqWork(int eno) throws SQLException;
	//요청한 업무
	public List<WorkVO> toReqCooperReqList(int eno) throws SQLException;
	public List<WorkVO> toReqProxyReqList(int eno) throws SQLException;
	public List<WorkVO> toReqObjectionList(int eno) throws SQLException;
	//멘토
	public List<WorkVO> getMentoWorkList(int eno) throws SQLException;
	public List<SignDocVO> getMentoDraftDocList(int eno) throws SQLException;
	//멘티
	public List<WorkVO> getMenteeWorkList(int eno) throws SQLException;
	public List<SignDocVO> getMenteeDraftDocList(int eno) throws SQLException;
}
