package kr.or.warehouse.command;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PnoListCommand {

	private List<String> pno;

	public List<String> getPno() {
		return pno;
	}

	public void setPno(List<String> pno) {
		this.pno = pno;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
