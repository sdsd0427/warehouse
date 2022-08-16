package kr.or.warehouse.scheduler;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.service.HrService;

public class HrLogTaskScheduler {

	private HrService hrService;
	public void setHrService(HrService hrService) {
		this.hrService = hrService;
	}

	private String savePath = "c:\\log";
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	private String fileName = "hr_log.csv";
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public void hrLogToDataBase() throws Exception{
		//로그 파일을 불러오고
		File logFile = new File(savePath + File.separator + fileName);
		
		//없으면 만들어야 해
		if(!logFile.exists()) {
			new File(savePath).mkdirs();
			String logFilePath=savePath+File.separator+fileName;
			BufferedWriter out=new BufferedWriter(new FileWriter(logFilePath,true));

			out.write("");
			out.close();
		}

		FileReader reader = new FileReader(savePath + File.separator + fileName);
		BufferedReader in = new BufferedReader(reader);

		//그릇 준비
		String textLine = null;
		Map<String, HrVO> logMap = new HashMap<String, HrVO>();

		//기준일 계산(오늘 -1)
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		cal.add(Calendar.DATE, -1);
		Date date = cal.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy.M.d");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String strDate = format.format(date);
		String strDate2 = format2.format(date);
//		System.out.println(strDate2);

		//계산 시작
		try {
			while((textLine = in.readLine()) != null) {
				String[] logData =textLine.split(",");
				
					{
						//csv 내용 확인
						System.out.println("eno" + logData[1]);
						System.out.println("hrDate" + logData[2]);
						System.out.println("time"+logData[3]);
						System.out.println("ip"+logData[4]);
						System.out.println("regDate"+logData[5]);
					}
					
				if(logData[2].equals(strDate)) { //필요한 날짜만 도출 - ("yyyy.M.d")형식
					String eno = logData[1];
					System.out.println("eno왔니?"+eno);
					
					if(logMap.get(eno) == null) { //뽑아낸 eno를 key로 그릇 map에 Vo를 생성
						logMap.put(eno, new HrVO());
						logMap.get(eno).setEno(Integer.parseInt(eno)); //set eno
					}

					logMap.get(eno).setHrDate(strDate); //set strDate - ("yyyy-MM-dd")형식

					if(logData[0].equals("[ontime]")) { //출근이고
						//이미 set된 시간이 없거나 가장 빠른 시간이면
						if(logMap.get(eno).getOnTime() == null
								|| sdf.parse(logData[3]).before(sdf.parse(logMap.get(eno).getOnTimeStr()))) {
							logMap.get(eno).setOnTime(sdf.parse(logData[3])); //set onTime  
						}

					} else if(logData[0].equals("[offtime]")) { //퇴근이고
						//이미 set된 시간이 없거나 가장 늦은 시간이면
						if(logMap.get(eno).getOffTime() == null
								|| sdf.parse(logData[3]).after(sdf.parse(logMap.get(eno).getOffTimeStr()))) {
							logMap.get(eno).setOffTime(sdf.parse(logData[3])); //set offTime
						}
					}
				}

			}
		} finally {
			if(reader != null) reader.close();
			if(in != null) in.close();
		}

		System.out.println("logMap 잘 왔니? : " + logMap);
		hrService.write(logMap);
		
		String day = cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN);
		System.out.println(day);
		
		//추가 - 결근자 입력
		//추가 - 휴가자 입력
		//추가 - 출장 입력
		hrStateToDataBase(strDate, day);
	}

	public void hrStateToDataBase(String strDate, String day) throws Exception{
		//service로 상태가 휴직(2), 퇴사(0)가 아니면서 근무상태가 휴가가 아닌 emp 찾고
		//근무 요일이 아닌 날은 제외
		List<EmployeeVO> empList = hrService.getEmpForHrData(day);
		System.out.println("empList : " +empList);
		
		Calendar cal = Calendar.getInstance();
        cal.set(1990, 3, 27);
        Date tempDate1 = cal.getTime();
        cal.set(1991, 8, 7);
        Date tempDate2 = cal.getTime();
        cal.set(1970, 1, 7);
        Date tempDate3 = cal.getTime();
		
		//찾은 eno로 오늘의 hr을 찾아서 없으면
		if(empList != null) for(EmployeeVO emp : empList) {
			boolean flag = false;
			List<HrVO> hrList = hrService.getHrList(emp.getEno());
			
			if(hrList != null) for(HrVO hr : hrList) {
				if(hr.getHrDate().equals(strDate)) flag = true;
			}
			//근무상태 입력 
			// 0:결근
			// 출장은 어떻게 처리하나요?
			// 휴가는?
			if(!flag) {
				
				HrVO absentHr = new HrVO();
				absentHr.setEno(emp.getEno());
				absentHr.setHrDate(strDate);
				absentHr.setHrTime(0);
				absentHr.setOverTime(0);
				absentHr.setStdTime(0);
				
				if("휴가".equals(emp.getCondition())) {
					absentHr.setState(3);
					absentHr.setOnTime(tempDate2);
					absentHr.setOffTime(tempDate2);
					
				} else if("출장".equals(emp.getCondition())) {
					absentHr.setState(1);
					absentHr.setHrTime(8);
					absentHr.setStdTime(8);
					absentHr.setOverTime(0);
					absentHr.setOnTime(tempDate3);
					absentHr.setOffTime(tempDate3);
				} else {
					absentHr.setState(0);
					absentHr.setOnTime(tempDate1);
					absentHr.setOffTime(tempDate1);
				}
				
				hrService.writeAbsent(absentHr);
			}
		}
		
		
	}
	
}
