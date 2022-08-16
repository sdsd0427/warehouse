package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MentoringVO;
import kr.or.warehouse.dto.SubMentoringVO;
import kr.or.warehouse.dto.WorkVO;

public interface MentoringDAO {
	String selectPhoto(int eno) throws SQLException;

	//나의 멘토목록
	List<SubMentoringVO> selectMyMentoMain(int eno) throws Exception;
	List<SubMentoringVO> selectMyMento(Criteria cri, int eno) throws Exception;
	int selectMyMentoCount(Criteria cri, int eno) throws Exception;
	int selectMyMentoCountMain(int eno) throws Exception;

	//나의 멘티목록
	List<SubMentoringVO> selectMyMenteeMain(int eno) throws Exception;
	List<SubMentoringVO> selectMyMentee(Criteria cri, int eno) throws Exception;
	int selectMyMenteeCount(Criteria cri, int eno) throws Exception;
	int selectMyMenteeCountMain(int eno) throws Exception;
	MentoringVO selectMenteeDate(int eno) throws Exception;

	//인기멘토목록
	List<SubMentoringVO> selectMentoRank() throws Exception;

	//나를 멘토로 신청한 목록
	List<SubMentoringVO> subMentoringList(Criteria cri, int eno) throws Exception;
	int subMentoringListCount(Criteria cri, int eno) throws Exception;
	SubMentoringVO subMenteeDetail(String smno)throws Exception;

	//멘토링 수락
	void acceptMentoring(MentoringVO mentoring) throws Exception;
	String selectMtno() throws Exception;

	//만료직전 멘토링
	List<SubMentoringVO> endMentoringList(Criteria cri, int eno) throws Exception;
	int endMentoringListCount(Criteria cri, int eno) throws Exception;
	void exdateApply(SubMentoringVO subMentoring)throws Exception;

	//나의 업무 목록
	List<WorkVO> myWorkList(int eno) throws Exception;

	//멘토링 신청
	void applyMentoring(SubMentoringVO subMentoring) throws Exception;
	int subMentoring(int mento, int mentee) throws Exception;
	String selectSmno() throws Exception;

	//나의 멘토 업무 목록
	List<SubMentoringVO> myMentoWorkList(Criteria cri, int eno) throws Exception;
	int myMentoWorkListCount(Criteria cri, int eno) throws Exception;

	//나의 멘토 결재문서 목록
	List<SubMentoringVO> myMentoDocList(Criteria cri, int eno) throws Exception;
	int myMentoDocListCount(Criteria cri, int eno) throws Exception;

	//멘토링 종료
	void endMentoring(String smno) throws Exception;

	//나의 멘티 업무 목록
	List<SubMentoringVO> myMenteeWorkList(Criteria cri, int eno) throws Exception;
	int myMenteeWorkListCount(Criteria cri, int eno) throws Exception;

	//나의 멘티 결재문서 목록
	List<SubMentoringVO> myMenteeDocList(Criteria cri, int eno) throws Exception;
	int myMenteeDocListCount(Criteria cri, int eno) throws Exception;

	//나의 멘토업무 등록 목록
	List<SubMentoringVO> sysdateMentoWork(Criteria cri, int eno) throws Exception;
	int sysdateMentoWorkCount(Criteria cri, int eno) throws Exception;

	//나의 멘티업무 등록 목록
	List<SubMentoringVO> sysdateMenteeWork(Criteria cri, int eno) throws Exception;
	int sysdateMenteeWorkCount(Criteria cri, int eno) throws Exception;

	List<SubMentoringVO> sysdateMentoringAllWork(Criteria cri, int eno) throws Exception;
	int sysdateMentoringAllWorkCount(Criteria cri, int eno) throws Exception;

	//읽음표시
	void updateReadCheck(String smno) throws Exception;

	void deleteEndDateMentoring() throws Exception;

	List<SubMentoringVO> recommendMbti(int eno)throws Exception;
	List<EmployeeVO> selectMbti(int eno)throws Exception;

	//멘토링 거절
	void refuseSubMentoring(String smno) throws Exception;
}
