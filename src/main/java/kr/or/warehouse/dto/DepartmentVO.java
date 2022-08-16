package kr.or.warehouse.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DepartmentVO {

	private int dno;
	private String dname;
	private int manager;
	private int updno;
	private Date createdate;
	private int enabled;
	private List<EmployeeVO> empList;

	public List<EmployeeVO> getEmpList() {
		return empList;
	}
	public void setEmpList(List<EmployeeVO> empList) {
		this.empList = empList;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public int getUpdno() {
		return updno;
	}
	public void setUpdno(int updno) {
		this.updno = updno;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}







}
