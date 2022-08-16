package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ManualVO;

public interface ManualDAO {

	// 이름 작성자 검색
	String selectName(String manualNo) throws SQLException;
	String selectCategory(String manualNo) throws SQLException;

	// manual 리스트 검색
	List<ManualVO> selectManualCriteria(Criteria cri, RowBounds rowBounds) throws SQLException;

	// manual count
	int selectManualCriteriaTotalCount( Criteria cri) throws SQLException;

	// manual 단일 검색
	ManualVO selectManualByManualNo ( String manualNo) throws SQLException;

	// manual 조회수순 리스트 검색
	List<ManualVO> selectViewManualCriteria(Criteria cri, RowBounds rowBounds) throws SQLException;

	// manual 등록
	void insertManual( ManualVO manual) throws SQLException;

	// manual 수정
	void updateManual( ManualVO manual) throws SQLException;

	// manual 삭제
	void deleteManual(String manualNo) throws SQLException;

	// 조회수 증가
	void increaseViewCnt(String manualNo) throws SQLException;

	// 메뉴얼 기본키 생성
	String selectManualNo() throws SQLException;

	// favManual 리스트 검색
	List<ManualVO> selectSearchFAVManualList(Criteria cri,int eno, RowBounds rowBounds) throws SQLException;

	// favcheck
	int selectCheckFav(ManualVO manual) throws SQLException;

	// favmanual count
	int selectFavManualCriteriaTotalCount( Criteria cri,int eno) throws SQLException;

	// 관심 manual 등록
	void insertFavManual( ManualVO manual) throws SQLException;

	// 관심 manual 삭제
	void deleteFavManual( ManualVO manual) throws SQLException;

}
