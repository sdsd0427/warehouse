package kr.or.warehouse.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PopularHashtagVO {
	private String hashtag; // 해시태그
	private int knowHowCnt; // 노하우 해시태그  사용 수
	private int approvalCnt; // 전사문서함 해시태그 사용 수
	private int cnt; // 합
	
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getKnowHowCnt() {
		return knowHowCnt;
	}
	public void setKnowHowCnt(int knowHowCnt) {
		this.knowHowCnt = knowHowCnt;
	}
	public int getApprovalCnt() {
		return approvalCnt;
	}
	public void setApprovalCnt(int approvalCnt) {
		this.approvalCnt = approvalCnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
	      return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
}
