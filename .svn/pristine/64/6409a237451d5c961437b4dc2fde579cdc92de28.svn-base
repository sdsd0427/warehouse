package kr.or.warehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.HrDAO;
import kr.or.warehouse.dao.SignalDAO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.SignalVO;

@Service("signalService")
public class SignalServiceImpl implements SignalService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SignalServiceImpl.class);

	@Resource(name = "signalDAO")
	private SignalDAO signalDAO;
	
	@Resource(name = "hrDAO")
	private HrDAO hrDAO;
	
	//알림 리스트
	@Override
	public Map<String, Object> getSignalList(Criteria cri, int eno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SignalVO> signalList = null;
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("classInit", cri.getClassInit());
		paramMap.put("eno", eno);
		
		signalList = signalDAO.selectSignalList(paramMap, rowBounds);
		//발신자 정보 추가
//		if(signalList != null) for(SignalVO signal : signalList) {
//			signal.setFromEmp(hrDAO.selectEmp(signal.getSignalFrom()));
//			EmployeeVO fromEmp = signal.getFromEmp();
//			fromEmp.setPpsname(hrDAO.selectPpsByPpscode(fromEmp.getPpscode()).getPpsName());
//			signal.setCommonVo(signalDAO.selectCommon(signal.getClassCode()));
//		}
//		System.out.println("Ser_signalList : " +signalList);
		
		int totalCount = 0;
		totalCount = signalDAO.selectSignalListCount(paramMap);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("signalList", signalList);
		dataMap.put("pageMaker", pageMaker);
		System.out.println("Ser_dataMap : " +dataMap);
		
		return dataMap;
	}

	@Override
	public void read(String signalNo) throws Exception {
		signalDAO.updateSignalCheck(signalNo);
	}

	@Override
	public SignalVO send(SignalVO signal) throws Exception {
		String signalNO = signalDAO.selectSignalSeqNext();
		signal.setSignalNo(signalNO);
		signalDAO.insertSignal(signal);
		SignalVO result = signalDAO.selectSignalBySignalNo(signalNO);
//		result.setFromEmp(hrDAO.selectEmp(result.getSignalFrom()));
//		EmployeeVO fromEmp = result.getFromEmp();
//		fromEmp.setPpsname(hrDAO.selectPpsByPpscode(fromEmp.getPpscode()).getPpsName());
//		result.setCommonVo(signalDAO.selectCommon(result.getClassCode()));
		
		return result;
	}

	@Override
	public int countSignal(int eno) throws Exception {
		int count = signalDAO.selectSignalCountByEno(eno);
		return count;
	}

	@Override
	public void remove(String signalNo) throws Exception {
		signalDAO.deleteSignalBySignalNo(signalNo);
	}
	
	

}
