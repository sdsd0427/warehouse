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
import kr.or.warehouse.dao.ApprovalDAO;
import kr.or.warehouse.dao.ApprovalDocBoxDAO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private ApprovalDAO approvalDAO;
	
	@Autowired
	private ApprovalDocBoxDAO approvalDocBoxDAO;
	
	@Override
	public Map<String, Object> getRequiredDocumentList(Criteria cri, String signNo,int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<SignDocVO> requiredDocumentList = approvalDAO.selectRequiredDocumentList(signNo, rowBounds);
		for(SignDocVO signDoc : requiredDocumentList) {
			String name = approvalDAO.selectName(signDoc.getSignNo());
			SignFormVO signForm = approvalDAO.selectSignForm(signDoc.getsFormNo());
			signDoc.setName(name);
			signDoc.setSignForm(signForm);
			
			int cnt = approvalDocBoxDAO.favDocCheck(signDoc.getSignNo(), eno);
			if(cnt > 0) {
				signDoc.setFavCheck(cnt);
			}
		}

	

		// 전체 board 개수
		int totalCount = approvalDAO.selectRequiredDocumentListCount(signNo);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("requiredDocumentList", requiredDocumentList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<SignDocVO> getPopularApprovalList(int eno) throws SQLException {
		
		List<SignDocVO> popularApprovalList = approvalDAO.selectPopularApprovalList(eno);
		for(SignDocVO signDoc : popularApprovalList) {
			String name = approvalDAO.selectName(signDoc.getSignNo());
			SignFormVO signForm = approvalDAO.selectSignForm(signDoc.getsFormNo());
			signDoc.setName(name);
			signDoc.setSignForm(signForm);
		}
		return popularApprovalList;
	}

	@Override
	public List<SignDocVO> getMyReturnSignDocList(int eno) throws SQLException {
		List<SignDocVO> myReturnSignDocList = approvalDAO.selectMyReturnSignDocList(eno);
		return myReturnSignDocList;
	}

}
