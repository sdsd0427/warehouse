package kr.or.warehouse.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class CommunityVO {
	private String cmno;
	private String cname;
	private String intro;
	private int open;
	private int eno;
	private int approve;
	private Date regDate;
	private String name;
	
	private int joinCnt; // 회원수
	private int checkEno; // 가입 커뮤니티 확인용 아이디
	private int checkJoin; // 가입한 커뮤니티 인지 확인
	
	private int authority; //회원 권한
	private Date jDate;
	
	private String photo;
	private String image;
	
	private MultipartFile imageFile;
	
	
	
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getjDate() {
		return jDate;
	}
	public void setjDate(Date jDate) {
		this.jDate = jDate;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getCheckEno() {
		return checkEno;
	}
	public void setCheckEno(int checkEno) {
		this.checkEno = checkEno;
	}
	public int getCheckJoin() {
		return checkJoin;
	}
	public void setCheckJoin(int checkJoin) {
		this.checkJoin = checkJoin;
	}
	public int getJoinCnt() {
		return joinCnt;
	}
	public void setJoinCnt(int joinCnt) {
		this.joinCnt = joinCnt;
	}
	public String getCmno() {
		return cmno;
	}
	public void setCmno(String cmno) {
		this.cmno = cmno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve = approve;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
}
