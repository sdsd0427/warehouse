package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CalAlarmVO {

	private String ccode;
	private int calarmtime;
	private int calarmmethod;

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public int getCalarmtime() {
		return calarmtime;
	}

	public void setCalarmtime(int calarmtime) {
		this.calarmtime = calarmtime;
	}

	public int getCalarmmethod() {
		return calarmmethod;
	}

	public void setCalarmmethod(int calarmmethod) {
		this.calarmmethod = calarmmethod;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
