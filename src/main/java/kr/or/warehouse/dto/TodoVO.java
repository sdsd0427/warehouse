package kr.or.warehouse.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class TodoVO {

	private int todoNo     ;
	private String todoTitle;
	private String todoContent;
	private Date todoTime   ;
	private int todoCheck  = 0;
	private int todoSignal;
	private int eno        ;
	
	public String getTodoTitle() {
		return todoTitle;
	}
	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}
	public int getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	public Date getTodoTime() {
		return todoTime;
	}
	public void setTodoTime(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		try {
			Date todoTime = sdf.parse(time);
			this.todoTime = todoTime;
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public int getTodoCheck() {
		return todoCheck;
	}
	public void setTodoCheck(int todoCheck) {
		this.todoCheck = todoCheck;
	}
	public int getTodoSignal() {
		return todoSignal;
	}
	public void setTodoSignal(int todoSignal) {
		this.todoSignal = todoSignal;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
