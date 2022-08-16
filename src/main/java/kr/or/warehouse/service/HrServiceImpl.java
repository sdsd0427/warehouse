package kr.or.warehouse.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.DepartMentDAO;
import kr.or.warehouse.dao.HrDAO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrTypeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.dto.PostPositionVO;
import kr.or.warehouse.dto.VacLogVO;
import kr.or.warehouse.dto.VacProduceVO;
import kr.or.warehouse.dto.VacationVO;

@Service("hrService")
public class HrServiceImpl implements HrService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HrServiceImpl.class);

	@Resource(name = "hrDAO")
	private HrDAO hrDAO;

	@Autowired
	private DepartMentDAO departmentDAO;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat sdfOnlyTime = new SimpleDateFormat("HH:mm:ss");

	@Override
	public List<HrVO> getHrList(int eno) throws Exception {
		List<HrVO> hrList = null;
		hrList = hrDAO.selectHrList(eno);
		return hrList;
	}

	@Override
	public HrTypeVO getHrType(int eno) throws Exception {
		HrTypeVO hrType = null;
		hrType = hrDAO.selectHrType(eno);
		return hrType;
	}

	@Override
	public EmployeeVO getEmp(int eno) throws Exception {
		EmployeeVO employee = null;
		employee = hrDAO.selectEmp(eno);
		return employee;
	}

	//주간 섬네일 구하기
	@Override
	public List<Map<String, Object>> getWeekCalc(HrVO hr) throws Exception {
		List<Map<String, Object>> weekCalcList = new ArrayList<Map<String,Object>>();
		Map<String, Object> resultMap = null;

		String hrDate = hr.getHrDate();
		Date date = sdf.parse(hrDate);

		//월 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int intYear = cal.get(Calendar.YEAR);
		int intMonth = cal.get(Calendar.MONTH) + 1;
		int intDate = 1;
		System.out.println(intYear + ", " + intMonth + ", " + intDate);

		cal = Calendar.getInstance();
		for(int i = 0; i < 5; i++) {
			cal = Calendar.getInstance();
			cal.set(intYear, intMonth-1, intDate +(7 * i));
			Date calDate = cal.getTime();
			System.out.println("calDate : " + calDate);
			hr.setHrDate(sdf.format(calDate));
			resultMap = hrDAO.selectWeekCalc(hr);
			resultMap.put("tardy", hrDAO.selectWeekTardy(hr));
			resultMap.put("reqCount", hrDAO.selectWeekReqChange(hr));
			weekCalcList.add(resultMap);
		}

		return weekCalcList;
	}

	//주간테이블 구하기
	@Override
	public List<HrVO> getWeekTable(int eno, String weekStart) throws Exception {
		List<Map<String, Object>> weekTable = new ArrayList<Map<String,Object>>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("eno", eno);
		paramMap.put("weekStart", weekStart);

		List<HrVO> hrTable = hrDAO.selectWeekTableByWeekStart(paramMap);

		return hrTable;
	}

	//근무상태 변경
	@Override
	public void changeCondition(EmployeeVO employee) throws Exception {
		hrDAO.updateCondition(employee);
	}

	//근무자 입력
	@Override
	public void write(Map<String, HrVO> logMap) throws Exception {
		System.out.println("logMap" +logMap);
		HrVO hr = null;
		String hrcode = "";
		int hrTime = 0;
		int overTime = 0;
		int stdTime = 0;

		Map<String, Object> paramMap = null;
		if(logMap != null) for(String key : logMap.keySet()) {
			//key를 이용해서 hrVO꺼내기
			hr = logMap.get(key);
			System.out.println("before : " + hr);

			//이미 있는 eno는 continue
			paramMap = new HashMap<String, Object>();
			paramMap.put("eno", hr.getEno());
			paramMap.put("hrdate", hr.getHrDate());
			HrVO selectHrByEno = hrDAO.selectHrByEno(paramMap);
			if(selectHrByEno != null) continue;

			//다오로 그날의 마지막 코드 가져와서 뒤 3자리 자르고, 파스 인트 / null이면 0으로 초기화
			int code = 0;
			List<String> selectHrcodeByHrDate = hrDAO.selectHrcodeByHrDate(hr.getHrDate());
			System.out.println("여기 : " + selectHrcodeByHrDate);
			if(selectHrcodeByHrDate.size() > 0) {
				code = Integer.parseInt(selectHrcodeByHrDate.get(0).substring(8));
			}
			//hrcode
			code += 1;
			hrcode = "hr"
					+ hr.getHrDate().substring(2).replace("-", "")
					+ String.format( "%1$03d" , code );
			System.out.println(hrcode);
			hr.setHrcode(hrcode);

			//state
			// 1. emp꺼내서 근무유형 및 설정 시간 확인
			HrTypeVO hrType = hrDAO.selectHrType(hr.getEno());

			//추가 필요

			// 2. 지각이면 2, 아니면 1(근무 요일 아닐 때는 지각 아님)
			String[] hrDay = hrType.getHrDay().split(",");

			//기준일 꺼내서 요일 구하고
			Date parse = sdf.parse(hr.getHrDate());
			Calendar cal = Calendar.getInstance();
			cal.setTime(parse);
			String day = cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN);
			//기준일이 근무요일에 포함되어 있는지 확인
			boolean contains = Arrays.asList(hrDay).contains(day);

			if(hr.getOnTime().after(sdfOnlyTime.parse(hrType.getOnTime())) && contains) {
				hr.setState(2);
			} else {
				hr.setState(1);
			}
			// 3. 결근자 처리는? 따로!

			//hrTime
			Date onTime = hr.getOnTime();
			Date offTime = hr.getOffTime();
//			Date parse1 = sdf.parse(hr.getOnTime());
//			Date parse2 = sdf.parse(hr.getOffTime());
			long time = (offTime.getTime() - onTime.getTime()) / 1000;
			int hour = (int) (time/(60*60));
//			System.out.println("time : " +time);
//			System.out.println("hour : " +hour);
//	        int minute = (int) (time/60-(hour*60));
//	        int second = (int) (time%60);

//	        hrTime = hour+"h"+minute+"m"+second+"s";
	        hrTime = hour;
	        System.out.println("hrTime : " + hrTime);
//	        hr.setHrTime(hrTime);

			//overTime & stdTime
	        if(hrTime > 8) {
	        	stdTime = 8;
	        	overTime = hrTime - stdTime;
	        } else {
	        	stdTime = hrTime;
	        }

	        hr.setOverTime(overTime);
	        hr.setStdTime(stdTime);

			//reqChange -> default 0
	        hr.setReqChange(0);

			//DAO를 통해 insert
			System.out.println("after : " + hr);
			hrDAO.insertHr(hr);
		}
	}

	@Override
	public List<EmployeeVO> getEmpForHrData(String day) throws Exception {
		return hrDAO.selectEmpForHrData(day);
	}

	//결근자 기록
	@Override
	public void writeAbsent(HrVO hr) throws Exception {
		//다오로 그날의 마지막 코드 가져와서 뒤 3자리 자르고, 파스 인트 / null이면 0으로 초기화
		int code = 0;
		String hrcode = "";
		List<String> selectHrcodeByHrDate = hrDAO.selectHrcodeByHrDate(hr.getHrDate());
		if(selectHrcodeByHrDate.size() > 0) {
			code = Integer.parseInt(selectHrcodeByHrDate.get(0).substring(8));
		}

		//hrcode
		code += 1;
		hrcode = "hr"
				+ hr.getHrDate().substring(2).replace("-", "")
				+ String.format( "%1$03d" , code );
		hr.setHrcode(hrcode);
		hr.setReqChange(0);
		hrDAO.insertHr(hr);
	}

	@Resource(name = "hrLogSavePath")
	private String savePath = "c:\\log";

	private String saveFileName = "hr_log.csv";

	//csv에서 퇴근 시간 가져오기
	@Override
	public String getOffTime(int eno) throws Exception{
		String result = "";

		File logFile = new File(savePath+File.separator+saveFileName);
		if(!logFile.exists()) {
			new File(savePath).mkdirs();
			String logFilePath=savePath+File.separator+saveFileName;
			BufferedWriter out=new BufferedWriter(new FileWriter(logFilePath,true));

			out.write("");
			out.close();
		}

		FileReader reader = new FileReader(logFile);
		BufferedReader in=new BufferedReader(reader);

		String textLine=null;
		try {
			while((textLine=in.readLine())!=null) {
				System.out.println(textLine);
				String[] logData =textLine.split(",");
				if(Integer.parseInt(logData[1])==eno){
					String[] split = logData[5].split(" ");
					Date date = new Date();
//			        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			        String strDate = sdf.format(date);
			        System.out.println(strDate);
					if(split[0].equals(strDate)) {
						if(logData[0].equals("[offtime]")) {
							result = logData[3].split(" ")[1];;
							System.out.println(result);
						}
					}
				}
			}
		}finally {
			if(reader!=null) reader.close();
			if(in!=null) in.close();
		}

		return result;
	}

	//csv에 퇴근 기록 남기기
	@Override
	public String leaveWorklogFile(HrVO hr, String ip) throws Exception{
		ip = "192.168.34.62";
		String result = "";
		int eno = hr.getEno();
		EmployeeVO employee = hrDAO.selectEmp(eno);

		String ipAddress = employee.getIpaddress();

		if(!(ipAddress.equals(ip))) {
			result = "false";
			return result;
		}

		leaveLogFile(hr, ipAddress);
		result = hr.getOffTimeStr();
		return result;
	}

	//csv에서 출근 시간 가져오기
	@Override
	public String getOnTime(int eno) throws Exception{
		String result = "";

		File logFile = new File(savePath+File.separator+saveFileName);
		if(!logFile.exists()) {
			new File(savePath).mkdirs();
			String logFilePath=savePath+File.separator+saveFileName;
			BufferedWriter out=new BufferedWriter(new FileWriter(logFilePath,true));

			//로그 기록
			out.write("");
			out.close();
		}

		FileReader reader = new FileReader(logFile);
		BufferedReader in=new BufferedReader(reader);

		String textLine=null;
		try {
			while((textLine=in.readLine())!=null) {
				String[] logData =textLine.split(",");
				if(Integer.parseInt(logData[1])==eno){
					String[] split = logData[5].split(" ");
					Date date = new Date();
//					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String strDate = sdf.format(date);
					if(split[0].equals(strDate)) {
						if(logData[0].equals("[ontime]")) {
							result = logData[3].split(" ")[1];
							break;
						}
					}
				}
			}
		}finally {
			if(reader!=null) reader.close();
			if(in!=null) in.close();
		}

		return result;
	}

	//csv에 출근 기록 남기기
	@Override
	public String goToWorklogFile(HrVO hr, String ip) throws Exception{
		ip = "192.168.34.62";
		String result = "";
		int eno = hr.getEno();
		EmployeeVO employee = hrDAO.selectEmp(eno);

		String ipAddress = employee.getIpaddress();

		if(!(ipAddress.equals(ip))) {
			result = "false";
			return result;
		}

		goToWorkLogFile(hr, ipAddress);
		result = null;
		return result;
	}


	private void leaveLogFile(HrVO hr, String ip) throws IOException{
		String tag = "[offtime]";
		String log = tag + ","
				+ hr.getEno() + ","
				+ hr.getHrDate() + ","
				+ format.format(hr.getOffTime()) + ","
				+ ip + ","
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

		File file=new File(savePath);
		file.mkdirs();

		String logFilePath=savePath+File.separator+saveFileName;
		BufferedWriter out=new BufferedWriter(new FileWriter(logFilePath,true));

		//로그 기록
		out.write(log);
		out.newLine();
		out.close();
	}

	private void goToWorkLogFile(HrVO hr, String ip) throws IOException{
		String tag = "[ontime]";
		String log = tag + ","
				+ hr.getEno() + ","
				+ hr.getHrDate() + ","
				+ format.format(hr.getOnTime()) + ","
				+ ip + ","
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

		File file=new File(savePath);
		file.mkdirs();

		String logFilePath=savePath+File.separator+saveFileName;
		BufferedWriter out=new BufferedWriter(new FileWriter(logFilePath,true));

		//로그 기록
		out.write(log);
		out.newLine();
		out.close();
	}

	//난 안 쓴다 - 민규
	@Override
	public List<PostPositionVO> getPostPositionList() throws Exception {
		return hrDAO.selectPostPosition();
	}

	@Override
	public VacationVO getVacation(int eno) throws SQLException {
		VacationVO vacation = hrDAO.selectVacation(eno);
		return vacation;
	}

	@Override
	public List<Map<String, Date>> selectVacationPeriod(int eno) throws SQLException {
		return hrDAO.selectVacationPeriod(eno);
	}

	@Override
	public List<VacLogVO> VacationUsageHistory(int eno, String vyear) throws SQLException {
		Map<String, Object> vacMap = new HashMap<String, Object>();
		vacMap.put("eno", eno);
		vacMap.put("vyear", vyear);

		return hrDAO.selectVacationUsageHistory(vacMap);
	}

	@Override
	public List<VacProduceVO> VacationProduceHistory(int eno, String vyear) throws SQLException {
		Map<String, Object> vacMap = new HashMap<String, Object>();
		vacMap.put("eno", eno);
		vacMap.put("vyear", vyear);

		return hrDAO.selectVacationProduceHistory(vacMap);
	}

	@Override
	public Map<String, Object> getSelectTeamHrList(Criteria cri, int dno, String condition) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("condition", condition);
		paramMap.put("dno", dno);

		List<EmployeeVO> teamList = hrDAO.selectTeamHrList(paramMap,rowBounds);

		int teamListCount = hrDAO.selectTeamHrListCount(paramMap);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(teamListCount);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("teamList", teamList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int selectTeamHrListCount(int dno, String condition) throws Exception {
//		if("휴가".equals(condition)) {
//			condition = "업무종료";
//		} else if("회의중".equals(condition) || "외근".equals(condition) || "외근 후 퇴근".equals(condition) || "출장".equals(condition)){
//			condition = "자리비움";
//		}


		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("condition", condition);
		paramMap.put("dno", dno);

		int teamListCount = hrDAO.selectTeamHrListCount(paramMap);
		return teamListCount;
	}

	@Override
	public int selectTeamHrListAllCount(int dno) throws Exception {
		int allCount = hrDAO.selectTeamHrListAllCount(dno);
		return allCount;
	}

	@Override
	public void modifyHr(EmployeeVO employee) throws Exception {
		hrDAO.updateHr(employee);
	}

	@Override
	public void modifyHrType(HrTypeVO hrType) throws Exception {
		hrType.setOnTime(hrType.getOnTime()+":00");
		hrType.setOffTime(hrType.getOffTime()+":00");

		hrDAO.updateHrType(hrType);

		if(hrType.getIpAddress() != null) {
			hrDAO.updateIp(hrType);
		}
	}

	@Override
	public Map<String, Object> getTeamList(Criteria cri, int dno, String weekStart) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<EmployeeVO> selectEmpByDno = null;

		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		paramMap.put("weekStart", weekStart);

//		Date today = new Date();
//		String date = sdf.format(today);
//		Map<String, String> selectWeekStEd = hrDAO.selectWeekStEd(date);
//		String weekStart = selectWeekStEd.get("WEEKSTART");
//		String weekEnd = selectWeekStEd.get("WEEKEND");
//		System.out.println(weekStart + weekEnd);

		Map<String, String> weekFullDate = hrDAO.selectWeekFullDate(weekStart);

		Map<String, Object> paramMap2 = null;
		List<HrVO> hrTable = null;
		Map<String, Object> teamOne = null;
		List<Map<String, Object>> teamList = new ArrayList<Map<String,Object>>();

		selectEmpByDno = hrDAO.selectEmpByDno(paramMap, rowBounds);
		if(selectEmpByDno != null) for(EmployeeVO emp : selectEmpByDno) {
			System.out.println(emp);
			paramMap2 = new HashMap<String, Object>();
			paramMap2.put("eno", emp.getEno());
			paramMap2.put("weekStart", weekStart);
			hrTable = hrDAO.selectWeekTableByWeekStart(paramMap2);
			System.out.println("여기 : " + hrTable);

			teamOne = new HashMap<String, Object>();
			teamOne.put("emp", emp);
			teamOne.put("hrTable", hrTable);

			teamList.add(teamOne);
		}


		int teamListCount = hrDAO.selectTeamEmpCount(paramMap);

		int allCount = hrDAO.selectAllCountByDno(dno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(teamListCount);

		dataMap.put("teamList", teamList);
		dataMap.put("weekFullDate", weekFullDate);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("allCount", allCount);

		return dataMap;
	}

	@Override
	public Map<String, String> getWeekDate(String weekStart) throws Exception {
		Map<String, String> weekDate = hrDAO.selectWeekStEd(weekStart);

		return weekDate;
	}

	@Override
	public Map<String, Object> getTeamVacList(Criteria cri, int dno) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);

		List<EmployeeVO> teamVacList = hrDAO.selectTeamVacList(paramMap, rowBounds);

		int teamVacListCount = hrDAO.selectTeamEmpCount(paramMap);

		int allCount = hrDAO.selectAllCountByDno(dno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(teamVacListCount);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("teamVacList", teamVacList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("allCount", allCount);

		return dataMap;
	}

	@Override
	public HrVO getHrTime(String hrcode) throws Exception {
		HrVO hrTime = hrDAO.selectHrTime(hrcode);
		return hrTime;
	}




}
