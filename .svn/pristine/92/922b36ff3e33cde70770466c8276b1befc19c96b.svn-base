package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CooperReqVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ObjectionVO;
import kr.or.warehouse.dto.ProxyReqVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkReportVO;
import kr.or.warehouse.dto.WorkVO;

public interface WorkDAO {
	//내 업무
	public List<WorkVO> selectMyWorkAllStatusList(int eno, Criteria cri) throws SQLException;
	public List<WorkVO> selectMyWorkReadCheckList(int eno, Criteria cri) throws SQLException;
	public List<WorkVO> selectMyWorkList(int eno,String wstatus,Criteria cri) throws SQLException;
	public int selectMyWorkTotalCount(int eno, String wstatus, Criteria cri) throws SQLException;
	public void updateMyWork(WorkVO work) throws SQLException;

	//요청한 업무
	public List<WorkVO> selectToReqAllStatusList(int eno, Criteria cri) throws SQLException;
	public List<WorkVO> selectToReqReadCheckList(int eno, Criteria cri) throws SQLException;
	public List<WorkVO> selectToReqList(int eno, String wstatus, Criteria cri) throws SQLException;
	public int selectToReqTotalCount(int eno, String wstatus, Criteria cri) throws SQLException;
	public void updateToReq(WorkVO work) throws SQLException;

	//부서업무
	public List<WorkVO> selectDepWorkAllStatusList(int dno, Criteria cri) throws SQLException;
	public List<WorkVO> selectDepWorkReadCheckList(int dno, Criteria cri) throws SQLException;
	public List<WorkVO> selectDepWorkList(int dno, String wstatus, Criteria cri) throws SQLException;
	public int selectDepWorkTotalCount(int dno, String wstatus, Criteria cri) throws SQLException;

	//업무 상세
	public WorkVO selectWorkByWcode(String wcode) throws SQLException;

	//협업요청
	public void insertCooperReq(CooperReqVO cooper) throws SQLException;
	public CooperReqVO selectCooperReq(String wcode) throws SQLException;
	public EmployeeVO selectCooperRequesterByEno(int eno) throws SQLException;
	//협업요청 승인
	public void updateCooperReqApprove(String wcode) throws SQLException;
	//협업요청 반려
	public void updateCooperReqRefuse(String wcode, String content) throws SQLException;

	//업무 상태변경
	public void updateWorkWstatus(String wcode, String wstatus,String classcode) throws SQLException;
	//업무 상태 변경 -> 안읽은 상태로 변경
	public void deleteWorkReader(String wcode) throws SQLException;
	//업무 읽은상태로 변경
	public void insertWorkReader(String wcode, int eno) throws SQLException;
	//해쉬태그 분류코드 변경
	public void updateHashTagClassCode(String wcode, String classcode) throws SQLException;

	//해쉬태그 가져오기
	public String selectHashTagByWcode(String wcode) throws SQLException;

	//해쉬태그 수정
	public void updateWorkHashTag(WorkVO work) throws SQLException;

	//담당자 검색
	public int selectEnoByKeyword(String keyword) throws SQLException;
	public EmployeeVO selectWorkRequestBy(String wcode) throws SQLException;
	public List<WorkManagerVO> selectWorkManagerList(String wcode) throws SQLException;
	public EmployeeVO selectEmpByNodeId(int eno) throws SQLException;

	//미확인 업무 체크
	public int workReadCheck(String wcode, int eno) throws SQLException;

	//변경된 담당자 삭제
	public void deleteWorkManager(String wcode, int eno) throws SQLException;
	//추가된 담당자 추가
	public void insertNewWorkManager(WorkManagerVO manager) throws SQLException;
	//담당자 상태변경
	public void updateWorkManagerAnswer(String wcode, int eno, String answer) throws SQLException;

	//이의신청
	public void insertObjection(ObjectionVO obj) throws SQLException;
	//이의신청내용가져오기
	public ObjectionVO selectObjection(String wcode, int eno, int result) throws SQLException;
	//이의신청 승인
	public void updateObjectionApprove(String wcode, int eno) throws SQLException;
	//담당자 wmstep변경
	public void updateWorkManagerWmStep(WorkManagerVO workmanager) throws SQLException;
	//이의신청 반려
	public void updateObjectionRefuse(String wcode, int eno ,String content) throws SQLException;
	//대리요청
	public void insertProxyReq(ProxyReqVO proxy) throws SQLException;
	//대리요청 내용 가져오기
	public ProxyReqVO selectProxyReq(String wcode) throws SQLException;
	//대리요청 승인
	public void updateProxyReqApprove(String wcode) throws SQLException;
	//대리요청 반려
	public void updateProxyReqRefuse(String wcode, String content) throws SQLException;

	//이번주 마감 내 업무
	public List<WorkVO> selectThisWeekEndMyWorkList(int eno, Criteria cri) throws SQLException;
	public int selectThisWeekEndMyWorkTotalCount(int eno) throws SQLException;

	//이번주 마감 요청한 업무
	public List<WorkVO> selectThisWeekEndToReqList(int eno, Criteria cri) throws SQLException;
	public int selectThisWeekEndToReqTotalCount(int eno) throws SQLException;

	//미승인 업무
	public List<WorkVO> selectNotApproveMyWorkList(int eno, Criteria cri) throws SQLException;
	public int selectNotApproveMyWorkTotalCount(int eno) throws SQLException;

	//대기중인 요청업무
	public List<WorkVO> selectWaitToReqWorkList(int eno, Criteria cri) throws SQLException;
	public int selectWaitToReqWorkTotalCount(int eno) throws SQLException;

	//완료된 업무 노하우로
	public void insertKnowHow(String wcode) throws SQLException;

	//노하우 조회수 증가
	public void increaseKnowHowViewCnt(String wcode) throws SQLException;


	//새 업무 등록
	void insertWork(WorkVO work) throws Exception;

	//dno로 wcode 값 구하기
	List<String> selectWcodeByDno(int dno) throws Exception;

	//새 업무의 담당자 등록
	void insertWorkManager(WorkManagerVO workManager) throws Exception;

	//새 업무의 해시태그
	void insertWorkHashTag(WorkVO work) throws Exception;

	//부당신고
	void insertWorkReport(WorkReportVO workReport) throws SQLException;
	List<WorkReportVO> selectWorkReportList(int result, Criteria cri) throws SQLException;
	int selectWorkReportListTotalCount(int result) throws SQLException;
	WorkReportVO selectWorkReportByWrepNo(int wrepno) throws SQLException;
	void approveWorkReport(int wrepno) throws SQLException;

	//관련 멘토 업무
	public List<WorkVO> selectRelationMentoWork(Criteria cri, String wcode, int eno) throws SQLException;
	public int selectRelationMentoWorkCount(Criteria cri, String wcode, int eno) throws SQLException;
	public List<String> selectHashTagListByWcode(String wcode) throws SQLException;

}




















