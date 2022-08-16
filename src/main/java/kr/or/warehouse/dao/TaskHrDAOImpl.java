package kr.or.warehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrTypeVO;
import kr.or.warehouse.dto.HrVO;

public class TaskHrDAOImpl extends HrDAOImpl implements HrDAO{

	private static final Logger LOGGER = LoggerFactory.getLogger(TaskHrDAOImpl.class);
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<HrVO> selectHrList(int eno) throws Exception {
		return session.selectList("Hr-Mapper.selectHrList", eno);
	}

	@Override
	public void insertHr(HrVO hr) throws Exception {
		session.update("Hr-Mapper.insertHr", hr);
	}

	@Override
	public List<String> selectHrcodeByHrDate(String hrDate) throws Exception {
		return session.selectList("Hr-Mapper.selectHrcodeByHrDate", hrDate);
	}
	@Override
	public HrTypeVO selectHrType(int eno) throws Exception {
		return session.selectOne("Hr-Mapper.selectHrType", eno);
	}
	@Override
	public List<EmployeeVO> selectEmpForHrData(String day) throws Exception {
		return session.selectList("Hr-Mapper.selectEmpForHrData", day);
	}
	@Override
	public HrVO selectHrByEno(Map<String, Object> paramMap) throws Exception {
		return session.selectOne("Hr-Mapper.selectHrByEno", paramMap);
	}
}
