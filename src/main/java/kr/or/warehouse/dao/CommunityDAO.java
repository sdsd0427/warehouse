package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CommuBoardVO;
import kr.or.warehouse.dto.CommunityVO;
import kr.or.warehouse.dto.CommupostVO;
import kr.or.warehouse.dto.JoinCommuVO;
import kr.or.warehouse.dto.SubCommuVO;

public interface CommunityDAO {

	// 전체 커뮤니티 리스트
	List<CommunityVO> selectSearchCommunityList(Criteria cri, RowBounds rowBounds) throws SQLException;
	
	// 전체 커뮤니티 리스트 갯수
	int selectSearchCommunityListCount(Criteria cri) throws SQLException;
	
	// 이름 가져오기
	String selectName(CommunityVO community) throws SQLException;
	
	// 커뮤니티 회원 수
	int selectJoinCommuCount(String cmno) throws SQLException;
	
	// 가입한 커뮤니티 리스트
	List<CommunityVO> selectJoinCommuList(int eno) throws SQLException;
	
	// 가입신청한 커뮤니티 리스트
	List<CommunityVO> selectSubCommuList(int eno) throws SQLException;
	
	// 인기 커뮤니티 리스트
	List<CommunityVO> selectBestCommuList() throws SQLException;
	
	// 개인 개설 대기중인 커뮤니티 리스트
	List<CommunityVO> selectMyApproveCommuList(int eno) throws SQLException;
	
	// 커뮤니티 가입 체크
	int checkJoinCommu(CommunityVO community) throws SQLException;
	
	// 커뮤니티 가입취소
	void deleteSubCommu(CommunityVO community) throws SQLException;
	
	// 커뮤니티 삭제
	void deleteCommu(String cmno) throws SQLException;
	
	// 커뮤니티 가입신청
	void insertSubCommu(CommunityVO community) throws SQLException;
	
	// 커뮤니티 회원 등록
	void insertJoinCommu(CommunityVO community) throws SQLException;
	
	// 가입신청 커뮤 확인
	int checkSubCommu(CommunityVO community) throws SQLException;
	
	// 커뮤니티 찾기
	CommunityVO selectCommunity(String cmno) throws SQLException;
	
	// 커뮤니티 개설 신청
	void insertCommunity(CommunityVO community)throws SQLException;
	
	// 커뮤니티 번호 생성
	String selectCmno() throws SQLException;
	
	// 최근 개설된 커뮤니티
	List<CommunityVO> selectOpenCommuList() throws SQLException;
	
	// 전체 개설 대기 커뮤니티 리스트
	List<CommunityVO> selectApproveCommuList(Criteria cri, RowBounds rowBounds) throws SQLException;
	
	// 전체 개설 대기 커뮤니티 갯수
	int selectApproveCommuListCount(Criteria cri);
	
	// 커뮤니티 개설 승인
	void approveCommunity(String cmno) throws SQLException;
	
	// 커뮤니티 개설 취소
	void approveDeleteCommunity(String cmno) throws SQLException;
	
	// 사원 커뮤니티 개설 리스트
	List<CommunityVO> selectEmpOpenCommuList (int eno) throws SQLException;
	
	// 커뮤니티 게시판 번호 생성
	String selectCboardNo() throws SQLException;
	
	// 커뮤니티 게시판 등록
	void insertCommuBoard(CommuBoardVO commuBoard) throws SQLException;
	
	// 커뮤니티 게시판 목록
	List<CommuBoardVO> selectCommuBoardList (String cmno) throws SQLException;
	
	// 커뮤니티 회원 목록
	List<JoinCommuVO> selectJoinCommuEmpList (String cmno) throws SQLException;
	
	// 최근 커뮤니티 게시글 목록
	List<CommupostVO> selectRecentCommuPostList(String cmno) throws SQLException;
	
	// 커뮤니티 탈퇴
	void removeJoinCommu(CommunityVO community) throws SQLException;
	
	// 커뮤니티 초대
	void insertInviteCommu(CommunityVO community) throws SQLException;
	
	// 초대된 커뮤니티 목록
	List<CommunityVO> selectInviteCommu(int eno) throws SQLException; 
	
	// 초대 데이터 삭제
	void deleteInviteCommu(CommunityVO community) throws SQLException;
	
	// 커뮤니티 게시판 정보
	CommuBoardVO selectCommuBoard(String cboardNo) throws SQLException;
	
	// 커뮤니티 게시판 게시글 목록
	List<CommupostVO> selectCommuPostList (Map<String, Object> map, RowBounds rowBounds)throws SQLException;
	
	// 커뮤니티 게시판 게시글 목록 카운트
	int selectCommuPostListCount(Map<String, Object> map);
	
	// 커뮤니티 게시글 번호생성
	String selectCpostNo() throws SQLException;
	
	// 커뮤니티 게시글 등록
	void insertCommuPost(CommupostVO commuPost) throws SQLException;
	
	// 커뮤니티 게시글 상세
	CommupostVO selectCommuPostByCpostNo(String cpostNo) throws SQLException;
	
	// 커뮤니티 게시글 수정
	void updateCommuPost(CommupostVO commuPost) throws SQLException;
	
	// 조회수 증가
	void increaseViewCnt(String cpostNo) throws SQLException;
	
	// 커뮤니티 게시글 삭제
	void deleteCommuPost(String cpostNo) throws SQLException;
	
	// 커뮤니티 정보 수정
	void updateCommunity(CommunityVO community) throws SQLException;
	
	// 커뮤니티 게시판 수정
	void updateCommuBoard(CommuBoardVO commuBoard) throws SQLException;
	
	// 커뮤니티 게시판 삭제
	void deleteCommuBoard(String cboardNo) throws SQLException;
	
	// 커뮤니티 권한 조회
	String selectAuthority(CommunityVO community) throws SQLException;
	
	// 커뮤니티 회원 권환 변경
	void updateJoinCommu(CommunityVO community) throws SQLException;
	
	List<SubCommuVO> selectSubCommu (String cmno) throws SQLException;
	
}
