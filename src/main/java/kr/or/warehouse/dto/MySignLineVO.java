package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MySignLineVO {

	private int eno;
	private String signGroupNo;
	private int signRank;
	
	private String name;
	private String dname;
	private String ppsname;
	
	
	
	private String photo;
	
	
	
	
	
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getPpsname() {
		return ppsname;
	}
	public void setPpsname(String ppsname) {
		this.ppsname = ppsname;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getSignGroupNo() {
		return signGroupNo;
	}
	public void setSignGroupNo(String signGroupNo) {
		this.signGroupNo = signGroupNo;
	}
	public int getSignRank() {
		return signRank;
	}
	public void setSignRank(int signRank) {
		this.signRank = signRank;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
