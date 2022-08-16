package kr.or.warehouse.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class SignDocVO {

	private String title; // 제목
	private int tempSave; // 임시저장여부
	private int takeOver; // 문서인계
	private int state; // 상태
	private int sOpen; // 공개여부
	private String signNo; // 문서번호
	private String signContent; // 내용
	private String sFormNo; // 결재양식번호
	private int eno; // 기안자
	private int emergency; // 긴급
	private Date eDate; // 완료일
	private int dno; // 부서코드

	private String signLineNo; // 결재선

	private List<EmployeeVO> signer; // 결재자

	private Date dDate; // 기안일
	private String classCode; // 분류코드
	private int viewCnt;
	private String name;

	private String ppsname; // 직위 이름 -> 추가
	private String photo; // 사진 -> 추가
	private String dname;

	private SignFormVO signForm;
	
	private Date vacStart;
	private Date vacEnd;

	
	


	public Date getVacStart() {
		return vacStart;
	}

	public void setVacStart(String vacStart) {
		System.out.println("vacStart : " + vacStart);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.vacStart = sdf.parse(vacStart);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getVacEnd() {
		return vacEnd;
	}

	public void setVacEnd(String vacEnd) {
		System.out.println("vacEnd : " + vacEnd);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.vacEnd = sdf.parse(vacEnd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private List<SignAttachVO> SignAttachList;

	private List<MultipartFile> uploadFile;

	private List<AttachVO> attachList;

	private String formText;

	private String hashTag;

	private List<SignerVO> signerList;

	private int favCheck;
	
	private int signState;
	
	public int getSignState() {
		return signState;
	}

	public void setSignState(int signState) {
		this.signState = signState;
	}

	public int getFavCheck() {
		return favCheck;
	}

	public void setFavCheck(int favCheck) {
		this.favCheck = favCheck;
	}


	public List<SignerVO> getSignerList() {
		return signerList;
	}

	public void setSignerList(List<SignerVO> signerList) {
		this.signerList = signerList;
	}
	
	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	public String getFormText() {
		return formText;
	}

	public void setFormText(String formText) {
		this.formText = formText;
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

	public List<SignAttachVO> getSignAttachList() {
		return SignAttachList;
	}

	public void setSignAttachList(List<SignAttachVO> signAttachList) {
		SignAttachList = signAttachList;
	}

	public String getSignLineNo() {
		return signLineNo;
	}

	public void setSignLineNo(String signLineNo) {
		this.signLineNo = signLineNo;
	}

	public List<EmployeeVO> getSigner() {
		return signer;
	}

	public void setSigner(List<EmployeeVO> signer) {
		this.signer = signer;
	}

	public String getPpsname() {
		return ppsname;
	}

	public void setPpsname(String ppsname) {
		this.ppsname = ppsname;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public SignFormVO getSignForm() {
		return signForm;
	}

	public void setSignForm(SignFormVO signForm) {
		this.signForm = signForm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTempSave() {
		return tempSave;
	}

	public void setTempSave(int tempSave) {
		this.tempSave = tempSave;
	}

	public int getTakeOver() {
		return takeOver;
	}

	public void setTakeOver(int takeover) {
		this.takeOver = takeover;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getsOpen() {
		return sOpen;
	}

	public void setsOpen(int sOpen) {
		this.sOpen = sOpen;
	}

	public String getSignNo() {
		return signNo;
	}

	public void setSignNo(String signNo) {
		this.signNo = signNo;
	}

	public String getSignContent() {
		return signContent;
	}

	public void setSignContent(String signContent) {
		this.signContent = signContent;
	}

	public String getsFormNo() {
		return sFormNo;
	}

	public void setsFormNo(String sFormNo) {
		this.sFormNo = sFormNo;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public int getEmergency() {
		return emergency;
	}

	public void setEmergency(int emergency) {
		this.emergency = emergency;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public Date getdDate() {
		return dDate;
	}

	public void setdDate(Date dDate) {
		this.dDate = dDate;
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
