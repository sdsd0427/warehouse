package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.KnowhowDAO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkVO;

@Service
public class KnowhowServiceImpl implements KnowhowService{

	@Autowired
	private KnowhowDAO knowhowDAO;


	private List<WorkVO> setWorkInfo(List<WorkVO> workList, int eno) throws SQLException{
		for(WorkVO work : workList) {
			//업무 담당자, 요청자 정보 가져오기
			String wcode = work.getWcode();
			List<WorkManagerVO> workManagerList = knowhowDAO.selectWorkManagerList(wcode);
			EmployeeVO requestBy = knowhowDAO.selectWorkRequestBy(wcode);
			work.setRequestBy(requestBy);
			work.setWorkManagerList(workManagerList);
			work.setManagerCnt(workManagerList.size() - 1);
			setDday(work);
			int check = knowhowDAO.favKnowhowCheck(work.getWcode(), eno);
			if(check > 0) {
				work.setFavCheck(1);
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




	@Override
	public Map<String, Object> getRecommendWorkList(Criteria cri, String wcode, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<WorkVO> recommendWorkList = knowhowDAO.selectRecommendWorkList(cri, wcode, rowBounds);
		recommendWorkList = setWorkInfo(recommendWorkList,eno);


		// 전체 board 개수
		int totalCount = knowhowDAO.selectRecommendWorkListCount(cri, wcode);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("knowhowList", recommendWorkList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<WorkVO> getPopularEmpWorkList(int eno) throws SQLException {


		List<WorkVO> popularEmpWorkList = knowhowDAO.selectPopularEmpWorkList(eno);
		popularEmpWorkList = setWorkInfo(popularEmpWorkList,eno);



		return popularEmpWorkList;
	}

	@Override
	public List<WorkVO> getMyWorkList(int eno) throws SQLException {
		List<WorkVO> myWorkList = knowhowDAO.selectMyWorkList(eno);
		return myWorkList;
	}

	@Override
	public Map<String, Object> getAllKnowHowList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<WorkVO> allKnowHow = knowhowDAO.selectAllKnowHow(cri);
		allKnowHow = setWorkInfo(allKnowHow,eno);

		int totalCount = knowhowDAO.selectAllKnowHowTotalCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("knowhowList", allKnowHow);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<String> getMyWorkHashTagList(int eno) throws SQLException {
		List<String> hashTagList = null;
		hashTagList = knowhowDAO.selectMyHashTagList(eno);
		return hashTagList;
	}

	@Override
	public void addFavKnowhow(String wcode, int eno) throws SQLException {
		knowhowDAO.insertFavKnowhow(wcode, eno);
	}

	@Override
	public Map<String, Object> getFavKnowhowList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<WorkVO> favKnowhowList = knowhowDAO.selectFavKnowhowList(eno, cri);
		favKnowhowList = setWorkInfo(favKnowhowList, eno);

		int totalCount = knowhowDAO.selectFavKnowhowTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("favKnowhowList", favKnowhowList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void removeFavKnowhow(String wcode, int eno) throws SQLException {
		knowhowDAO.deleteFavKnowhow(wcode, eno);
	}

}
