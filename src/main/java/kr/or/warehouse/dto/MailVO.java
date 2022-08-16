package kr.or.warehouse.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class MailVO {
	private String mailNo; // 메일번호
	private int mFrom; // 발신자
	private String title = " "; // 제목
	private String content = ""; // 내용
	private Date mDate; // 날짜
	private int imporMail; // 중요
	private int clean; // 휴지통
	private int mFromDel; // 발신자 삭제
	private String name; // 이름
	private int emergency;
	private int tempMail;

	public int getTempMail() {
		return tempMail;
	}

	public void setTempMail(int tempMail) {
		this.tempMail = tempMail;
	}

	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;

	private List<MtoVO> mtoList;
	private List<TempMailVO> tempMailList;
	
	public int getEmergency() {
		return emergency;
	}
	
	public void setEmergency(int emergency) {
		this.emergency = emergency;
	}

	public List<TempMailVO> getTempMailList() {
		return tempMailList;
	}

	public void setTempMailList(List<TempMailVO> tempMailList) {
		this.tempMailList = tempMailList;
	}

	public List<MtoVO> getMtoList() {
		return mtoList;
	}

	public void setMtoList(List<MtoVO> mtoList) {
		this.mtoList = mtoList;
	}

	public List<AttachVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMailNo() {
		return mailNo;
	}

	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}

	public int getmFrom() {
		return mFrom;
	}

	public void setmFrom(int mFrom) {
		this.mFrom = mFrom;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public int getImporMail() {
		return imporMail;
	}

	public void setImporMail(int imporMail) {
		this.imporMail = imporMail;
	}

	public int getClean() {
		return clean;
	}

	public void setClean(int clean) {
		this.clean = clean;
	}

	public int getmFromDel() {
		return mFromDel;
	}

	public void setmFromDel(int mFromDel) {
		this.mFromDel = mFromDel;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
