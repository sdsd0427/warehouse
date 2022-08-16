package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.ApprovalDocBoxDAO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkVO;

@Service
public class ApprovalDocBoxServiceImpl implements ApprovalDocBoxService{

	@Autowired
	private ApprovalDocBoxDAO approvalDocBoxDAO;
	
	
	//문서양식
	@Override
	public Map<String, Object> getSignForm() throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SignFormVO> mySignFormList = approvalDocBoxDAO.selectSignForm();

		dataMap.put("mySignFormList", mySignFormList);

		return dataMap;
	}
	
	
	//전사문서함 리스트
	@Override
	public Map<String, Object> getApprovalList(Criteria cri, String sFormNo,int eno) throws SQLException {
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("sFormNo", sFormNo);
		
		Map<String, Object>dataMap = new HashMap<String, Object>();
		List<SignDocVO> myApprovalList = approvalDocBoxDAO.selectSearchApprovalList(paramMap, rowBounds);

		int totalCount = approvalDocBoxDAO.selectSearchApprovalListCount(sFormNo);
		
		System.out.println("전사문서 카운트:"+totalCount);
		
		for(SignDocVO doc : myApprovalList) {
			int cnt = approvalDocBoxDAO.favDocCheck(doc.getSignNo(), eno);
			if(cnt > 0) {
				doc.setFavCheck(cnt);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myApprovalList", myApprovalList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	
	
	//관심문서
	@Override
	public void favRegist(String signNo, int eno) throws SQLException {
		approvalDocBoxDAO.insertFavDoc(signNo,eno);		

		
		
	}


	@Override
	public void favRemove(String signNo, int eno) throws SQLException {
		approvalDocBoxDAO.deleteFavDoc(signNo,eno);		
	}


	@Override
	public Map<String, Object> getFavDocList(Criteria cri, int eno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SignDocVO> favDocList = approvalDocBoxDAO.selectFavDocList(eno, cri);
		
		for(SignDocVO doc : favDocList) {
			int cnt = approvalDocBoxDAO.favDocCheck(doc.getSignNo(), eno);
			if(cnt > 0) {
				doc.setFavCheck(cnt);
			}
		}

		int totalCount = approvalDocBoxDAO.selectFavDocTotalCount(eno);
		System.out.println("관심문서:"+totalCount);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("favDocList", favDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

	}

	

	@Override
	public List<String> getMyDocHashTagList(int eno) throws SQLException {
		List<String> hashTagList = null;
		hashTagList = approvalDocBoxDAO.selectMyDocHashTagList(eno);
		return hashTagList;
	}


	//전사문서함 저장
	@Override
	public void registApprovalDocBox(List<SignDocVO> signNo) throws SQLException {
		
		 signNo =  approvalDocBoxDAO.selectSignDocInfo();
		 
		 approvalDocBoxDAO.insertAprovalBox(signNo);
		
	}

	

	
	

	
}
