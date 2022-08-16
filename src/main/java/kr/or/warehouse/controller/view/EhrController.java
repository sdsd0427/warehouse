package kr.or.warehouse.controller.view;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.HrTypeVO;
import kr.or.warehouse.dto.HrVO;
import kr.or.warehouse.dto.PostPositionVO;
import kr.or.warehouse.dto.VacationVO;
import kr.or.warehouse.service.HrService;

@Controller
@RequestMapping("/ehr")
public class EhrController {

	@Autowired
	private HrService hrService;

	@Resource(name = "hrLogSavePath")
	private String savePath = "c:\\log";

	private String fileName = "hr_log.csv";

	@RequestMapping(value="/excel")
	public void excel(HttpServletResponse response, String hrDate, int eno, HttpSession session) throws Exception {
	// 데이터를 넣을 객체
	System.out.println("excelCon : " + hrDate);

//	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
	EmployeeVO emp = hrService.getEmp(eno);
	String fileName =  emp.getName()+"_";// 파일 이름

	HrVO hr = new HrVO();
	hr.setEno(emp.getEno());
	hr.setHrDate(hrDate);
	List<Map<String, Object>> weekCalc = hrService.getWeekCalc(hr);
	System.out.println("list : " + weekCalc);

	String name = emp.getName();
	String ppsname = emp.getPpsname();

//	Date day = new Date();
//	SimpleDateFormat format = new SimpleDateFormat("yyyy_MM");
//	String today = format.format(day); // 오늘 날짜 생성

	String[] split = hrDate.split("-");

	String titleDate = split[0] +"_" +split[1];

	Context context = new Context();
	//주차 반복
	List<HrVO> hrVoList = null;
	List<String> weekDates = new ArrayList<String>();
	if(weekCalc != null) for(int i = 0; i < weekCalc.size(); i++) {
		String getDate = (String)weekCalc.get(i).get("WEEKSTART");
		hrVoList = hrService.getWeekTable(emp.getEno(), getDate);
		weekDates.add(hrVoList.get(0).getWeekDate());
		System.out.println(hrVoList);



		context.putVar("week"+i, hrVoList);
	}

	String tempDate = weekDates.get(0);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date parseDate = sdf.parse(tempDate);

	List<Date> dateList = new ArrayList<Date>();
	dateList.add(parseDate);

	Calendar cal = Calendar.getInstance();
	cal.setTime(parseDate);

	for(int i = 0; i < (hrVoList.size() * 5)-1; i++) {
		cal.add(Calendar.DATE, 1);
		Date time = cal.getTime();
		dateList.add(time);
	}

	ClassPathResource classPathResource = new ClassPathResource("kr/or/warehouse/templates/excel/hrCard.xls");

	try (InputStream is = new BufferedInputStream(classPathResource.getInputStream())){
		response.setHeader("Content-Disposition","attachment; filename=" + URLEncoder.encode(fileName, "UTF-8") + titleDate +".xlsx");
		OutputStream os = response.getOutputStream();

		context.putVar("weekCalc", weekCalc);
		context.putVar("name", name);
		context.putVar("ppsname", ppsname);
		context.putVar("today", titleDate);
		context.putVar("nani", tempDate);
		context.putVar("dateList", dateList);

		JxlsHelper.getInstance().processTemplate(is, os, context);
		os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "ehr/main";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		HrTypeVO hrType = null;
		EmployeeVO employee = null;

		hrType = hrService.getHrType(eno);
		employee = hrService.getEmp(eno);

		//주차 구하기
		Calendar calendar = Calendar.getInstance();
		Date today = new Date();
		String format3 = format.format(today);
		String[] dates = format3.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		calendar.set(year, month - 1, day);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		int weekInt = calendar.get(Calendar.WEEK_OF_MONTH);

		mnv.addObject("hrType", hrType);
		mnv.addObject("weekInt", weekInt);
		mnv.addObject("standardDate", new Date());
		mnv.addObject("employee", employee);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/vacation")
	public ModelAndView vacation(ModelAndView mnv, HttpServletRequest request, HttpSession session) throws Exception {
		String url = "/ehr/vacation";

		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		EmployeeVO employee = hrService.getEmp(eno);

		VacationVO vacation = null;
		vacation = hrService.getVacation(eno);

		List<Map<String, Date>> vacationPeriod = hrService.selectVacationPeriod(eno);


		mnv.addObject("employee", employee);
		mnv.addObject("vacation", vacation);
		mnv.addObject("vacationPeriod", vacationPeriod);
		mnv.setViewName(url);

		return mnv;
	}
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat format2 = new SimpleDateFormat("yyyy.M.d");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//csv파일을 읽어서 DB에 저장
	@RequestMapping("/hrLogToDataBase")
	public String hrLogToDataBase(String mCode, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/ehr/teamList.do?mCode="+mCode;

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


		rttr.addFlashAttribute("from", "hrLogToDataBase");
		return url;
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

//				temp.setOnTimeStr("결근");
//				temp.setOffTimeStr("-");
				hrService.writeAbsent(absentHr);
			}
		}

	}

	@RequestMapping("/teamVacationList")
	public ModelAndView teamVacationList(ModelAndView mnv, Criteria cri, HttpSession session)throws Exception {
		String url="ehr/teamVacationList";


		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Map<String, Object> dataMap = hrService.getTeamVacList(cri, loginUser.getDno());

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;

	}

	@RequestMapping("/teamHrList")
	public ModelAndView teamHrList(Criteria cri, @RequestParam(defaultValue = "") String condition, ModelAndView mnv, HttpSession session)throws Exception {
		String url="ehr/teamHrList";

		System.out.println("condition : " + condition);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		Map<String, Object> dataMap = hrService.getSelectTeamHrList(cri, loginUser.getDno(), condition);

		Map<String, Integer> countMap = new HashMap<String, Integer>();
		int workingCount = hrService.selectTeamHrListCount(loginUser.getDno(), "업무중");
		int workoffCount = hrService.selectTeamHrListCount(loginUser.getDno(), "업무종료");
		int outCount = hrService.selectTeamHrListCount(loginUser.getDno(), "자리비움");

		int allCount = hrService.selectTeamHrListAllCount(loginUser.getDno());

		System.out.println("여기 : "+ workingCount + workoffCount + outCount);
		countMap.put("workingCount", workingCount);
		countMap.put("workoffCount", workoffCount);
		countMap.put("outCount", outCount);

		mnv.addObject("dataMap", dataMap);
		mnv.addObject("countMap", countMap);
		mnv.addObject("condition", condition);
		mnv.addObject("allCount", allCount);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/teamHrDetail")
	public ModelAndView teamHrCard(ModelAndView mnv, int eno)throws Exception {
		String url="ehr/teamHrCard";

		EmployeeVO hrDetail = hrService.getEmp(eno);
		mnv.addObject("hrDetail",hrDetail);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/hrModifyForm")
	public ModelAndView hrModifyForm(int eno, ModelAndView mnv)throws Exception{
		String url="ehr/teamHrCardModify";

		EmployeeVO hrDetail = hrService.getEmp(eno);

		mnv.addObject("hrDetail",hrDetail);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value="/hrModify",method=RequestMethod.POST)
	public String hrModify(EmployeeVO employee,HttpServletRequest request, RedirectAttributes rttr) throws Exception{

		System.out.println("hrmodify con : " + employee);
		String url = "redirect:/ehr/teamHrDetail.do";


		hrService.modifyHr(employee);

		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("eno",employee.getEno());

		return url;
	}

	@RequestMapping("/test")
	public void test() {}

	@RequestMapping("/hrCard")
	public ModelAndView hrCard(ModelAndView mnv,  HttpServletRequest request) throws Exception{
		String url = "ehr/hrCard";

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		EmployeeVO emp = hrService.getEmp(eno);
		List<PostPositionVO> postPostionList = hrService.getPostPositionList();

		mnv.addObject("emp", emp);
		mnv.addObject("postPostionList", postPostionList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/hrTypeModifyForm")
	public String hrTypeModifyForm() {
		String url = "ehr/hrTypeModifyForm";

		return url;
	}

	@RequestMapping("/hrTimeModifyForm")
	public ModelAndView hrTimeModifyForm(String hrcode,ModelAndView mnv)throws Exception {
		String url = "ehr/hrTimeModifyForm";

		System.out.println("hrcode : " + hrcode);
		HrVO hrTime = hrService.getHrTime(hrcode);
		if(hrTime != null) {
			Date onTime = hrTime.getOnTime();
			Date offTime = hrTime.getOffTime();

			String onTimeStr = sdf.format(onTime);
			String offTimeStr = sdf.format(offTime);

			String[] onSplit = onTimeStr.split(" ");
			String[] offSplit = offTimeStr.split(" ");

			mnv.addObject("hrTime", hrTime);
			mnv.addObject("onDate", onSplit[0]);
			mnv.addObject("onTime", onSplit[1]);
			mnv.addObject("offDate", offSplit[0]);
			mnv.addObject("offTime", offSplit[1]);
		}

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/hrTypeModify")
	public String hrTypeRegist(HrTypeVO hrType, String weekTimeStr, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/ehr/hrTypeModifyForm";
		System.out.println("hrType : "+hrType);
		System.out.println("weekTime : "+weekTimeStr);
		hrType.setWeekTime(Integer.parseInt(weekTimeStr.replace("시간", "")));
		hrService.modifyHrType(hrType);
		rttr.addFlashAttribute("from","modifyHrType");
		return url;
	}

	@RequestMapping("/teamList")
	public ModelAndView teamList(ModelAndView mnv, Criteria cri, HttpSession session, @RequestParam(defaultValue = "") String weekStart) throws Exception{
		String url="ehr/teamList";

		if("".equals(weekStart)) {
			Date today = new Date();
			weekStart = format.format(today);
		}
		System.out.println("dddddd : "+weekStart);
		Map<String, String> weekDate = hrService.getWeekDate(weekStart);
		weekStart = weekDate.get("WEEKSTART");
		String weekEnd = weekDate.get("WEEKEND");
		System.out.println(weekStart + weekEnd);

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Map<String, Object> dataMap = hrService.getTeamList(cri, loginUser.getDno(), weekStart);
		System.out.println(dataMap);

		mnv.addObject("dataMap", dataMap);
		mnv.addObject("weekStart", weekStart);
		mnv.addObject("weekEnd", weekEnd);
		mnv.setViewName(url);
		return mnv;
	}


	@RequestMapping("/empdetail")
	public ModelAndView emphrdetail(int eno, ModelAndView mnv, HttpSession session) throws Exception {
		String url = "ehr/emphrdetail";

//		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
//		int eno = loginUser.getEno();

		HrTypeVO hrType = null;
		EmployeeVO employee = null;

		hrType = hrService.getHrType(eno);
		employee = hrService.getEmp(eno);

		//주차 구하기
		Calendar calendar = Calendar.getInstance();
		Date today = new Date();
		String format3 = format.format(today);
		String[] dates = format3.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		calendar.set(year, month - 1, day);
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		int weekInt = calendar.get(Calendar.WEEK_OF_MONTH);

		mnv.addObject("hrType", hrType);
		mnv.addObject("weekInt", weekInt);
		mnv.addObject("standardDate", new Date());
		mnv.addObject("employee", employee);
		mnv.setViewName(url);

		return mnv;
	}

}
