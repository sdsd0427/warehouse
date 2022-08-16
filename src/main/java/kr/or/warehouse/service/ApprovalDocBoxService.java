package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.SignDocVO;

public interface ApprovalDocBoxService {

	//문서양식
	Map<String,Object>getSignForm()throws SQLException;
	
	//전사문서함 리스트
	Map<String,Object> getApprovalList(Criteria cri, String sFormNo,int eno)throws SQLException;
	
	//관심문서 목록
	Map<String,Object> getFavDocList(Criteria cri, int eno) throws SQLException;

	// 관심 등록
	void favRegist(String signNo, int eno) throws SQLException;

	// 관심 삭제
	void favRemove(String signNo, int eno) throws SQLException;
	
	//내 업무 해시태그 목록
	List<String> getMyDocHashTagList(int eno) throws SQLException;
	//List<String> getMyDocHashTagList(Map<String, Object> paramMap) throws SQLException;
	
	//전사문서함 저장
	void registApprovalDocBox(List<SignDocVO> signDoc)throws SQLException;
	
	//조회수

}
