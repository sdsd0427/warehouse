package kr.or.warehouse.command;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

import kr.or.warehouse.dto.EmployeeVO;

public class EmployeeCommand {

	private String eno;
	private String email;
	private String name;
	private MultipartFile photo;
	private String phone;
	private String mbti;
	private String address;
	private String pwd;
	private String signtype;
	private String signpath;
	
	private String uploadPicture; // 변경된 사진 파일명.

	

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
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

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSigntype() {
		return signtype;
	}

	public void setSigntype(String signtype) {
		this.signtype = signtype;
	}

	public String getSignpath() {
		return signpath;
	}

	public void setSignpath(String signpath) {
		this.signpath = signpath;
	}

	public String getUploadPicture() {
		return uploadPicture;
	}

	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	public EmployeeVO toEmployeeVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmail(this.email);
		employee.setName(this.name);
		employee.setPhone(this.phone);
		employee.setMbti(this.mbti);
		employee.setAddress(this.address);
		employee.setPwd(this.pwd);
		
		return employee;
		
	}
	
}
