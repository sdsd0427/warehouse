package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SignFormVO {

	private String sFormNo; // 결재양식번호
	private String formClass; // 양식구분
	private String formText; // 양식텍스트
	
	public String getsFormNo() {
		return sFormNo;
	}
	public void setsFormNo(String sFormNo) {
		this.sFormNo = sFormNo;
	}
	public String getFormClass() {
		return formClass;
	}
	public void setFormClass(String formClass) {
		this.formClass = formClass;
	}
	public String getFormText() {
		return formText;
	}
	public void setFormText(String formText) {
		this.formText = formText;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
