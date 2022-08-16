package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AttachVO {
	private String attachNo;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private Date regDate;
	private String refNo;
	private int eno;


	public String getAttachNo() {
		return attachNo;
	}
	public void setAttachNo(String attachNo) {
		this.attachNo = attachNo;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getRefNo() {
		return refNo;
	}
	public void setRefNo(String refNo) {
		this.refNo = refNo;
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

