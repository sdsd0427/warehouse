package kr.or.warehouse.command;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Criteria {

	private int page = 1;
	private int perPageNum = 10;

	private int startRowNum = 0;

	private String keyword = "";
	private String searchType = "";
	private int category = 0;
	private String classInit;

	private String signForm = "";

	private int catecode1 = 0;
	private int catecode2 = 0;
	private int catecode3 = 0;

	public int getCatecode1() {
		return catecode1;
	}

	public void setCatecode1(int catecode1) {
		this.catecode1 = catecode1;
	}

	public int getCatecode2() {
		return catecode2;
	}

	public void setCatecode2(int catecode2) {
		this.catecode2 = catecode2;
	}

	public int getCatecode3() {
		return catecode3;
	}

	public void setCatecode3(int catecode3) {
		this.catecode3 = catecode3;
	}

	public String getSignForm() {
		return signForm;
	}

	public void setSignForm(String signForm) {
		this.signForm = signForm;
	}

	public String getClassInit() {
		return classInit;
	}

	public void setClassInit(String classInit) {
		this.classInit = classInit;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 1) {
			this.page = 1;
		} else {
			this.page = page;
		}
		setStartRowNum();
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum < 1) {
			this.perPageNum = 10;
		} else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum() {
		this.startRowNum = (this.page - 1) * perPageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
