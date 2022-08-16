package kr.or.warehouse.dto;

import java.util.Date;

public class JoinCommuVO {
	private int eno;
	private String name;
	private String photo;
	private String call;
	private String dname;
	private int authority;
	private Date jdate;
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
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public String getCmno() {
		return cmno;
	}
	public void setCmno(String cmno) {
		this.cmno = cmno;
	}
	
	
}
