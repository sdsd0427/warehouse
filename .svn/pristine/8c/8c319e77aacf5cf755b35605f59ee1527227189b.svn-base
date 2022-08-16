package kr.or.warehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.CommonVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.SignalVO;

@Repository("signalDAO")
public class SignalDAOImpl implements SignalDAO {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SignalDAOImpl.class);

	@Autowired
	private SqlSession session;
	
	@Override
	public List<SignalVO> selectSignalList(Map<String, Object> paramMap, RowBounds rowBounds) throws Exception {
		return session.selectList("Signal-Mapper.selectSignalList", paramMap, rowBounds);
	}
	
	@Override
	public int selectSignalListCount(Map<String, Object> paramMap) throws Exception {
		return session.selectOne("Signal-Mapper.selectSignalListCount",paramMap);
	}
	@Override
	public int selectSignalCountByEno(int eno) throws Exception {
		return session.selectOne("Signal-Mapper.selectSignalCountByEno",eno);
	}
	@Override
	public CommonVO selectCommon(String classCode) throws Exception {
		return session.selectOne("Signal-Mapper.selectCommon",classCode);
	}

	@Override
	public void updateSignalCheck(String signalNo) throws Exception {
		session.update("Signal-Mapper.updateSignalCheck",signalNo);
	}

	@Override
	public void insertSignal(SignalVO signal) throws Exception {
		session.update("Signal-Mapper.insertSignal",signal);
	}

	@Override
	public SignalVO selectSignalBySignalNo(String signalNo) throws Exception {
		return session.selectOne("Signal-Mapper.selectSignalBySignalNo",signalNo);
	}

	@Override
	public String selectSignalSeqNext() throws Exception {
		return session.selectOne("Signal-Mapper.selectSignalSeqNext");
	}

	@Override
	public void deleteSignalBySignalNo(String signalNo) throws Exception {
		session.update("Signal-Mapper.deleteSignalBySignalNo", signalNo);
	}


//	@Override
//	public EmployeeVO selectEmpForFrom(int eno) throws Exception {
//		return session.selectOne("Signal-Mapper.selectEmpForFrom",eno);
//	}

}
