package kr.or.warehouse.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.servlet.View;

import kr.or.warehouse.command.FileDownloadResolver;

public class FileDownloadView implements View{
	private String contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
	private void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Override
	public String getContentType() {
		return this.contentType;
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String savedPath = (String) model.get("savedPath");
		String fileName = (String) model.get("fileName");

		FileDownloadResolver.sendFile(fileName, savedPath, request, response);
	}
}
