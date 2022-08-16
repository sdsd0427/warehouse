package kr.or.warehouse.service;

import java.sql.SQLException;import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.ManualAttachDAO;
import kr.or.warehouse.dao.ManualDAO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.ManualVO;

@Service
public class ManualServiceImpl implements ManualService {

	@Autowired
	private ManualDAO manualDAO;

	@Autowired
	private ManualAttachDAO manualAttachDAO;

	@Override
	public Map<String, Object> getManualList(Criteria cri, int eno) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<ManualVO> manualList = manualDAO.selectManualCriteria(cri, rowBounds);
		for(ManualVO manual : manualList) {
			String name = manualDAO.selectName(manual.getManualNo());
			String title = manualDAO.selectCategory(manual.getManualNo());
			
			manual.seteNo(eno);
			int favCount  =manualDAO.selectCheckFav(manual);
			manual.setName(name);
			manual.setTitle(title);
			manual.setFavCount(favCount);
		}


		if (manualList != null)
			for (ManualVO manual : manualList)
				addManualAttachList(manual);

		int totalCount = manualDAO.selectManualCriteriaTotalCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("manualList", manualList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getViewManualList(Criteria cri,int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<ManualVO> viewManualList = manualDAO.selectViewManualCriteria(cri, rowBounds);
		for(ManualVO manual : viewManualList) {
			String name = manualDAO.selectName(manual.getManualNo());
			String title = manualDAO.selectCategory(manual.getManualNo());
			manual.seteNo(eno);
			int favCount  =manualDAO.selectCheckFav(manual);
			manual.setName(name);
			manual.setTitle(title);
			manual.setFavCount(favCount);
		}

		if (viewManualList != null)
			for (ManualVO manual : viewManualList)
				addManualAttachList(manual);


		// 전체 board 개수
		int totalCount = manualDAO.selectManualCriteriaTotalCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("viewManualList", viewManualList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public ManualVO getManual(String manualNo) throws SQLException {
		ManualVO manual = manualDAO.selectManualByManualNo(manualNo);
		String name = manualDAO.selectName(manual.getManualNo());
		manual.setName(name);
		addManualAttachList(manual);
		manualDAO.increaseViewCnt(manualNo);
		return manual;
	}

	@Override
	public ManualVO getManualForModify(String manualNo) throws SQLException {
		ManualVO manual = manualDAO.selectManualByManualNo(manualNo);
		String name = manualDAO.selectName(manual.getManualNo());
		manual.setName(name);
		addManualAttachList(manual);
		return manual;
	}

	@Override
	public void regist(ManualVO manual) throws SQLException {
		String manualNo = manualDAO.selectManualNo();
		manual.setManualNo(manualNo);
		manualDAO.insertManual(manual);

		if (manual.getAttachList() != null)
			for (AttachVO attach : manual.getAttachList()) {
				String attachNo = manualAttachDAO.selectMaNo();
				attach.setAttachNo(attachNo);
				attach.setRefNo(manualNo);
				attach.setEno(manual.geteNo());
				manualAttachDAO.insertManualAttach(attach);
			}
	}

	@Override
	public void modify(ManualVO manual) throws SQLException {
		System.out.println(manual);

		if (manual.getAttachList() != null)
			for (AttachVO attach : manual.getAttachList()) {
				String attachNo = manualAttachDAO.selectMaNo();
				attach.setRefNo(manual.getManualNo());
				attach.setEno(manual.geteNo());
				attach.setAttachNo(attachNo);
				manualAttachDAO.insertManualAttach(attach);
			}
		manualDAO.updateManual(manual);
	}

	@Override
	public void remove(String manualNo) throws SQLException {
		manualDAO.deleteManual(manualNo);
	}

	@Override
	public void favRegist(ManualVO manual) throws SQLException {
		manualDAO.insertFavManual(manual);
	}

	@Override
	public void favRemove(ManualVO manual) throws SQLException {
		manualDAO.deleteFavManual(manual);
	}

	@Override
	public Map<String, Object> getFavManualList(Criteria cri,int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<ManualVO> favManualList = manualDAO.selectSearchFAVManualList(cri,eno, rowBounds);
		for(ManualVO manual : favManualList) {
			String name = manualDAO.selectName(manual.getManualNo());
			String title = manualDAO.selectCategory(manual.getManualNo());
			manual.setName(name);
			manual.setTitle(title);
		}

		if (favManualList != null)
			for (ManualVO manual : favManualList)
				addManualAttachList(manual);

		// 전체 board 개수
		int totalCount = manualDAO.selectFavManualCriteriaTotalCount(cri,eno);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("favManualList", favManualList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public AttachVO getManualAttachByMaNo(String AttachNo) throws SQLException {
		return manualAttachDAO.selectManualAttachByMaNo(AttachNo);
	}

	@Override
	public void removeManualAttachByMaNo(String maNo) throws SQLException {
		manualAttachDAO.deleteManualAttach(maNo);
	}

	@Override
	public void addManualAttachList(ManualVO manual) throws SQLException {

		if (manual == null)
			return;

		String manualNo = manual.getManualNo();
		List<AttachVO> attachList = manualAttachDAO.selectManualAttachesByManualNo(manualNo);

		manual.setAttachList(attachList);
	}


}
