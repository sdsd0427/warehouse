package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrTypeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.dto.PostPositionVO;
import kr.or.warehouse.dto.VacLogVO;
import kr.or.warehouse.dto.VacProduceVO;
import kr.or.warehouse.dto.VacationVO;

public interface HrDAO {

	//근태 리스트
	List<HrVO> selectHrList(int eno) throws Exception;

	//근무유형
	HrTypeVO selectHrType(int eno) throws Exception;

	//근태(하루)
	HrVO selectHrByDate(Map<String, Object> paramMap) throws Exception;

	//근태
	HrVO selectHrByEno(Map<String, Object> paramMap) throws Exception;

	//근무상태 변경
	void updateCondition(EmployeeVO employee) throws Exception;

	//근무상태 확인
	EmployeeVO selectEmp(int eno) throws Exception;

	//직위명
	PostPositionVO selectPpsByPpscode(String ppsCode) throws Exception;

	//근태 적용
	void insertHr(HrVO hr) throws Exception;

	//hrcode 생성을 위해 코드 가져오기
	List<String> selectHrcodeByHrDate(String hrDate) throws Exception;

	// 직급 기본급 찾기
	List<PostPositionVO> selectPostPosition() throws Exception;

	//
	List<EmployeeVO> selectEmpForHrData(String day) throws Exception;

	// 연차 내역 조회
	VacationVO selectVacation(int eno) throws SQLException;

	List<Map<String, Date>> selectVacationPeriod(int eno) throws SQLException;

	List<VacLogVO> selectVacationUsageHistory(Map<String, Object>vacMap) throws SQLException;

	List<VacProduceVO> selectVacationProduceHistory(Map<String, Object>vacMap) throws SQLException;

	//부서인자정보
	List<EmployeeVO> selectTeamHrList(Map<String, Object> paramMap,RowBounds rowBounds) throws Exception;
	int selectTeamHrListCount(Map<String, Object> paramMap) throws Exception;
	int selectTeamHrListAllCount(int dno) throws Exception;

	//부서 인사정보 수정
	void updateHr(EmployeeVO employee) throws Exception;

	Map<String, Object> selectWeekCalc(HrVO hr) throws Exception;

	int selectWeekTardy(HrVO hr) throws Exception;
	int selectWeekReqChange(HrVO hr) throws Exception;

	List<HrVO> selectWeekTableByWeekStart(Map<String, Object> paramMap) throws Exception;

	void updateHrType(HrTypeVO hrType) throws Exception;

	void updateIp(HrTypeVO hrType) throws Exception;


	//부서 근태조회
	List<EmployeeVO> selectEmpByDno(Map<String, Object> paramMap, RowBounds rowBounds) throws Exception;
	int selectTeamEmpCount(Map<String, Object> paramMap) throws Exception;
	Map<String, String> selectWeekStEd(String date) throws Exception;

	Map<String, String> selectWeekFullDate(String date) throws Exception;

	int selectAllCountByDno(int dno) throws Exception;

	//
	List<EmployeeVO> selectTeamVacList(Map<String, Object> paramMap, RowBounds rowBounds)throws Exception;

	//
	HrVO selectHrTime(String hrcode) throws Exception;
}
