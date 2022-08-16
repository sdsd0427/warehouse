package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dao.CalendarDAO;
import kr.or.warehouse.dto.CalAlarmVO;
import kr.or.warehouse.dto.CalRefVO;
import kr.or.warehouse.dto.CalendarVO;
import kr.or.warehouse.dto.EmployeeVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDAO calendarDAO;

	@Override
	public List<CalendarVO> getCalendarList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("eno", eno);
		paramMap.put("catecode1", cri.getCatecode1());
		paramMap.put("catecode2", cri.getCatecode2());
		paramMap.put("catecode3", cri.getCatecode3());
		paramMap.put("keyword", cri.getKeyword());
		System.out.println("catecode : " + cri.getCatecode1());

		return calendarDAO.selectSearchCalendarList(paramMap);
	}

	@Override
	public void registCalendar(CalendarVO calendar, List<Integer> calRefEno, CalAlarmVO calalarm) throws SQLException {
		String ccode = calendarDAO.selectCcode();

		calendar.setCcode(ccode);
		calalarm.setCcode(ccode);

		// insert
		calendarDAO.insertCalendar(calendar);
		calendarDAO.insertCalAlarm(calalarm);

		CalRefVO calRef = null;
		if (calRefEno != null)
			for (int rec : calRefEno) {
				calRef = new CalRefVO();
				calRef.setEno(rec);
				calRef.setCcode(ccode);
				calendarDAO.insertCalRef(calRef);
			}
	}

	@Override
	public void modify(CalendarVO calendar, List<Integer> calRefEno) throws SQLException {
		calendarDAO.updateCalendar(calendar);
		calendarDAO.updateCalAlarm(calendar.getCalAlarm());
		calendarDAO.deleteCalRef(calendar.getCcode());

		CalRefVO calRef = null;
		if (calRefEno != null)
			for (int rec : calRefEno) {
				calRef = new CalRefVO();
				calRef.setEno(rec);
				calRef.setCcode(calendar.getCcode());
				calendarDAO.insertCalRef(calRef);
			}
	}

	@Override
	public CalendarVO getCalendarByCcode(String ccode) throws SQLException {
		CalendarVO calendar = calendarDAO.selectCalendarByCcode(ccode);

		CalAlarmVO calAlarm = calendarDAO.selectCalAlarmByCcode(ccode);
		List<CalRefVO> calRefList = calendarDAO.selectCalRefByCcode(ccode);

		calendar.setCalAlarm(calAlarm);
		calendar.setCalRefList(calRefList);
		String start = calendar.getStart();
		String end = calendar.getEnd();

		start = start.replace('-', '/').replace('T', ' ').substring(0, start.lastIndexOf(":"));
		end = end.replace('-', '/').replace('T', ' ').substring(0, end.lastIndexOf(":"));

		calendar.setStart(start);
		calendar.setEnd(end);

		return calendar;
	}

	@Override
	public void remove(String ccode) throws SQLException {
		calendarDAO.deleteCalendar(ccode);
	}

	@Override
	public List<EmployeeVO> selectEnoByCcode(String ccode) throws SQLException {
		return calendarDAO.selectEnoByCcode(ccode);
	}

	@Override
	public List<Integer> getEnoSameMyDno(int eno) throws SQLException {
		return calendarDAO.selectEnoSameMyDno(eno);
	}

	@Override
	public List<Integer> getAllEmployee() throws SQLException {
		return calendarDAO.selectAllEmployee();
	}

}
