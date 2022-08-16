package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.WorkModifyCommand;
import kr.or.warehouse.controller.view.OrganizationNode;
import kr.or.warehouse.dto.CooperReqVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ObjectionVO;
import kr.or.warehouse.dto.ProceedingVO;
import kr.or.warehouse.dto.ProxyReqVO;
import kr.or.warehouse.dto.QnaReplyVO;
import kr.or.warehouse.dto.QnaVO;
import kr.or.warehouse.dto.ReportVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkReportVO;
import kr.or.warehouse.dto.WorkVO;

public interface WorkService {

	//내업무 목록
	public Map<String, Object> getMyWorkList(Criteria cri, int statusNo, int eno) throws SQLException;
	//요청한업무 목록
	public Map<String, Object> getToReqList(Criteria cri, int statusNo, int eno) throws SQLException;
	//부서업무 목록
	public Map<String, Object> getDepWorkList(Criteria cri, int statusNo, int eno, int dno) throws SQLException;
	//상태별 미확인 업무 체크
	public Map<String, Integer> getNoneCheckCnt(String referMcode, Criteria cri, int eno, int dno) throws SQLException;
	//업무 상세
	public WorkVO getWorkByWcode(String wcode, int eno) throws SQLException;
	//협업요청
	public void myWorkCooperReq(CooperReqVO cooper, int eno) throws SQLException;
	public CooperReqVO getCooperReq(String wcode) throws SQLException;
	//협업요청 반려
	public void cooperReqRefuse(String wcode, String content) throws SQLException;
	//협업요청 승인
	public void cooperReqApprove(WorkModifyCommand modifyCommand) throws Exception;
	//내업무 수정
	public void modifyMyWork(WorkVO work) throws SQLException;
	//요청업무 수정
	public void modifyToReqWork(WorkModifyCommand modifyCommand) throws Exception;
	//업무승인
	public void myWorkApprove(String wcode, int eno) throws SQLException;


	//조직도
	public List<OrganizationNode> organization(List<DepartmentVO> depList) throws Exception;
	//담당자 수정
	/* 선택한 담당자 정보 가져오기 */
	public EmployeeVO getEmpByNodeId(int eno) throws SQLException;

	//이의신청
	public void reqObjection(ObjectionVO obj) throws SQLException;
	public ObjectionVO getObjection(String wcode, int eno, int result) throws SQLException;
	//이의신청 승인
	public void objectionApprove(WorkModifyCommand modifyCommand, int eno) throws Exception;
	//이의신청 반려
	public void objectionRefuse(String wcode, int eno, String content) throws SQLException;

	//대리요청
	public void myWorkProxyReq(ProxyReqVO proxy) throws SQLException;
	//대리요청 내용 가져오기
	public ProxyReqVO getProxyReq(String wcode) throws SQLException;
	//대리요청 승인
	public void proxyReqApprove(WorkModifyCommand modifyCommand)throws Exception;
	//대리요청 반려
	public void proxyReqRefuse(String wcode, String content) throws Exception;

	//업무 보고서 작성
	public void reportRegist(ReportVO report) throws Exception;
	//업무 보고서 리스트
	public Map<String, Object> getReportList(String wcode, Criteria cri) throws SQLException;
	//업무 보고서 상세보기
	public ReportVO getReportByRepNo(int repno) throws SQLException;
	//보고서 첨부파일 삭제
	public void removeReportFile(int repno) throws SQLException;
	//보고서 수정
	public void modifyReport(ReportVO report) throws SQLException;
	//보고서 삭제
	public void deleteReport(int repno) throws SQLException;

	//업무 회의록 작성
	public void proceedRegist(ProceedingVO proceed) throws SQLException;
	//업무 회의록 리스트
	public Map<String, Object> getProceedList(String wcode, Criteria cri) throws SQLException;
	//업무 보고서 상세보기
	public ProceedingVO getProceedByProNo(int prono) throws SQLException;
	//보고서 첨부파일 삭제
	public void removeProceedFile(int prono) throws SQLException;
	//보고서 수정
	public void modifyProceed(ProceedingVO proceed) throws SQLException;
	//보고서 삭제
	public void deleteProceed(int prono) throws SQLException;

	//이번주 마감 내업무 목록
	public Map<String, Object> getThisWeekMyWorkList(int eno, Criteria cri) throws SQLException;
	//이번주 마감 요청한업무 목록
	public Map<String, Object> getThisWeekToReqList(int eno, Criteria cri) throws SQLException;
	//미승인 업무 목록
	public Map<String, Object> getNotApproveMyWorkList(int eno, Criteria cri) throws SQLException;
	//대기중인 요청업무 목록
	public Map<String, Object> getWaitToReqWorkList(int eno, Criteria cri) throws SQLException;
	//노하우 상세보기
	public WorkVO getWorkFromKnowHow(String wcode) throws SQLException;

	//새 업무 등록
	void regist(WorkVO work, int dno, List<WorkManagerVO> workManagerList) throws Exception;

	//부당신고
	void workReportRegist(WorkReportVO workReport) throws SQLException;
	Map<String, Object> getWorkReportList(int result, Criteria cri) throws SQLException;
	WorkReportVO getWorkReportDetail(int wrepno) throws SQLException;
	void approveWorkReport(int wrepno) throws SQLException;

	//관련 멘토 업무
	public Map<String, Object> getRelationMentoWorkList(Criteria cri, String wcode, int eno) throws SQLException;
	public List<String> getHashTagListByWcode(String wcode) throws SQLException;

	//질의응답
	Map<String, Object> getWorkQnaList(Criteria cri, String wcode) throws SQLException;
	Map<String, Object> getWorkQnaReplyList(Criteria cri, int qnaNo) throws SQLException;
	void registWorkQna(QnaVO qna) throws SQLException;
	void registWorkQnaReply(QnaReplyVO qnaReply) throws SQLException;
	void updateWorkQna(QnaVO qna) throws SQLException;
	void updateWorkQnaReply(QnaReplyVO qnaReply) throws SQLException;
	void removeWorkQna(int qnaNo) throws SQLException;
	void removeWorkQnaReply(int qrno) throws SQLException;
	QnaVO getWorkQnaDetail(int qnaNo) throws SQLException;
	QnaReplyVO getWorkQnaReplyDetail(int qrno) throws SQLException;
}
