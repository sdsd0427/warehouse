package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PostPositionVO {
	private String ppsCode;
	private String ppsName;
	private String ppsPay;
	
	public String getPpsCode() {
		return ppsCode;
	}
	public void setPpsCode(String ppsCode) {
		this.ppsCode = ppsCode;
	}
	public String getPpsName() {
		return ppsName;
	}
	public void setPpsName(String ppsName) {
		this.ppsName = ppsName;
	}
	public String getPpsPay() {
		return ppsPay;
	}
	public void setPpsPay(String ppsPay) {
		this.ppsPay = ppsPay;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
