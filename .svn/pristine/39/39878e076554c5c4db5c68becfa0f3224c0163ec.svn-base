package kr.or.warehouse.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class HrVO implements Serializable {
	private String hrcode;
	private int eno;
	private int state;
	private int hrTime;
	private int overTime;
	private int stdTime;
	private Date onTime;
	private Date offTime;
	private String onTimeStr;
	private String offTimeStr;
	private String hrDate;
	private int reqChange;

	private String weekDate;


	public String getHrcode() {
		return hrcode;
	}

	public void setHrcode(String hrcode) {
		this.hrcode = hrcode;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getHrTime() {
		return hrTime;
	}

	public void setHrTime(int hrTime) {
		this.hrTime = hrTime;
	}

	public int getOverTime() {
		return overTime;
	}

	public void setOverTime(int overTime) {
		this.overTime = overTime;
	}

	public int getStdTime() {
		return stdTime;
	}

	public void setStdTime(int stdTime) {
		this.stdTime = stdTime;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOnTime() {
		return onTime;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setOnTime(Date onTime) {
		this.onTime = onTime;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOffTime() {
		return offTime;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setOffTime(Date offTime) {
		this.offTime = offTime;
	}

	public String getOnTimeStr() {
		return onTimeStr;
	}

	public void setOnTimeStr(String onTimeStr) {
		this.onTimeStr = onTimeStr;
	}

	public String getOffTimeStr() {
		return offTimeStr;
	}

	public void setOffTimeStr(String offTimeStr) {
		this.offTimeStr = offTimeStr;
	}

	public String getHrDate() {
		return hrDate;
	}

	public void setHrDate(String hrDate) {
		this.hrDate = hrDate;
	}

	public int getReqChange() {
		return reqChange;
	}

	public void setReqChange(int reqChange) {
		this.reqChange = reqChange;
	}

	public String getWeekDate() {
		return weekDate;
	}

	public void setWeekDate(String weekDate) {
		this.weekDate = weekDate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
