package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.WorkVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<WorkVO> selectWaitMyWork(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectWaitMyWork", eno);
	}

	@Override
	public List<WorkVO> selectCooperReqToMeList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectCooperReqToMeList", eno);
	}

	@Override
	public List<WorkVO> selectProxyReqToMeList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectProxyReqToMeList", eno);
	}

	@Override
	public List<WorkVO> selectToReqCooperReqList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectToReqCooperReqList", eno);
	}

	@Override
	public List<WorkVO> selectToReqProxyReqList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectToReqProxyReqList", eno);
	}

	@Override
	public List<WorkVO> selectToReqObjectionList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectToReqObjectionList", eno);
	}

	@Override
	public List<WorkVO> selectMentoWorkList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectMentoWorkList", eno);
	}

	@Override
	public List<WorkVO> selectMenteeWorkList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectMenteeWorkList", eno);
	}

	@Override
	public List<SignDocVO> selectMentoDraftDocList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectMentoDraftDocList", eno);
	}

	@Override
	public List<SignDocVO> selectMenteeDraftDocList(int eno) throws SQLException {
		return session.selectList("Home-Mapper.selectMenteeDraftDocList", eno);
	}


}
