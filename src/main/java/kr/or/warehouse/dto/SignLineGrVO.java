package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SignLineGrVO {

	private String signGroupNo;
	private String signGroupName;
	private int  eno;
	
	
	public String getSignGroupNo() {
		return signGroupNo;
	}
	public void setSignGroupNo(String signGroupNo) {
		this.signGroupNo = signGroupNo;
	}
	public String getSignGroupName() {
		return signGroupName;
	}
	public void setSignGroupName(String signGroupName) {
		this.signGroupName = signGroupName;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
}
