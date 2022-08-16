package kr.or.warehouse.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.warehouse.dto.ManualVO;

public class ManualRegistCommand {

	private String manualTitle;
	private int cateNo;
	private String manualContent;

	private List<MultipartFile> uploadFile;

	public String getManualTitle() {
		return manualTitle;
	}

	public void setManualTitle(String manualTitle) {
		this.manualTitle = manualTitle;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getManualContent() {
		return manualContent;
	}

	public void setManualContent(String manualContent) {
		this.manualContent = manualContent;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public ManualVO toManualVO() {
		ManualVO manual = new ManualVO();
		manual.setManualTitle(this.manualTitle);
		manual.setManualContent(this.manualContent);
		manual.setCateNo(this.cateNo);

		return manual;
	}

}
