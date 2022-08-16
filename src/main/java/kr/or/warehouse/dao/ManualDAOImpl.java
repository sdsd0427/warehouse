package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ManualVO;

@Repository
public class ManualDAOImpl implements ManualDAO {

	@Autowired
	private SqlSession session;

	@Override
	public String selectName(String manualNo) throws SQLException {
		return session.selectOne("Manual-Mapper.selectName", manualNo);
	}

	@Override
	public String selectCategory(String manualNo) throws SQLException {
		return session.selectOne("Manual-Mapper.selectCategory", manualNo);
	}

	@Override
	public List<ManualVO> selectManualCriteria(Criteria cri, RowBounds rowBounds) throws SQLException {
		return session.selectList("Manual-Mapper.selectSearchManualList", cri, rowBounds);
	}

	@Override
	public int selectManualCriteriaTotalCount(Criteria cri) throws SQLException {
		return session.selectOne("Manual-Mapper.selectSearchManualListCount", cri);
	}

	@Override
	public ManualVO selectManualByManualNo(String manualNo) throws SQLException {
		return session.selectOne("Manual-Mapper.selectManualByManualNo", manualNo);
	}

	@Override
	public List<ManualVO> selectViewManualCriteria(Criteria cri, RowBounds rowBounds) throws SQLException {
		return session.selectList("Manual-Mapper.selectViewManualList", cri, rowBounds);
	}

	@Override
	public void insertManual(ManualVO manual) throws SQLException {
		session.update("Manual-Mapper.insertManual",manual);
	}

	@Override
	public void updateManual(ManualVO manual) throws SQLException {
		session.update("Manual-Mapper.updateManual",manual);

	}

	@Override
	public void deleteManual(String manualNo) throws SQLException {
		session.update("Manual-Mapper.deleteManual",manualNo);
	}

	@Override
	public void increaseViewCnt(String manualNo) throws SQLException {
		session.update("Manual-Mapper.increaseViewCnt",manualNo);
	}

	@Override
	public String selectManualNo() throws SQLException {
		return session.selectOne("Manual-Mapper.selectManualNo");
	}

	@Override
	public List<ManualVO> selectSearchFAVManualList(Criteria cri,int eno, RowBounds rowBounds) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("category", cri.getCategory());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Manual-Mapper.selectSearchFAVManualList", param, rowBounds);
	}

	@Override
	public int selectCheckFav(ManualVO manual) throws SQLException {
		return session.selectOne("Manual-Mapper.selectCheckFav", manual);
	}

	@Override
	public int selectFavManualCriteriaTotalCount(Criteria cri,int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("category", cri.getCategory());
		param.put("keyword", cri.getKeyword());

		return session.selectOne("Manual-Mapper.selectSearchFavManualListCount", param);
	}

	@Override
	public void insertFavManual(ManualVO manual) throws SQLException {
		session.update("Manual-Mapper.insertFavManual",manual);
	}

	@Override
	public void deleteFavManual(ManualVO manual) throws SQLException {
		session.update("Manual-Mapper.deleteFavManual",manual);
	}






}
