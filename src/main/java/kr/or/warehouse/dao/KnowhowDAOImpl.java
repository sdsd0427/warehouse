package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.rowset.internal.Row;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkVO;

@Repository
public class KnowhowDAOImpl implements KnowhowDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<WorkVO> selectRecommendWorkList(Criteria cri ,String wcode,RowBounds rowBounds) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("keyword", cri.getKeyword());

		return session.selectList("Knowhow-Mapper.selectRecommendWorkList",param,rowBounds);
	}

	@Override
	public int selectRecommendWorkListCount(Criteria cri, String wcode) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("keyword", cri.getKeyword());
		return session.selectOne("Knowhow-Mapper.selectRecommendWorkListCount",param);
	}

	@Override
	public List<WorkManagerVO> selectWorkManagerList(String wcode) throws SQLException {
		return session.selectList("Knowhow-Mapper.selectWorkManagerList", wcode);
	}

	@Override
	public EmployeeVO selectWorkRequestBy(String wcode) throws SQLException {
		return session.selectOne("Knowhow-Mapper.selectWorkRequestBy", wcode);
	}

	@Override
	public List<WorkVO> selectPopularEmpWorkList(int eno) throws SQLException {
		return session.selectList("Knowhow-Mapper.selectPopularEmpWorkList",eno);
	}

	@Override
	public List<WorkVO> selectMyWorkList(int eno) throws SQLException {
		return session.selectList("Knowhow-Mapper.selectMyWorkList",eno);
	}

	@Override
	public List<WorkVO> selectAllKnowHow(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Knowhow-Mapper.selectAllKnowHow", cri, rowBounds);
	}

	@Override
	public int selectAllKnowHowTotalCount(Criteria cri) throws SQLException {
		return session.selectOne("Knowhow-Mapper.selectAllKnowHowTotalCount", cri);
	}

	@Override
	public List<String> selectMyHashTagList(int eno) throws SQLException {
		return session.selectList("Knowhow-Mapper.selectMyHashTagList", eno);
	}

	@Override
	public void insertFavKnowhow(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);

		session.insert("Knowhow-Mapper.insertFavKnowhow", param);
	}

	@Override
	public int favKnowhowCheck(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);
		return session.selectOne("Knowhow-Mapper.favKnowhowCheck", param);
	}

	@Override
	public List<WorkVO> selectFavKnowhowList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Knowhow-Mapper.selectFavKnowhowList", eno, rowBounds);
	}

	@Override
	public int selectFavKnowhowTotalCount(int eno) throws SQLException {
		return session.selectOne("Knowhow-Mapper.selectFavKnowhowTotalCount", eno);
	}

	@Override
	public void deleteFavKnowhow(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);

		session.insert("Knowhow-Mapper.deleteFavKnowhow", param);
	}

}
