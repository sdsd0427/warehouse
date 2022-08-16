package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SignAttachVO {

	private String signAno;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String signNo;
	
	
	public String getSignAno() {
		return signAno;
	}
	public void setSignAno(String signAno) {
		this.signAno = signAno;
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
	public String getSignNo() {
		return signNo;
	}
	public void setSignNo(String signNo) {
		this.signNo = signNo;
	}
	
	@Override
	public String toString() {
	      return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
}
