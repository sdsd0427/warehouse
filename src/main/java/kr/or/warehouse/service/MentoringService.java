package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MentoringVO;
import kr.or.warehouse.dto.SubMentoringVO;
import kr.or.warehouse.dto.WorkVO;

public interface MentoringService {
	//나의 멘토목록
	List<SubMentoringVO> getMyMentoListMain(int eno) throws Exception; //동기
	int getMyMentoListCountMain(int eno) throws Exception;
	Map<String,Object> getMyMentoList(Criteria cri, int eno) throws Exception; //비동기
	//나의 멘티목록
	List<SubMentoringVO> getMyMenteeListMain(int eno) throws Exception; //동기
	int getMyMenteeListCountMain(int eno) throws Exception;
	Map<String,Object> getMyMenteeList(Criteria cri, int eno) throws Exception; //비동기

	//인기멘토목록
	List<SubMentoringVO> getMentoRank() throws Exception;

	//나를 멘토로 신청한 목록
	Map<String,Object> getSubMentoringList(Criteria cri, int eno) throws Exception;
	SubMentoringVO getSubMenteeDetail(String smno)throws Exception;

	//멘토링 수락
	void acceptMentoring(MentoringVO mentoring) throws Exception;

	//만료직전 멘토링
	Map<String,Object> getEndMentoringList(Criteria cri, int eno) throws Exception;
	void exdateApply(SubMentoringVO subMentoring)throws Exception;

	//나의 업무 목록
	List<WorkVO> getMyWorkList(int eno) throws Exception;

	void apply(SubMentoringVO subMentoring) throws Exception;
	int getSubMentoring(int mento, int mentee) throws Exception;

	//나의 멘토 업무 목록
	Map<String,Object> getMyMentoWorkList(Criteria cri, int eno) throws Exception;

	//나의 멘토 결재문서 목록
	Map<String,Object> getMyMentoDocList(Criteria cri, int eno) throws Exception;

	//멘토링 종료
	void removeMentoring(String smno)throws Exception;

	//나의 멘티 업무 목록
	Map<String,Object> getMyMenteeWorkList(Criteria cri, int eno) throws Exception;

	//나의 멘티 결재문서 목록
	Map<String,Object> getMyMenteeDocList(Criteria cri, int eno) throws Exception;

	//나의 멘토업무 등록 목록
	Map<String,Object> getSysdateMentoWork(Criteria cri, int eno) throws Exception;

	//나의 멘티업무 등록 목록
	Map<String,Object> getSysdateMenteeWork(Criteria cri, int eno) throws Exception;

	Map<String,Object> getSysdateMentoringAllWork(Criteria cri, int eno) throws Exception;

	//읽음 표시
	void read(String smno) throws Exception;

	void deleteEndDateMentoring()throws Exception;

	List<SubMentoringVO> getRecommendMbti(int eno)throws Exception;
	List<EmployeeVO> getMbtiList(int eno)throws Exception;

	//멘토링 거절
	void deleteSubMentoring(String smno)throws Exception;
}
