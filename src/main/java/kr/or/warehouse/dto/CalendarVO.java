package kr.or.warehouse.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CalendarVO {

	private String ccode;
	private int catecode;
	private String title;
	private String content;
	private String space;
	private String important = "";
	private String start;
	private String end;
	private Date sdate;
	private Date edate;
	private int eno;
	private boolean allday;
	private String catedetail;
	private String color = "";

	private List<CalRefVO> calRefList;
	private CalAlarmVO calAlarm;

	public String getImportant() {
		return important;
	}
	
	public void setImportant(String important) {
		this.important = important;
	}
	
	public String getColor() {
		return color;
	}

	public CalAlarmVO getCalAlarm() {
		return calAlarm;
	}

	public void setCalAlarm(CalAlarmVO calAlarm) {
		this.calAlarm = calAlarm;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getCatedetail() {
		return catedetail;
	}

	public void setCatedetail(String catedetail) {
		this.catedetail = catedetail;
	}

	public List<CalRefVO> getCalRefList() {
		return calRefList;
	}

	public void setCalRefList(List<CalRefVO> calRefList) {
		this.calRefList = calRefList;
	}


	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public int getCatecode() {
		return catecode;
	}

	public void setCatecode(int catecode) {
		this.catecode = catecode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSpace() {
		return space;
	}

	public void setSpace(String space) {
		this.space = space;
	}


	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public boolean isAllday() {
		return allday;
	}

	public void setAllday(boolean allday) {
		this.allday = allday;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		System.out.println(sdate);
		try {
			this.sdate = sdf.parse(sdate);
			System.out.println(this.sdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		System.out.println(edate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		try {
			this.edate = sdf.parse(edate);
			System.out.println(this.edate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
