package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrTypeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.dto.PostPositionVO;
import kr.or.warehouse.dto.VacLogVO;
import kr.or.warehouse.dto.VacProduceVO;
import kr.or.warehouse.dto.VacationVO;
import kr.or.warehouse.service.HrServiceImpl;

@Repository("hrDAO")
public class HrDAOImpl implements HrDAO {

	private static final Logger LOGGER = LoggerFactory.getLogger(HrDAOImpl.class);

	@Autowired
	private SqlSession session;

	@Override
	public List<HrVO> selectHrList(int eno) throws Exception {
		return session.selectList("Hr-Mapper.selectHrList", eno);
	}

	@Override
	public HrTypeVO selectHrType(int eno) throws Exception {
		return session.selectOne("Hr-Mapper.selectHrType", eno);
	}

	@Override
	public HrVO selectHrByDate(Map<String, Object> paramMap) throws Exception {
		return session.selectOne("Hr-Mapper.selectHrByDate", paramMap);
	}

	@Override
	public void updateCondition(EmployeeVO employee) throws Exception {
		session.update("Hr-Mapper.updateCondition", employee);
	}

	@Override
	public EmployeeVO selectEmp(int eno) throws Exception {
		return session.selectOne("Employee-Mapper.selectEmployeeByEno", eno);
	}

	@Override
	public PostPositionVO selectPpsByPpscode(String ppsCode) throws Exception {
		return session.selectOne("Employee-Mapper.selectPpsByPpscode", ppsCode);
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
	public HrVO selectHrByEno(Map<String, Object> paramMap) throws Exception {
		return session.selectOne("Hr-Mapper.selectHrByEno", paramMap);
	}

	@Override
	public List<PostPositionVO> selectPostPosition() throws Exception {
		return session.selectList("Hr-Mapper.selectPostPosition");
	}

	@Override
	public List<EmployeeVO> selectEmpForHrData(String day) throws Exception {
		return session.selectList("Hr-Mapper.selectEmpForHrData", day);
	}

	@Override
	public VacationVO selectVacation(int eno) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVacation", eno);
	}

	@Override
	public List<Map<String, Date>> selectVacationPeriod(int eno) throws SQLException {
		return session.selectList("Vacation-Mapper.selectVacationPeriod", eno);
	}

	@Override
	public List<VacLogVO> selectVacationUsageHistory(Map<String, Object> vacMap) throws SQLException {
		return session.selectList("Vacation-Mapper.selectVacationUsageHistory", vacMap);
	}

	@Override
	public List<VacProduceVO> selectVacationProduceHistory(Map<String, Object> vacMap) throws SQLException {
		return session.selectList("Vacation-Mapper.selectVacationProduceHistory", vacMap);
	}

	@Override
	public List<EmployeeVO> selectTeamHrList(Map<String, Object> paramMap,RowBounds rowBounds) throws Exception {

		return session.selectList("Hr-Mapper.selectTeamHrList", paramMap, rowBounds);
	}

	@Override
	public int selectTeamHrListCount(Map<String, Object> paramMap) throws Exception {
		return session.selectOne("Hr-Mapper.selectTeamHrListCount", paramMap);
	}

	@Override
	public int selectTeamHrListAllCount(int dno) throws Exception {
		return session.selectOne("Hr-Mapper.selectTeamHrListAllCount",dno);
	}

	@Override
	public void updateHr(EmployeeVO employee) throws SQLException {
		session.update("Hr-Mapper.updateHr",employee);
	}

	@Override
	public Map<String, Object> selectWeekCalc(HrVO hr) throws Exception {
		Map<String, Object> resultMap = session.selectOne("Hr-Mapper.selectWeekCalc", hr);
		System.out.println(resultMap);
		return resultMap;
	}

	@Override
	public int selectWeekTardy(HrVO hr) throws Exception {
		return session.selectOne("Hr-Mapper.selectWeekTardy", hr);
	}

	@Override
	public int selectWeekReqChange(HrVO hr) throws Exception {
		return session.selectOne("Hr-Mapper.selectWeekReqChange", hr);
	}

	@Override
	public List<HrVO> selectWeekTableByWeekStart(Map<String, Object> paramMap) throws Exception {
		return session.selectList("Hr-Mapper.selectWeekTableByWeekStart", paramMap);
	}

	@Override
	public void updateHrType(HrTypeVO hrType) throws Exception {
		session.selectList("Hr-Mapper.updateHrType", hrType);
	}

	@Override
	public void updateIp(HrTypeVO hrType) throws Exception {
		session.selectList("Hr-Mapper.updateIp", hrType);
	}

	@Override
	public List<EmployeeVO> selectEmpByDno(Map<String, Object> paramMap,RowBounds rowBounds) throws Exception {
		return session.selectList("Hr-Mapper.selectTeamEmpByDno", paramMap, rowBounds);
	}

	@Override
	public int selectTeamEmpCount(Map<String, Object> paramMap) throws Exception {
		return session.selectOne("Hr-Mapper.selectTeamEmpCount", paramMap);
	}

	@Override
	public Map<String, String> selectWeekStEd(String weekStart) throws Exception {
		return session.selectOne("Hr-Mapper.selectWeekStEd", weekStart);
	}

	@Override
	public Map<String, String> selectWeekFullDate(String date) throws Exception {
		return session.selectOne("Hr-Mapper.selectWeekFullDate", date);
	}

	@Override
	public int selectAllCountByDno(int dno) throws Exception {
		return session.selectOne("Hr-Mapper.selectAllCountByDno", dno);
	}

	@Override
	public List<EmployeeVO> selectTeamVacList(Map<String, Object> paramMap,RowBounds rowBounds) throws Exception {
		return session.selectList("Hr-Mapper.selectTeamVacList", paramMap, rowBounds);
	}

	@Override
	public HrVO selectHrTime(String hrcode) throws Exception {
		return session.selectOne("Hr-Mapper.selectHrTime", hrcode);
	}



}
