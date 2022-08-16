package kr.or.warehouse.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private Date regDate;
	private Date updateDate;
	private int viewCnt;
	private int eno;
	private String classCode;
	private String fix;
	private int anonym;
	private int eventcate;
	private Date enddate = new Date();

	private String photo;
	private String name;
	private int replyCnt;
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	private String[] deleteFile;
	private int newCheck;
	private int endCheck;
	private String weekStart;
	private String weekEnd;

	public String getWeekStart() {
		return weekStart;
	}
	public void setWeekStart(String weekStart) {
		this.weekStart = weekStart;
	}
	public String getWeekEnd() {
		return weekEnd;
	}
	public void setWeekEnd(String weekEnd) {
		this.weekEnd = weekEnd;
	}
	public int getEndCheck() {
		return endCheck;
	}
	public void setEndCheck(int endCheck) {
		this.endCheck = endCheck;
	}
	public int getNewCheck() {
		return newCheck;
	}
	public void setNewCheck(int newCheck) {
		this.newCheck = newCheck;
	}
	public int getEventcate() {
		return eventcate;
	}
	public void setEventcate(int eventcate) {
		this.eventcate = eventcate;
	}
	public Date getEnddate() {
		return enddate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public int getAnonym() {
		return anonym;
	}
	public void setAnonym(int anonym) {
		this.anonym = anonym;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFix() {
		return fix;
	}
	public void setFix(String fix) {
		this.fix = fix;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
