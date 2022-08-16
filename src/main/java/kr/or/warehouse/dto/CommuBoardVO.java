package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CommuBoardVO {
	
	private String cboardNo;
	private String cmno;
	private String cbName;
	private String cbIntro;
	private int replyOpen;
	private int writeOpen;
	
	
	public int getWriteOpen() {
		return writeOpen;
	}
	public void setWriteOpen(int writeOpen) {
		this.writeOpen = writeOpen;
	}
	public int getReplyOpen() {
		return replyOpen;
	}
	public void setReplyOpen(int replyOpen) {
		this.replyOpen = replyOpen;
	}
	public String getCboardNo() {
		return cboardNo;
	}
	public void setCboardNo(String cboardNo) {
		this.cboardNo = cboardNo;
	}
	public String getCmno() {
		return cmno;
	}
	public void setCmno(String cmno) {
		this.cmno = cmno;
	}
	public String getCbName() {
		return cbName;
	}
	public void setCbName(String cbName) {
		this.cbName = cbName;
	}
	public String getCbIntro() {
		return cbIntro;
	}
	public void setCbIntro(String cbIntro) {
		this.cbIntro = cbIntro;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
	
}
