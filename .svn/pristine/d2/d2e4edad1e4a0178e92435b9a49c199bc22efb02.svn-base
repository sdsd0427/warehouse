package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.dto.CalAlarmVO;
import kr.or.warehouse.dto.CalRefVO;
import kr.or.warehouse.dto.CalendarVO;
import kr.or.warehouse.dto.EmployeeVO;

public interface CalendarDAO {
	
	List<CalendarVO> selectSearchCalendarList(Map<String, Object> paramMap) throws SQLException;

	CalendarVO selectCalendarByCcode(String ccode) throws SQLException;

	List<CalRefVO> selectCalRefByCcode(String ccode) throws SQLException;

	CalAlarmVO selectCalAlarmByCcode(String ccode) throws SQLException;

	void insertCalendar(CalendarVO calendar) throws SQLException;

	void insertCalRef(CalRefVO calref) throws SQLException;

	void insertCalAlarm(CalAlarmVO calalarm) throws SQLException;

	void updateCalendar(CalendarVO calendar) throws SQLException;

	void updateCalAlarm(CalAlarmVO calalarm) throws SQLException;

	void deleteCalendar(String ccode) throws SQLException;

	void deleteCalRef(String ccode) throws SQLException;

	List<EmployeeVO> selectEnoByCcode(String ccode) throws SQLException;

	String selectCcode() throws SQLException;

	int selectCalendarSeqNext() throws SQLException;
	
	List<Integer> selectEnoSameMyDno(int eno) throws SQLException;
	
	List<Integer> selectAllEmployee() throws SQLException;

}
