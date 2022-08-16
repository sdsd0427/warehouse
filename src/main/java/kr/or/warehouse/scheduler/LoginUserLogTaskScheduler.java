package kr.or.warehouse.scheduler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.warehouse.dto.LoginUserLogVO;
import kr.or.warehouse.service.LoginUserLogService;

public class LoginUserLogTaskScheduler {
	@Autowired
	private LoginUserLogService logService;
	public void setLoginUserLogService(LoginUserLogService logService) {
		this.logService = logService;
	}

	private String savePath="c:\\log";
	public void setSavePath(String savePath) {
		this.savePath=savePath;
	}

	private String fileName="login_log.csv";
	public void setFileName(String fileName) {
		this.fileName=fileName;
	}

	public void loginUserLogToDataBase() throws Exception{
		FileReader reader = new FileReader(savePath+File.separator+fileName);
		BufferedReader in=new BufferedReader(reader);

		String textLine=null;
		List<LoginUserLogVO> logList=new ArrayList<LoginUserLogVO>();
		try {
			while((textLine=in.readLine())!=null) {
				String[] logData =textLine.replace("[login:user]","").split(",");


				LoginUserLogVO logVO=new LoginUserLogVO();
				logVO.setEno(Integer.parseInt(logData[0]));
				logVO.setPhone(logData[1]);
				logVO.setEmail(logData[2]);
				logVO.setIpAddress(logData[3]);
				logVO.setInDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(logData[4]));
				logList.add(logVO);
			}
		}finally {
			if(reader!=null) reader.close();
			if(in!=null) in.close();
		}
		System.out.println("logList : " + logList);
		System.out.println(logService);
		logService.write(logList);
	}
}
