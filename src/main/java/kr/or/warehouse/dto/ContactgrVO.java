package kr.or.warehouse.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class ContactgrVO {

	private String cogroupcode;
	private String cogroupname;
	private int eno;
	private List<EmployeeVO> groupMember;

	private int groupCount;
	
	   private String email;
	   private String name;
	   private String photo;
	   private String call;
	   private int enabled;
	   private String condition;
	   private String dname;
	   private String ppsname;
	   private String phone;
	   
	   
	   
	

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getPpsname() {
		return ppsname;
	}
	public void setPpsname(String ppsname) {
		this.ppsname = ppsname;
	}
	public int getGroupCount() {
		return groupCount;
	}
	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}
	public List<EmployeeVO> getGroupMember() {
		return groupMember;
	}
	public void setGroupMember(List<EmployeeVO> groupMember) {
		this.groupMember = groupMember;
	}
	public String getCogroupcode() {
		return cogroupcode;
	}
	public void setCogroupcode(String cogroupcode) {
		this.cogroupcode = cogroupcode;
	}
	public String getCogroupname() {
		return cogroupname;
	}
	public void setCogroupname(String cogroupname) {
		this.cogroupname = cogroupname;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}


	@Override
	public String toString() {
	      return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
