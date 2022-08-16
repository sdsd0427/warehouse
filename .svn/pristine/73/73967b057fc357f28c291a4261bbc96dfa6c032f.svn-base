package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.ManualVO;

public interface ManualService {

	// 목록조회
	Map<String,Object> getManualList(Criteria cri, int eno)throws SQLException;
	Map<String,Object> getViewManualList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> getFavManualList(Criteria cri, int eno)throws SQLException;

	// 상세보기
	ManualVO getManual(String manualNo)throws SQLException;
	ManualVO getManualForModify(String manualNo)throws SQLException;

	// 메뉴얼 등록
	void regist(ManualVO manual)throws SQLException;

	// 메뉴얼 수정
	void modify(ManualVO manual)throws SQLException;

	// 메뉴얼 삭제
	void remove(String manualNo)throws SQLException;

	// 관심 등록
	void favRegist(ManualVO manual) throws SQLException;

	// 관심 삭제
	void favRemove(ManualVO manual) throws SQLException;



	//첨부파일 조회
	AttachVO getManualAttachByMaNo(String maNo)throws SQLException;

	//파일정보 삭제
	void removeManualAttachByMaNo(String maNo)throws SQLException;

	void addManualAttachList(ManualVO manual) throws SQLException;

}
