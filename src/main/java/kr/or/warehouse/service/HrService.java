package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrTypeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.dto.PostPositionVO;
import kr.or.warehouse.dto.VacLogVO;
import kr.or.warehouse.dto.VacProduceVO;
import kr.or.warehouse.dto.VacationVO;

public interface HrService {

	//근태 리스트
	/**
	 * @param eno
	 * @return
	 * @throws Exception
	 */
	List<HrVO> getHrList(int eno) throws Exception;


	//근무유형
	/**
	 * @param eno
	 * @return
	 * @throws Exception
	 */
	HrTypeVO getHrType(int eno) throws Exception;

	//근무상태 변경
	/**
	 * @param employee
	 * @throws Exception
	 */
	void changeCondition(EmployeeVO employee) throws Exception;

	//근무상태 확인
	/**
	 * @param eno
	 * @return
	 * @throws Exception
	 */
	EmployeeVO getEmp(int eno) throws Exception;

	//출근시간 기록
	/**
	 * @param hr
	 * @param ip
	 * @return
	 * @throws Exception
	 */
	String goToWorklogFile(HrVO hr, String ip) throws Exception;

	/**
	 * 출근시간 가져오기
	 * @param eno
	 * @return
	 * @throws Exception
	 */
	String getOnTime(int eno) throws Exception;

	String leaveWorklogFile(HrVO hr, String ip) throws Exception;

	String getOffTime(int eno) throws Exception;

	//근태적용
	void write(Map<String, HrVO> logMap) throws Exception;

	List<PostPositionVO> getPostPositionList() throws Exception;

	List<EmployeeVO> getEmpForHrData(String day) throws Exception;

	void writeAbsent(HrVO hr) throws Exception;

	VacationVO getVacation(int eno) throws SQLException;

	List<Map<String, Date>> selectVacationPeriod(int eno) throws SQLException;

	List<VacLogVO> VacationUsageHistory(int eno, String vyear) throws SQLException;

	List<VacProduceVO> VacationProduceHistory(int eno, String vyear) throws SQLException;

	//부서 인사정보
	Map<String,Object> getSelectTeamHrList(Criteria cri, int dno, String condition)throws Exception;
	int selectTeamHrListCount(int dno, String condition) throws Exception;
	int selectTeamHrListAllCount(int dno) throws Exception;

	//부서인사정보 수정
	void modifyHr(EmployeeVO employee) throws Exception;

	//수정 후 근태

	List<Map<String, Object>> getWeekCalc(HrVO hr) throws Exception;
	List<HrVO> getWeekTable(int eno, String weekStart) throws Exception;

	void modifyHrType(HrTypeVO hrType) throws Exception;

	Map<String, Object> getTeamList(Criteria cri, int dno, String weekStart) throws Exception;

	Map<String, String> getWeekDate(String date) throws Exception;

	//
	Map<String, Object> getTeamVacList(Criteria cri, int dno) throws Exception;

	//
	HrVO getHrTime(String hrcode) throws Exception;
}
