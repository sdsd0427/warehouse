package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CommuBoardVO;
import kr.or.warehouse.dto.CommunityVO;
import kr.or.warehouse.dto.CommupostVO;
import kr.or.warehouse.dto.JoinCommuVO;
import kr.or.warehouse.dto.SubCommuVO;

public interface CommunityService {
	
	Map<String,Object> getCommunityList(Criteria cri)throws SQLException;
	
	List<CommunityVO> getJoinCommuList(int eno) throws SQLException;
	
	List<CommunityVO> getSubCommuList(int eno) throws SQLException;
	
	List<CommunityVO> getBestCommuList(int eno) throws SQLException;
	
	List<CommunityVO> getMyApproveCommuList(int eno) throws SQLException;
	
	void removeSubCommu(CommunityVO community)throws SQLException;
	
	void removeCommu(String cmno)throws SQLException;
	
	String insertSubCommu(CommunityVO community) throws SQLException;
	
	void insertJoinCommu(CommunityVO community) throws SQLException;
	
	CommunityVO getCommunity(String cmno,int eno) throws SQLException;
	
	CommunityVO getCommunity(String cmno) throws SQLException;
	
	void insertCommunity(CommunityVO community, List<Integer> enoList)throws SQLException;
	
	List<CommunityVO> getOpenCommuList() throws SQLException;
	
	Map<String,Object> getApproveCommuList(Criteria cri)throws SQLException;
	
	void approveCommunity(String cmno) throws SQLException;
	
	void approveDeleteCommunity(String cmno) throws SQLException;
	
	List<CommunityVO> getEmpOpenCommuList(int eno) throws SQLException;
	
	void insertCommuBoard(CommuBoardVO commuBoard) throws SQLException;
	
	List<CommuBoardVO> getCommuBoardList(String cmno) throws SQLException;
	
	List<JoinCommuVO> getJoinCommuEmpList(String cmno) throws SQLException;
	
	List<CommupostVO> getRecentCommuPostList(String cmno) throws SQLException;
	
	void removeJoinCommu(CommunityVO community) throws SQLException;
	
	void insertInviteCommu(String cmno , List<Integer> eno) throws SQLException;
	
	List<CommunityVO> getInviteCommu(int eno) throws SQLException;
	
	void acceptCommu(CommunityVO community) throws SQLException;
	
	void removeInviteCommu(CommunityVO community) throws SQLException;
	
	CommuBoardVO getCommuBoard(String cboardNo) throws SQLException;
	
	Map<String,Object> getCommuPostList(Criteria cri, String cboardNo)throws SQLException;
	
	void insertCommuPost(CommupostVO commuPost) throws SQLException;
	
	CommupostVO getCommuPostByCpostNo(String cpostNo) throws SQLException;
	
	CommupostVO getCommuPostByCpostNoForModify(String cpostNo) throws SQLException;
	
	void updateCommuPost(CommupostVO commuPost) throws SQLException;
	
	void deleteCommuPost(String cpostNo) throws SQLException;
	
	void updateCommunity(CommunityVO community) throws SQLException;
	
	void updateCommuBoard(CommuBoardVO commuBoard) throws SQLException;
	
	void deleteCommuBoard(String cboardNo) throws SQLException;
	
	String getAuthority(int eno, String cmno) throws SQLException;
	
	void updateJoinCommu(CommunityVO community) throws SQLException;
	
	List<SubCommuVO> getSubCommu(String cmno) throws SQLException;
	
}
