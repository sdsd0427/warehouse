package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CommupostVO {
	
	private String cpostNo;
	private String cboardNo;
	private String title;
	private int eno;
	private String content;
	private Date regDate;
	private int viewCnt;
	private Date updateDate;
	private String name;
	private String cbName;
	private int replyOpen;
	
	
	public int getReplyOpen() {
		return replyOpen;
	}
	public void setReplyOpen(int replyOpen) {
		this.replyOpen = replyOpen;
	}
	public String getCpostNo() {
		return cpostNo;
	}
	public void setCpostNo(String cpostNo) {
		this.cpostNo = cpostNo;
	}
	public String getCboardNo() {
		return cboardNo;
	}
	public void setCboardNo(String cboardNo) {
		this.cboardNo = cboardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCbName() {
		return cbName;
	}
	public void setCbName(String cbName) {
		this.cbName = cbName;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
}
