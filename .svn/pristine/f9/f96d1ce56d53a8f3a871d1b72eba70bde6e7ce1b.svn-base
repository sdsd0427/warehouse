package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.controller.view.OrganizationNode;
import kr.or.warehouse.dto.AllSignVO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.FieldVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignLineGrVO;
import kr.or.warehouse.dto.SignerVO;

public interface NewApprovalService {

	// 관련문서
	Map<String, Object> getRelatedDocList(Criteria cri, String sformno) throws SQLException;

	// 참조자 리스트
	Map<String, Object> getRefLineList(Criteria cri) throws SQLException;

	// 조직도
	public List<OrganizationNode> organization(List<DepartmentVO> depList) throws Exception;

	// 조직도 부서
	Map<String, Object> getDeptName(Criteria cri, int eno) throws SQLException;

	// 로그인한 사원 정보
	Map<String, Object> getContactList(Criteria cri, int eno) throws SQLException;

	// 문서정보
	Map<String, Object> getSignDocNo() throws SQLException;

	// 결재문서 저장
	void registSignDoc(SignDocVO signDoc, List<String> signerMemberList, List<String> reFMemberList,
			List<String> viewerMemberList) throws SQLException, Exception;

	// 결재선 리스트
	Map<String, Object> getSignLineList(Criteria cri, int dno) throws SQLException;

	// 개인결재선 그룹 저장
	String registSignGr(SignLineGrVO signLineGr, int eno, List<String> signerMemberList) throws SQLException;

	// 개인결재선 그룹 리스트
	Map<String, Object> getSignLineGr(int eno) throws SQLException;

	// 개인결재선 그룹에 속한 사원리스트
	Map<String, Object> getMySignMemberList(String signGroupNo) throws SQLException;

	// 개인결재선 그룹 삭제
	void removeSignGr(String signGroupNo) throws SQLException;

	// 첨부파일
	// 첨부파일 조회
	AttachVO getMailAttachByMaNo(String maNo) throws SQLException;

	void addSignAttachList(AllSignVO allSign) throws SQLException;

	// 문서함 필드설정
	List<FieldVO> getFieldSetting(int eno) throws SQLException;

	void insertFieldSetting(FieldVO field) throws SQLException;

	void deleteField(int eno) throws SQLException;

	// 결재문서함 리스트
	Map<String, Object> getApproveList(Criteria cri, int eno, int signState) throws SQLException;

	// 기안문서함 리스트
	Map<String, Object> getDraftList(Criteria cri, int eno, int state) throws SQLException;

	// 기안문서함 리스트
	Map<String, Object> getTempList(Criteria cri, int eno, int state) throws SQLException;

	// 참조문서함 리스트
	Map<String, Object> getViewerList(Criteria cri, int eno, int state) throws SQLException;

	// 회람함 리스트
	Map<String, Object> getCirculateList(Criteria cri, int eno) throws SQLException;

	// 문서 상세보기
	AllSignVO getSignDocBySignNo(String signNo) throws SQLException;

	// 첨부파일 가져오기
	AttachVO getSignAttachBySignAno(String attachNo) throws SQLException;

	void updateSignRank(SignerVO signer) throws SQLException;

	void updateNextSignCheck(SignerVO signer) throws SQLException;

	void updateLastSignState(String signLineno) throws SQLException;

	void updateStateOfSignDoc(SignerVO signer) throws SQLException;

	void updateSignStateByReject(SignerVO signer) throws SQLException;

	void updateLowRankSignStateByReject(String signLineno) throws SQLException;

	void updateSignStateByWait(SignerVO signer) throws SQLException;

	void deleteSignDoc(String signNo) throws SQLException;

	void deleteHashTag(String signNo) throws SQLException;

	Map<String, Integer> readCheck(int eno, String referMcode) throws SQLException;

	void insertSignReader(AllSignVO allSign) throws SQLException;

	void updateSignerScehck(AllSignVO allSign) throws SQLException;

	void updateSingDocScehck(AllSignVO allSign) throws SQLException;

	void updateSignViewerScehck(AllSignVO allSign) throws SQLException;

	AllSignVO getReSignDocBySignNo(String signNo) throws SQLException;

	void updateStateOfSignDocIng(SignerVO signer) throws SQLException;

	void reRegistSignDoc(SignDocVO signDoc, List<String> signerMemberList, List<String> reFMemberList, List<String> viewerMemberList) throws Exception;

	void insertApproveSignDoc(String signNo) throws SQLException;
	
	int selectReaderCount(AllSignVO allSign) throws SQLException;
	
	void updateClassCodeHashTag(AllSignVO allSign) throws SQLException;
	void updateClassCodeSignDoc(AllSignVO allSign) throws SQLException;
	
	//대쉬보드
	//진행중인 기안문서 목록
	Map<String, Object> getProceedingDraftDocList(Criteria cri, int eno) throws SQLException;
	//최근임시저장 목록
	Map<String, Object> getRecentTempSaveDocList(Criteria cri, int eno) throws SQLException;
	//승인할 결재 목록
	Map<String, Object> getSignMyTurnDocList(Criteria cri, int eno) throws SQLException;
}
