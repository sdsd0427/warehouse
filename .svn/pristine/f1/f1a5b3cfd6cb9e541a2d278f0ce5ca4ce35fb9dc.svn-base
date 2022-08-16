package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.dao.HomeDAO;
import kr.or.warehouse.dao.WorkDAO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.WorkVO;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDAO homeDAO;

	private List<WorkVO> setWorkInfo(List<WorkVO> workList) throws SQLException{
		for(WorkVO work : workList) {
			//업무 담당자, 요청자 정보 가져오기
			String manager = work.getManager().split(",")[0];
			String managerPhoto = work.getManagerPhoto().split(",")[0];
			work.setManagerCnt(work.getManager().split(",").length - 1);
			work.setManager(manager);
			work.setManagerPhoto(managerPhoto);
			setDday(work);


			//요청대기일자, 마감임박표시
			if(work.getWstatus().equals("대기")) {
				// regDate + 3 < today
				setOverDay(work);
			}

		}
		return workList;
	}

	private void setDday(WorkVO work) {
		Date endDate = work.getWend();
		Date today = new Date();
		if(endDate.after(today)) {
			long endTime = endDate.getTime();
			long todayTime = today.getTime();
			long dTime = endTime - todayTime;
			int dDay = (int)(dTime / (24 * 60 * 60 * 1000));
			work.setdDay(dDay);
		}
	}

	private void setOverDay(WorkVO work) {
		Date today = new Date();
		Date regDate = work.getWdate();
		Calendar cal = Calendar.getInstance();
		cal.setTime(regDate);
		cal.add(Calendar.DATE, 3);
		if(today.after(cal.getTime())) {
			long todayTime = today.getTime();
			long regTime = regDate.getTime();
			long overTime = todayTime - regTime;
			int overDay = (int)(overTime/(24 * 60 * 60 * 1000));
			work.setOverDay(overDay);
		}
	}

	@Override
	public List<WorkVO> waitMyWork(int eno) throws SQLException {
		List<WorkVO> waitMyWork = homeDAO.selectWaitMyWork(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO waitWork : waitMyWork) {
			if(workList.size() == 5) {
				break;
			}
			workList.add(waitWork);
		}
		workList = setWorkInfo(workList);

		return workList;
	}

	@Override
	public List<WorkVO> cooperReqWork(int eno) throws SQLException {
		List<WorkVO> cooperReqWorkList = homeDAO.selectCooperReqToMeList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO waitWork : cooperReqWorkList) {
			if(workList.size() == 5) {
				break;
			}
			workList.add(waitWork);
		}
		workList = setWorkInfo(workList);
		return workList;
	}

	@Override
	public List<WorkVO> proxyReqWork(int eno) throws SQLException {
		List<WorkVO> proxyReqWorkList = homeDAO.selectProxyReqToMeList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO waitWork : proxyReqWorkList) {
			if(workList.size() == 5) {
				break;
			}
			workList.add(waitWork);
		}
		workList = setWorkInfo(workList);
		return workList;
	}

	@Override
	public List<WorkVO> toReqCooperReqList(int eno) throws SQLException {
		List<WorkVO> toReqCooperReqList = homeDAO.selectToReqCooperReqList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO toReq : toReqCooperReqList) {
			if(workList.size() == 5) {
				break;
			}
			workList.add(toReq);
		}
		workList = setWorkInfo(workList);
		return workList;
	}

	@Override
	public List<WorkVO> toReqProxyReqList(int eno) throws SQLException {
		List<WorkVO> toReqProxyReqList = homeDAO.selectToReqProxyReqList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO toReq : toReqProxyReqList) {
			if(workList.size() == 5) {
				break;
			}
			workList.add(toReq);
		}
		workList = setWorkInfo(workList);
		return workList;
	}

	@Override
	public List<WorkVO> toReqObjectionList(int eno) throws SQLException {
		List<WorkVO> toReqObjectionList = homeDAO.selectToReqObjectionList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO toReq : toReqObjectionList) {
			if(workList.size() == 5) {
				break;
			}
			workList.add(toReq);
		}
		workList = setWorkInfo(workList);
		return workList;
	}

	@Override
	public List<WorkVO> getMentoWorkList(int eno) throws SQLException {
		List<WorkVO> mentoWorkList = homeDAO.selectMentoWorkList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO mentoWork : mentoWorkList) {
			if(workList.size() == 5) {
				break;
			}

			workList.add(mentoWork);
		}
		return workList;
	}

	@Override
	public List<WorkVO> getMenteeWorkList(int eno) throws SQLException {
		List<WorkVO> menteeWorkList = homeDAO.selectMenteeWorkList(eno);
		List<WorkVO> workList = new ArrayList<WorkVO>();

		for(WorkVO menteeWork : menteeWorkList) {
			if(workList.size() == 5) {
				break;
			}

			workList.add(menteeWork);
		}
		return workList;
	}

	@Override
	public List<SignDocVO> getMentoDraftDocList(int eno) throws SQLException {
		List<SignDocVO> mentoDraftDocList = homeDAO.selectMentoDraftDocList(eno);
		List<SignDocVO> docList = new ArrayList<SignDocVO>();

		for(SignDocVO doc : mentoDraftDocList) {
			if(docList.size() == 5) {
				break;
			}

			docList.add(doc);
		}

		return docList;
	}

	@Override
	public List<SignDocVO> getMenteeDraftDocList(int eno) throws SQLException {
		List<SignDocVO> menteeDraftDocList = homeDAO.selectMenteeDraftDocList(eno);
		List<SignDocVO> docList = new ArrayList<SignDocVO>();

		for(SignDocVO doc : menteeDraftDocList) {
			if(docList.size() == 5) {
				break;
			}

			docList.add(doc);
		}

		return docList;
	}


}
