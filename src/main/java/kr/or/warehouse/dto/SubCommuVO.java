package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SubCommuVO {
	
	   private int eno;
	   private String name;
	   private String photo;
	   private String call;
	   private String dname;
	   private Date regDate;
	   private String cmno;
	   private String ppsName;
	   private String cname;
	   
	   
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPpsName() {
		return ppsName;
	}
	public void setPpsName(String ppsName) {
		this.ppsName = ppsName;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getCmno() {
		return cmno;
	}
	public void setCmno(String cmno) {
		this.cmno = cmno;
	}
	   
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}   
}
