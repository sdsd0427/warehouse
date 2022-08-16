package kr.or.warehouse.dto;

public class MenuVO {
	private String mcode;
	private String mname;
	private String murl;
	private String upcode;
	private int mlevel;
	private int isnav;
	private String micon;

	public String getMicon() {
		return micon;
	}

	public void setMicon(String micon) {
		this.micon = micon;
	}

	public int getIsnav() {
		return isnav;
	}

	public void setIsnav(int isnav) {
		this.isnav = isnav;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMurl() {
		return murl;
	}

	public void setMurl(String murl) {
		this.murl = murl;
	}

	public String getUpcode() {
		return upcode;
	}

	public void setUpcode(String upcode) {
		this.upcode = upcode;
	}

	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
}
