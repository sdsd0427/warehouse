package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SignerVO {

	private String signLineno;
	private int eno;
	private int signRank;
	private int signState;
	private Date signDate;
	private int signCheck;
	private String signComment;

	private String name;
	private String dname;
	private String ppsName;

	private String photo;
	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getSignComment() {
		return signComment;
	}

	public void setSignComment(String signComment) {
		this.signComment = signComment;
	}

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

	public String getPpsName() {
		return ppsName;
	}

	public void setPpsName(String ppsName) {
		this.ppsName = ppsName;
	}

	public int getSignCheck() {
		return signCheck;
	}

	public void setSignCheck(int signCheck) {
		this.signCheck = signCheck;
	}

	public String getSignLineno() {
		return signLineno;
	}

	public void setSignLineno(String signLineno) {
		this.signLineno = signLineno;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public int getSignRank() {
		return signRank;
	}

	public void setSignRank(int signRank) {
		this.signRank = signRank;
	}

	public int getSignState() {
		return signState;
	}

	public void setSignState(int signState) {
		this.signState = signState;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
