package kr.or.warehouse.dto;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class WorkVO {

	private String wcode;
	private String wtitle;
	private String wcontent;
	private Date wdate;
	private Date wend;
	private int wopen;
	private int walarm;
	private int eno;
	private int wprogress;
	private String wstatus;
	private String classCode;
	private EmployeeVO requestBy;
	private List<WorkManagerVO> workManagerList;
	private int managerCnt;
	private int overDay;
	private int dDay;
	private int wcheck;
	private String hashTag;
	private int viewCnt;
	private String managerPhoto;
	private String manager;
	private String requesterEno;
	private String requester;
	private String requesterPhoto;
	private int favCheck;
	
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	

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
	public int getFavCheck() {
		return favCheck;
	}
	public void setFavCheck(int favCheck) {
		this.favCheck = favCheck;
	}
	public String getRequesterEno() {
		return requesterEno;
	}
	public void setRequesterEno(String requesterEno) {
		this.requesterEno = requesterEno;
	}
	public String getRequesterPhoto() {
		return requesterPhoto;
	}
	public void setRequesterPhoto(String requesterPhoto) {
		this.requesterPhoto = requesterPhoto;
	}
	public String getManagerPhoto() {
		return managerPhoto;
	}
	public void setManagerPhoto(String managerPhoto) {
		this.managerPhoto = managerPhoto;
	}
	public String getRequester() {
		return requester;
	}
	public void setRequester(String requester) {
		this.requester = requester;
	}

	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getWcontent() {
		return wcontent;
	}
	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public int getWcheck() {
		return wcheck;
	}
	public void setWcheck(int wcheck) {
		this.wcheck = wcheck;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public int getOverDay() {
		return overDay;
	}
	public void setOverDay(int overDay) {
		this.overDay = overDay;
	}
	public EmployeeVO getRequestBy() {
		return requestBy;
	}
	public void setRequestBy(EmployeeVO requestBy) {
		this.requestBy = requestBy;
	}
	public int getManagerCnt() {
		return managerCnt;
	}
	public void setManagerCnt(int managerCnt) {
		this.managerCnt = managerCnt;
	}
	public List<WorkManagerVO> getWorkManagerList() {
		return workManagerList;
	}
	public void setWorkManagerList(List<WorkManagerVO> workManagerList) {
		this.workManagerList = workManagerList;
	}
	public String getWcode() {
		return wcode;
	}
	public void setWcode(String wcode) {
		this.wcode = wcode;
	}
	public String getWtitle() {
		return wtitle;
	}
	public void setWtitle(String wtitle) {
		this.wtitle = wtitle;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public Date getWend() {
		return wend;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setWend(Date wend) {
		this.wend = wend;
	}
	public int getWopen() {
		return wopen;
	}
	public void setWopen(int wopen) {
		this.wopen = wopen;
	}
	public int getWalarm() {
		return walarm;
	}
	public void setWalarm(int walarm) {
		this.walarm = walarm;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getWprogress() {
		return wprogress;
	}
	public void setWprogress(int wprogress) {
		this.wprogress = wprogress;
	}
	public String getWstatus() {
		return wstatus;
	}
	public void setWstatus(String wstatus) {
		this.wstatus = wstatus;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
