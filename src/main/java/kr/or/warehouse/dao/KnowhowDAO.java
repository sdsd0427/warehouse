package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkVO;

public interface KnowhowDAO {

	public List<WorkVO> selectRecommendWorkList(Criteria cri ,String wcode, RowBounds rowBounds) throws SQLException;

	public int selectRecommendWorkListCount(Criteria cri,String wcode) throws SQLException;

	public EmployeeVO selectWorkRequestBy(String wcode) throws SQLException;
	public List<WorkManagerVO> selectWorkManagerList(String wcode) throws SQLException;

	public List<WorkVO> selectPopularEmpWorkList(int eno) throws SQLException;

	public List<WorkVO> selectMyWorkList(int eno) throws SQLException;

	//전체노하우
	public List<WorkVO> selectAllKnowHow(Criteria cri) throws SQLException;
	public int selectAllKnowHowTotalCount(Criteria cri) throws SQLException;

	//해시태그 목록
	public List<String> selectMyHashTagList(int eno) throws SQLException;

	//관심노하우 추가
	public void insertFavKnowhow(String wcode, int eno) throws SQLException;

	//관심노하우 삭제
	public void deleteFavKnowhow(String wcode, int eno) throws SQLException;

	//즐겨찾기 체크
	public int favKnowhowCheck(String wcode, int eno) throws SQLException;

	//즐겨찾기 목록
	public List<WorkVO> selectFavKnowhowList(int eno, Criteria cri) throws SQLException;
	public int selectFavKnowhowTotalCount(int eno) throws SQLException;

}
