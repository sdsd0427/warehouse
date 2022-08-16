package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;
import kr.or.warehouse.dto.WorkVO;

public interface ApprovalDocBoxDAO {

	//문서 양식
	List<SignFormVO>selectSignForm()throws SQLException;
	
	//전사문서함 리스트
	List<SignDocVO>selectSearchApprovalList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;

	// 관심 문서 등록
	public void insertFavDoc(String signNo, int eno) throws SQLException;

	// 관심 문서 삭제
	public void deleteFavDoc(String signNo, int eno) throws SQLException;
	
	//즐겨찾기 목록
	public List<SignDocVO> selectFavDocList(int eno, Criteria cri) throws SQLException;
	public int selectFavDocTotalCount(int eno) throws SQLException;
	
	//즐겨찾기 체크
	public int favDocCheck(String signNo, int eno) throws SQLException;

	
	//해시태그 목록
	public List<String> selectMyDocHashTagList(int eno) throws SQLException;
	//public List<String> selectMyDocHashTagList(Map<String, Object> paramMap) throws SQLException;
	
	
	
	// fav문서 리스트 검색
	List<SignDocVO> selectSearchFAVDocList(Criteria cri,int eno, RowBounds rowBounds) throws SQLException;
	
	// 이름 작성자 검색
	String selectName(String signNo) throws SQLException;
	
	// favDoc count
	int selectFavDocCriteriaTotalCount(Criteria cri,int eno) throws SQLException;
	
	// manual count
	int selectDocCriteriaTotalCount( Criteria cri) throws SQLException;  //selectSearchApprovalListCount
	
	//전사문서함 저장
	void insertAprovalBox(List<SignDocVO> signNo)throws SQLException;


	// 상태가 5, 공개가 1
	public List<SignDocVO> selectSignDocInfo() throws SQLException;
	
	
	//count
	int selectSearchApprovalListCount(String sFormNo) throws SQLException;

	
	
}
