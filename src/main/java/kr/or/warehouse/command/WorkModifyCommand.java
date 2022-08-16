package kr.or.warehouse.command;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import kr.or.warehouse.dto.EmployeeVO;

public class WorkModifyCommand {

	private String wcode;
	private String wcontent;
	private String wprogress;
	private String hashTag;
	private String wend;
	private int wmstep;
	private List<String> newWorkManagerList;
	private List<String> removeWorkManagerList;

	public int getWmstep() {
		return wmstep;
	}
	public void setWmstep(int wmstep) {
		this.wmstep = wmstep;
	}
	public void setRemoveWorkManagerList(List<String> removeWorkManagerList) {
		this.removeWorkManagerList = removeWorkManagerList;
	}
	public String getWcode() {
		return wcode;
	}
	public void setWcode(String wcode) {
		this.wcode = wcode;
	}
	public String getWcontent() {
		return wcontent;
	}
	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}
	public String getWprogress() {
		return wprogress;
	}
	public void setWprogress(String wprogress) {
		this.wprogress = wprogress;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public String getWend() {
		return wend;
	}
	public void setWend(String wend) {
		this.wend = wend;
	}
	public List<String> getNewWorkManagerList() {
		return newWorkManagerList;
	}
	public void setNewWorkManagerList(List<String> newWorkManagerList) {
		this.newWorkManagerList = newWorkManagerList;
	}
	public List<String> getRemoveWorkManagerList() {
		return removeWorkManagerList;
	}
	public void setRemoveWorkmanagerList(List<String> removeWorkManagerList) {
		this.removeWorkManagerList = removeWorkManagerList;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
