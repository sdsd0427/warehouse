package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CalAlarmVO;
import kr.or.warehouse.dto.CalendarVO;
import kr.or.warehouse.dto.EmployeeVO;

public interface CalendarService {

	List<CalendarVO> getCalendarList(Criteria cri, int eno) throws SQLException;

	CalendarVO getCalendarByCcode(String ccode) throws SQLException;

	void registCalendar(CalendarVO calendar, List<Integer> calRefEno, CalAlarmVO calalarm) throws SQLException;

	void modify(CalendarVO calendar, List<Integer> calRefEno) throws SQLException;

	void remove(String ccode) throws SQLException;

	List<EmployeeVO> selectEnoByCcode(String ccode) throws SQLException;
	
	List<Integer> getEnoSameMyDno(int eno) throws SQLException;
	
	List<Integer> getAllEmployee() throws SQLException;

}
