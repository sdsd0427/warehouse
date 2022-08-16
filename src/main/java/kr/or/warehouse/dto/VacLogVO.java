package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class VacLogVO {

	private Date vacStart; // 시작일
	private Date vacEnd; // 종료일
	private int vacDay; // 사용일수
	private String vacContent; // 비고
	private int eno;
	private int remDay;

	public Date getVacStart() {
		return vacStart;
	}

	public void setVacStart(Date vacStart) {
		this.vacStart = vacStart;
	}

	public Date getVacEnd() {
		return vacEnd;
	}

	public void setVacEnd(Date vacEnd) {
		this.vacEnd = vacEnd;
	}

	public int getVacDay() {
		return vacDay;
	}

	public void setVacDay(int vacDay) {
		this.vacDay = vacDay;
	}

	public String getVacContent() {
		return vacContent;
	}

	public void setVacContent(String vacContent) {
		this.vacContent = vacContent;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public int getRemDay() {
		return remDay;
	}

	public void setRemDay(int remDay) {
		this.remDay = remDay;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
