package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.CalAlarmVO;
import kr.or.warehouse.dto.CalRefVO;
import kr.or.warehouse.dto.CalendarVO;
import kr.or.warehouse.dto.EmployeeVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<CalendarVO> selectSearchCalendarList(Map<String, Object> paramMap) throws SQLException {
		return session.selectList("Calendar-Mapper.selectSearchCalendarList", paramMap);
	}

	@Override
	public CalendarVO selectCalendarByCcode(String ccode) throws SQLException {
		return session.selectOne("Calendar-Mapper.selectCalendarByCcode", ccode);
	}

	@Override
	public List<CalRefVO> selectCalRefByCcode(String ccode) throws SQLException {
		return session.selectList("Calendar-Mapper.selectCalRefByCcode", ccode);
	}

	@Override
	public CalAlarmVO selectCalAlarmByCcode(String ccode) throws SQLException {
		return session.selectOne("Calendar-Mapper.selectCalAlarmByCcode", ccode);
	}

	@Override
	public void insertCalendar(CalendarVO calendar) throws SQLException {
		session.update("Calendar-Mapper.insertCalendar", calendar);
	}

	@Override
	public void insertCalRef(CalRefVO calref) throws SQLException {
		session.update("Calendar-Mapper.insertCalRef", calref);
	}

	@Override
	public void insertCalAlarm(CalAlarmVO calalarm) throws SQLException {
		session.update("Calendar-Mapper.insertCalAlarm", calalarm);
	}

	@Override
	public void updateCalendar(CalendarVO calendar) throws SQLException {
		session.update("Calendar-Mapper.updateCalendar", calendar);
	}

	@Override
	public void deleteCalendar(String ccode) throws SQLException {
		session.delete("Calendar-Mapper.deleteCalendar", ccode);
	}

	@Override
	public void deleteCalRef(String ccode) throws SQLException {
		session.delete("Calendar-Mapper.deleteCalRef", ccode);
	}

	@Override
	public int selectCalendarSeqNext() throws SQLException {
		return session.selectOne("Calendar-Mapper.selectCalendarSeqNext");
	}

	@Override
	public List<EmployeeVO> selectEnoByCcode(String ccode) throws SQLException {
		return session.selectList("Calendar-Mapper.selectEnoByCcode", ccode);
	}

	@Override
	public String selectCcode() throws SQLException {
		return session.selectOne("Calendar-Mapper.selectCcode");
	}

	@Override
	public void updateCalAlarm(CalAlarmVO calalarm) throws SQLException {
		session.update("Calendar-Mapper.updateCalAlarm", calalarm);
	}

	@Override
	public List<Integer> selectEnoSameMyDno(int eno) throws SQLException {
		return session.selectList("Calendar-Mapper.selectEnoSameMyDno", eno);
	}

	@Override
	public List<Integer> selectAllEmployee() throws SQLException {
		return session.selectList("Calendar-Mapper.selectAllEmployee");
	}

}
