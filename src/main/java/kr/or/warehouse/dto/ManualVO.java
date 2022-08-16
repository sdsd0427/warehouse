package kr.or.warehouse.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class ManualVO {

	private String manualNo;
	private String manualTitle;
	private String manualContent;
	private Date regDate;
	private int viewCnt;
	private Date updateDate;
	private int cateNo;
	private int eNo;
	private String title;
	private String name;
	private int favCount = 0 ;

	private String[]deleteFile;
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;



	public int getFavCount() {
		return favCount;
	}
	public void setFavCount(int favCount) {
		this.favCount = favCount;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}

	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getManualNo() {
		return manualNo;
	}
	public void setManualNo(String manualNo) {
		this.manualNo = manualNo;
	}
	public String getManualTitle() {
		return manualTitle;
	}
	public void setManualTitle(String manualTitle) {
		this.manualTitle = manualTitle;
	}
	public String getManualContent() {
		return manualContent;
	}
	public void setManualContent(String manualContent) {
		this.manualContent = manualContent;
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
	public int getCateNo() {
		return cateNo;
	}
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	@Override
	public String toString() {
	      return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}



}
