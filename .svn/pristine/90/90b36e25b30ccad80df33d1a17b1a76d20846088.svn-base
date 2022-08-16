package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.MtoVO;

public interface MailDAO {

	// 이름 검색
	String selectName(String mailNo) throws SQLException;

	// 이름으로 사번 찾기
	int selectEnoByName(String name) throws SQLException;

	// 사번으로 이름 찾기
	String selectNameByEno(int eno) throws SQLException;
	
	// mtoList 
	List<MtoVO> selectMtoList(String mailNo) throws SQLException;

	// 메일 기본키 생성
	String selectMailNo() throws SQLException;

	// 받은메일함 리스트
	List<MailVO> selectMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;
	
	// 받은메일함  count
	int selectMailListCount(Map<String, Object> paramMap) throws SQLException;

	// 받은메일함 안읽은메일 count
	int selectNoReadMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;
	
	// 보낸메일함 리스트
	List<MailVO> selectSendMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;

	// 보낸메일함 수신자 리스트
	List<MtoVO> selectReceiver(String mailNo) throws SQLException;

	// 보낸메일함 count
	int selectSendMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 중요메일함 리스트
	List<MailVO> selectImporMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;
	
	// 중요메일함 count
	int selectImporMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 중요메일함 안읽은메일 count
	int selectNoReadImporMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 휴지통 리스트
	List<MailVO> selectTrashMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;

	// 휴지통 count
	int selectTrashMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 내게쓴메일함 리스트
	List<MailVO> selectToMeMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;
	
	// 내게쓴메일함 count
	int selectToMeMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 내게쓴메일함 안읽은메일 count
	int selectNoReadToMeMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 임시메일함 리스트
	List<MailVO> selectTempMailList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;

	// 임시메일함 count
	int selectTempMailCriteriaTotalCount(Map<String, Object> paramMap) throws SQLException;

	// 메일 전송
	void insertMail(MailVO mail) throws SQLException;
	void insertMto(MtoVO mto) throws SQLException;

	// 메일 임시저장
	void insertTempMail(MailVO mail) throws SQLException;
	
	// mail 단일 검색
	MailVO selectMailByMailNo(String mailNo) throws SQLException;


	// mail 중요 등록
	public void updateMailImportant(MailVO mail) throws SQLException;

	// mail 중요 해제
	public void updateMailImportantCancel(MailVO mail) throws SQLException;
	
	// mto 중요 등록
	public void updateMtoImportant(MtoVO mto) throws SQLException;
	
	// mto 중요 해제
	public void updateMtoImportantCancel(MtoVO mto) throws SQLException;
	
	// 메일 휴지통 이동
	public void updateMailTrash(MailVO mail) throws SQLException;
	
	// 메일 휴지통 복구
	public void updateMailTrashRevert(MailVO mail) throws SQLException;
	
	// 받은메일 휴지통 영구 삭제
	public void updateMailTrashMtoDel(MtoVO mto) throws SQLException;
	
	// 보낸메일 휴지통 영구 삭제
	public void updateMailTrashMFromDel(MailVO mail) throws SQLException;
	
	// 보낸메일 읽음 처리
	public void updateMailMtoCheck(MailVO mail) throws SQLException;
	
	// 보낸메일 읽음 처리 (상단 버튼)
	public void updateMailMtoCheckByChecked(MtoVO mto) throws SQLException; 
	

}
