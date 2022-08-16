package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.MtoVO;

public interface MailService {

	// 받은메일함 목록 조회
	Map<String, Object> getMailList(Criteria cri, int eno) throws SQLException;

	// 보낸메일함 목록 조회
	Map<String, Object> getSendMailList(Criteria cri, int eno) throws SQLException;

	// 중요메일함 목록 조회
	Map<String, Object> getImporMailList(Criteria cri, int eno) throws SQLException;

	// 휴지통 목록 조회
	Map<String, Object> getTrashMailList(Criteria cri, int eno) throws SQLException;

	// 내게쓴메일함 목록 조회
	Map<String, Object> getToMeMailList(Criteria cri, int eno) throws SQLException;

	// 임시메일함 목록 조회
	Map<String, Object> getTempMailList(Criteria cri, int eno) throws SQLException;

	// 메일 전송
	void regist(MailVO mail, List<Integer> receiver) throws SQLException;
	
	// 메일 상세보기
	MailVO getMail(String mailNo) throws SQLException;
	
	// 메일 임시저장
	void registTemp(MailVO mail, List<Integer> receiver) throws SQLException;
	
	// mail 중요 등록
	void imporUpdate(MailVO mail) throws SQLException;
	
	// mail 중요 해제
	void imporCancelUpdate(MailVO mail) throws SQLException;
	
	// mto 중요 등록
	void imporMtoUpdate(MtoVO mto) throws SQLException;
	
	// mto 중요 해제
	void imporMtoCancelUpdate(MtoVO mto) throws SQLException;
	
	// 메일 휴지통 이동
	void trashUpdate(MailVO mail) throws SQLException;
	
	// 메일 휴지통 복원
	void trashRevertUpdate(MailVO mail) throws SQLException;
	
	// 받은메일 휴지통 영구 삭제
	void trashMtoDelUpdate(MtoVO mto) throws SQLException;
	
	// 보낸메일 휴지통 영구 삭제
	void trashMFromDelUpdate(MailVO mail) throws SQLException;
	
	// 읽은 메일 카운트
	void mailMtoCheck(MailVO mail) throws SQLException;

	// 보낸메일 읽음 처리 (상단 버튼)
	void updateMailMtoCheckByChecked(MtoVO mto) throws SQLException;
	
	// 첨부파일 조회
	AttachVO getMailAttachByMaNo(String maNo) throws SQLException;

	// 첨부파일 삭제
	void removeMailAttachByMaNo(String maNo) throws SQLException;
	void addMailAttachList(MailVO mail) throws SQLException;
	
	int selectNoReadMailListCount(int eno) throws SQLException;
	
}
