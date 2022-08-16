package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.WorkVO;

public interface KnowhowService {

	Map<String,Object> getRecommendWorkList(Criteria cri, String wcode, int eno)throws SQLException;

	List<WorkVO> getPopularEmpWorkList(int eno)throws SQLException;

	List<WorkVO> getMyWorkList(int eno) throws SQLException;

	//전체 노하우 목록
	Map<String,Object> getAllKnowHowList(Criteria cri, int eno) throws SQLException;
	//내 업무 해시태그 목록
	List<String> getMyWorkHashTagList(int eno) throws SQLException;

	//노하우 즐겨찾기 추가
	void addFavKnowhow(String wcode, int eno) throws SQLException;
	//관심 노하우 삭제
	void removeFavKnowhow(String wcode, int eno) throws SQLException;

	//노하우 즐겨찾기 목록
	Map<String,Object> getFavKnowhowList(Criteria cri, int eno) throws SQLException;

}
