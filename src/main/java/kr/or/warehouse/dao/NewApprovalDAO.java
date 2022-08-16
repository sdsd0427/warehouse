package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.AllSignVO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.FieldVO;
import kr.or.warehouse.dto.MySignLineVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignFormVO;
import kr.or.warehouse.dto.SignLineGrVO;
import kr.or.warehouse.dto.SignLineVO;
import kr.or.warehouse.dto.SignerVO;

public interface NewApprovalDAO {

	// 관련문서 리스트
	List<SignDocVO> selectRelatedDocList(Map<String, String> paramMap, RowBounds rowBounds) throws SQLException;

	// 참조자 리스트
	List<EmployeeVO> selectRefLineList(Map<String, String> paramMap, RowBounds rowBounds) throws SQLException;

	// 조직도 부서 찾기
	List<SignDocVO> selectDeptName(Criteria cri, int eno) throws SQLException;

	// 결재선 리스트
	List<SignLineVO> selectSignLineList(Map<String, Object> paramMap) throws SQLException;

	// 로그인한 사원 정보
	List<EmployeeVO> selectSearchContactList(Map<String, Object> paramMap) throws SQLException;

	// 문서번호
	String selectSignDocNo() throws SQLException;

	// 결재선 번호 생성
	String selectSignLineNo() throws SQLException;

	// 결재자 저장
	void insertSigner(SignerVO signer) throws SQLException;

	// 결재선 순위
//	String selectRankCode(int eno) throws SQLException;

	// 결재선 저장
	void insertSignLine(SignLineVO signLine) throws SQLException;

	// 결재문서 저장
	void insertSignDoc(SignDocVO signDoc) throws SQLException;

	// 결재그룹 번호
	String selectSignGroupNo() throws SQLException;

	// 개인결재선 그룹이름 저장
	void insertSignLineGr(SignLineGrVO signLineGr) throws SQLException;

	// 개인결재선에 사원들 저장
	void insertMySignLine(MySignLineVO mysignLine) throws SQLException;

	// 개인결재선 그룹 리스트
	List<SignLineGrVO> selectSignLineGr(int eno) throws SQLException;

	// 개인결재선 그룹 안 사원 리스트
	List<MySignLineVO> selectMySignMemberList(String signGroupNo) throws SQLException;

	// 개인결재선 그룹 삭제
	void deleteSignGr(String signGroupNo) throws SQLException;

	// 첨부파일 시작
	// 파일 번호
	String selectSignAttachNo() throws SQLException;

	List<AttachVO> selectSignAttachBySianNo(String refNo) throws SQLException;

	AttachVO selectSignAttachBySianAttachNo(String attachNo) throws SQLException;

	void insertSignAttach(AttachVO attach) throws SQLException;

	// 해시태그
	void insertApprovalHashTag(SignDocVO signDoc) throws SQLException;

	// 참조자 저장
	void insertsignRef(SignDocVO signDoc) throws SQLException;

	// 열람자 저장
	void insertSignViewer(SignDocVO signDoc) throws SQLException;

	
	
	
	// 필드설정
	List<FieldVO> selectFieldSetting(int eno) throws SQLException;

	void insertFieldSetting(FieldVO field) throws SQLException;

	void deleteField(int eno) throws SQLException;

	// 미확인 문서
	public int signReadCheck(String signNo, int eno) throws SQLException;

	// 결재양식
	SignFormVO selectSignForm(String sFormNo) throws SQLException;

	// 결재문서함 리스트
	List<AllSignVO> selectApproveList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;
	
	// 전체 결재문서함 리스트
	List<AllSignVO> selectReadCheckApproveList(int eno) throws SQLException;
	void insertSignReader(AllSignVO allSign) throws SQLException;
	void updateSignerScehck(AllSignVO allSign) throws SQLException;

	// 결재문서함 리스트 count
	int selectApproveListCount(Map<String, Object> paramMap) throws SQLException;

	// 기안문서함 리스트
	List<AllSignVO> selectDraftList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;
	
	// 전체 기안문서함 리스트
	List<AllSignVO> selectReadCheckDraftList(int eno) throws SQLException;
	void updateSingDocScehck(AllSignVO allSign) throws SQLException;
	
	// 기안문서함 리스트 count
	int selectDraftListCount(Map<String, Object> paramMap) throws SQLException;

	// 임시문서함 리스트
	List<AllSignVO> selectTempList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;

	// 임시문서함 리스트 count
	int selectTempListCount(Map<String, Object> paramMap) throws SQLException;

	// 참조문서함 리스트
	List<AllSignVO> selectViewerList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;
	
	// 전체 참조문서함 리스트
	List<AllSignVO> selectReadCheckViewerList(int eno) throws SQLException;
	void updateSignViewerScehck(AllSignVO allSign) throws SQLException;
	
	// 참조문서함 리스트 count
	int selectViewerListCount(Map<String, Object> paramMap) throws SQLException;

	// 회람함 리스트
	List<AllSignVO> selectCirculateList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException;

	// 회람함 리스트 count
	int selectCirculateListCount(Map<String, Object> paramMap) throws SQLException;

	
	// 문서번호로 문서 가져오기
	AllSignVO selectSignDocBySignNo(String signNo) throws SQLException;
	
	// 결재자 리스트
	List<SignerVO> selectSignerList(String signNo) throws SQLException;
	
	// 참조자 리스트
	List<SignerVO> selectSignRefList(String signNo) throws SQLException;
	
	// 열람자 리스트
	List<SignerVO> selectSignViewerList(String signNo) throws SQLException;
	

	// 결재선 저장 시 처음 결재자의 signCheck 1로 update
	void updateSignCheckOfSignRank(String signLineNo) throws SQLException;
	
	// 첨부파일 다운
	AttachVO selectSignAttachBySignAno(String attachNo) throws SQLException;
	
	// 결재 시 결재자의 상태 update
	void updateSignRank(SignerVO signer) throws SQLException;
	
	// 다음 결재자의 signCheck update
	void updateNextSignCheck(SignerVO signer) throws SQLException;
	
	// 최종결재자까지 결재 완료 후 모든 결재자의 상태 update
	void updateLastSignState(String signLineno) throws SQLException;
	
	// 결재문서의 state update
	void updateStateOfSignDoc(SignerVO signer) throws SQLException;
	
	// 최종 결재자 이름 가져오기
	String selectNameOfLastSigner(String signNo) throws SQLException;
	
	// 결재자가 반려 버튼을 클릭한 경우
	void updateSignStateByReject(SignerVO signer) throws SQLException;
	
	// 결재자가 반려 버튼을 클릭한 경우 : 이미 결재한 사람들의 signState update
	void updateLowRankSignStateByReject(String signLineno) throws SQLException;
	
	// 결재자가 보류 버튼을 클릭한 경우
	void updateSignStateByWait(SignerVO signer) throws SQLException;
	
	// 기안자 이름 가져오기
	String selectDrafter(String signNo) throws SQLException;
	
	// 문서 삭제
	void deleteSignDoc(String signNo) throws SQLException;
	
	// hashtag 삭제
	void deleteHashTag(String signNo) throws SQLException;
	
	// 중간 결재자의 결재일 update
	void updateStateOfSignDocIng(SignerVO signer) throws SQLException;
	
	// 전사 문서함에 완료 문서 추가
	void insertApproveSignDoc(String signNo) throws SQLException;
	
	// signReader 중복 제거
	int selectReaderCount(AllSignVO allSign) throws SQLException;
	
	//전사문서함 조회수
	void increaseDocViewCnt(String signNo) throws SQLException;
	
	// classCode update
	void updateClassCodeHashTag(AllSignVO allSign) throws SQLException;
	void updateClassCodeSignDoc(AllSignVO allSign) throws SQLException;
	

	int selectRelatedDocListCount(Map<String, String> paramMap) throws SQLException;
	
	//대쉬보드
	//진행중인 기안 목록
	List<AllSignVO> selectProceedingDraftList(Criteria cri, int eno) throws SQLException;
	int selectProceedingDraftTotalCount(int eno) throws SQLException;
	
	//최근 임시저장 목록
	List<AllSignVO> selectRecentTempSaveDocList(Criteria cri, int eno) throws SQLException;
	int selectRecentTempSaveDocTotalCount(int eno) throws SQLException;
	
	//승인할 결재 목록
	List<AllSignVO> selectSignMyTurnDocList(Criteria cri, int eno) throws SQLException;
	int selectSignMyTurnDocTotalCount(int eno) throws SQLException;
	
}
