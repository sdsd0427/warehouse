package kr.or.warehouse.interceptor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.warehouse.dto.EmployeeVO;

public class LoginUserInterceptor extends HandlerInterceptorAdapter {

	private String savePath = "c:\\log";
	private String saveFileName = "login_log.csv";

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		EmployeeVO loginUser = (EmployeeVO) request.getSession().getAttribute("loginUser");

		if(loginUser == null) return;

		//로그인 정보를 스트링으로 저장
		String tag = "[login:user]";
		String log = tag
				+ loginUser.getEno() + ","
				+ loginUser.getPhone() + ","
				+ loginUser.getEmail() + ","
				+ request.getRemoteAddr() + ","
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

		File file = new File(savePath);
		file.mkdirs();

		String logFilePath = savePath + File.separator + saveFileName;
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));

		//로그를 기록
		out.write(log);
		out.newLine();

		out.close();
	}
}









