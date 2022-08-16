package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class WorkReplyVO {

	private String wrno      ;
	private String wrContent ;
	private Date wrRegdate ;
	private Date updateDate;
	private String wcode     ;
	private int eno       ;
	private String wrRno     ;
	private EmployeeVO writer;


	public EmployeeVO getWriter() {
		return writer;
	}


	public void setWriter(EmployeeVO writer) {
		this.writer = writer;
	}


	public String getWrno() {
		return wrno;
	}


	public void setWrno(String wrno) {
		this.wrno = wrno;
	}


	public String getWrContent() {
		return wrContent;
	}


	public void setWrContent(String wrContent) {
		this.wrContent = wrContent;
	}


	public Date getWrRegdate() {
		return wrRegdate;
	}


	public void setWrRegdate(Date wrRegdate) {
		this.wrRegdate = wrRegdate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public String getWcode() {
		return wcode;
	}


	public void setWcode(String wcode) {
		this.wcode = wcode;
	}


	public int getEno() {
		return eno;
	}


	public void setEno(int eno) {
		this.eno = eno;
	}


	public String getWrRno() {
		return wrRno;
	}


	public void setWrRno(String wrRno) {
		this.wrRno = wrRno;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
