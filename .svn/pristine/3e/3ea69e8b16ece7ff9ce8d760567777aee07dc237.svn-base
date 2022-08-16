package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class QnaReplyVO {

	private int qrno;
	private int qnano;
	private String content;
	private int eno;
	private Date regDate;
	private EmployeeVO writer;

	public EmployeeVO getWriter() {
		return writer;
	}
	public void setWriter(EmployeeVO writer) {
		this.writer = writer;
	}
	public int getQrno() {
		return qrno;
	}
	public void setQrno(int qrno) {
		this.qrno = qrno;
	}
	public int getQnano() {
		return qnano;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE
				);
	}


}
