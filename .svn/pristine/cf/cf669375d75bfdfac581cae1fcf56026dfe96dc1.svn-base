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
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;
import kr.or.warehouse.dto.WorkVO;

@Repository
public class ApprovalDocBoxDAOImpl implements ApprovalDocBoxDAO{

	@Autowired
	private SqlSession session;
	
	//문서양식
	@Override
	public List<SignFormVO> selectSignForm() throws SQLException {
		return session.selectList("ApprovalDocBox-Mapper.selectSignForm");
	}
	
	
	//전사문서함 리스트
	@Override
	public List<SignDocVO> selectSearchApprovalList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("ApprovalDocBox-Mapper.selectSearchApprovalList", paramMap, rowBounds);
	}

	//관심문서 리스트
	@Override
	public List<SignDocVO> selectFavDocList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("ApprovalDocBox-Mapper.selectFavDocList", eno, rowBounds);
	}


	@Override
	public int selectFavDocTotalCount(int eno) throws SQLException {
		return session.selectOne("ApprovalDocBox-Mapper.selectFavDocTotalCount", eno);
	}
	
	
	
	
	//관심문서
	@Override
	public void insertFavDoc(String signNo, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("signNo", signNo);
		param.put("eno", eno);
		session.insert("ApprovalDocBox-Mapper.insertFavDoc",param);
	}


	@Override
	public void deleteFavDoc(String signNo, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("signNo", signNo);
		param.put("eno", eno);
		session.insert("ApprovalDocBox-Mapper.deleteFavDoc",param);
	}


	@Override
	public List<SignDocVO> selectSearchFAVDocList(Criteria cri, int eno, RowBounds rowBounds) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("ApprovalDocBox-Mapper.selectSearchFAVDocList", param, rowBounds);
	}


	@Override
	public String selectName(String signNo) throws SQLException {
		return session.selectOne("ApprovalDocBox-Mapper.selectName", signNo);
	}


	@Override
	public int selectDocCriteriaTotalCount(Criteria cri) throws SQLException {
		return session.selectOne("ApprovalDocBox-Mapper.selectSearchApprovalListCount", cri);
	}
	
	
	@Override
	public int selectFavDocCriteriaTotalCount(Criteria cri, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());

		return session.selectOne("ApprovalDocBox-Mapper.selectFavDocCriteriaTotalCount", param);
	}


	//즐겨찾기 체크
	@Override
	public int favDocCheck(String signNo, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("signNo", signNo);
		param.put("eno", eno);
		return session.selectOne("ApprovalDocBox-Mapper.favDocCheck", param);
	}


	@Override
	public List<String> selectMyDocHashTagList(int eno) throws SQLException {
		return session.selectList("ApprovalDocBox-Mapper.selectMyDocHashTagList", eno);
	}

	
	//전사문서함 저장
	@Override
	public void insertAprovalBox(List<SignDocVO> signNo) throws SQLException {
		session.update("ApprovalDocBox-Mapper.insertAprovalBox",signNo);
	}
		
	//상태가 5, 공개가 1 인 전사문서함 정보	
	@Override
	public List<SignDocVO> selectSignDocInfo() throws SQLException {
		return session.selectList("ApprovalDocBox-Mapper.selectSignDocInfo");
	}


	//count
	@Override
	public int selectSearchApprovalListCount(String sFormNo) throws SQLException {
		return session.selectOne("ApprovalDocBox-Mapper.selectSearchApprovalListCount",sFormNo);

	}

	







	

	

	
}
