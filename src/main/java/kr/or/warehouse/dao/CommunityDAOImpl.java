package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CommuBoardVO;
import kr.or.warehouse.dto.CommunityVO;
import kr.or.warehouse.dto.CommupostVO;
import kr.or.warehouse.dto.JoinCommuVO;
import kr.or.warehouse.dto.SubCommuVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<CommunityVO> selectSearchCommunityList(Criteria cri, RowBounds rowBounds) throws SQLException {
		return session.selectList("Community-Mapper.selectSearchCommunityList", cri, rowBounds);
	}

	@Override
	public int selectSearchCommunityListCount(Criteria cri) throws SQLException {
		return session.selectOne("Community-Mapper.selectSearchCommunityListCount", cri);
	}

	@Override
	public String selectName(CommunityVO community) throws SQLException {
		return session.selectOne("Community-Mapper.selectName", community);
	}

	@Override
	public int selectJoinCommuCount(String cmno) throws SQLException {
		return session.selectOne("Community-Mapper.selectJoinCommuCount", cmno);
	}

	@Override
	public List<CommunityVO> selectJoinCommuList(int eno) throws SQLException {
		return session.selectList("Community-Mapper.selectJoinCommuList", eno);
	}

	@Override
	public List<CommunityVO> selectSubCommuList(int eno) throws SQLException {
		return session.selectList("Community-Mapper.selectSubCommuList", eno);
	}

	@Override
	public List<CommunityVO> selectBestCommuList() throws SQLException {
		return session.selectList("Community-Mapper.selectBestCommuList");
	}

	@Override
	public List<CommunityVO> selectMyApproveCommuList(int eno) throws SQLException {
		return session.selectList("Community-Mapper.selectMyApproveCommuList", eno);
	}

	@Override
	public int checkJoinCommu(CommunityVO community) throws SQLException {
		return session.selectOne("Community-Mapper.checkJoinCommu", community);
	}

	@Override
	public void deleteSubCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.deleteSubCommu",community);
	}

	@Override
	public void deleteCommu(String cmno) throws SQLException {
		session.update("Community-Mapper.deleteCommu",cmno);
	}

	@Override
	public void insertSubCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.insertSubCommu",community);
	}

	@Override
	public void insertJoinCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.insertJoinCommu",community);
	}
	
	@Override
	public int checkSubCommu(CommunityVO community) throws SQLException {
		return session.selectOne("Community-Mapper.checkSubCommu", community);
	}

	@Override
	public CommunityVO selectCommunity(String cmno) throws SQLException {
		return session.selectOne("Community-Mapper.selectCommunity", cmno);
	}

	@Override
	public void insertCommunity(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.insertCommunity",community);
	}

	@Override
	public String selectCmno() throws SQLException {
		return session.selectOne("Community-Mapper.selectCmno");
	}

	@Override
	public List<CommunityVO> selectOpenCommuList() throws SQLException {
		return session.selectList("Community-Mapper.selectOpenCommuList");
	}

	@Override
	public List<CommunityVO> selectApproveCommuList(Criteria cri, RowBounds rowBounds) throws SQLException {
		return session.selectList("Community-Mapper.selectApproveCommuList", cri, rowBounds);
	}

	@Override
	public int selectApproveCommuListCount(Criteria cri) {
		return session.selectOne("Community-Mapper.selectApproveCommuListCount", cri);
	}

	@Override
	public void approveCommunity(String cmno) throws SQLException {
		session.update("Community-Mapper.approveCommunity",cmno);
	}

	@Override
	public void approveDeleteCommunity(String cmno) throws SQLException {
		session.update("Community-Mapper.approveDeleteCommunity",cmno);
	}

	@Override
	public List<CommunityVO> selectEmpOpenCommuList(int eno) throws SQLException {
		return session.selectList("Community-Mapper.selectEmpOpenCommuList", eno);
	}

	@Override
	public String selectCboardNo() throws SQLException {
		return session.selectOne("Community-Mapper.selectCboardNo");
	}

	@Override
	public void insertCommuBoard(CommuBoardVO commuBoard) throws SQLException {
		session.update("Community-Mapper.insertCommuBoard",commuBoard);
	}

	@Override
	public List<CommuBoardVO> selectCommuBoardList(String cmno) throws SQLException {
		return session.selectList("Community-Mapper.selectCommuBoardList", cmno);
	}

	@Override
	public List<JoinCommuVO> selectJoinCommuEmpList(String cmno) throws SQLException {
		return session.selectList("Community-Mapper.selectJoinCommuEmpList", cmno);
	}

	@Override
	public List<CommupostVO> selectRecentCommuPostList(String cmno) throws SQLException {
		return session.selectList("Community-Mapper.selectRecentCommuPostList", cmno);
	}

	@Override
	public void removeJoinCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.removeJoinCommu", community);
	}

	@Override
	public void insertInviteCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.insertInviteCommu", community);
	}

	@Override
	public List<CommunityVO> selectInviteCommu(int eno) throws SQLException {
		return session.selectList("Community-Mapper.selectInviteCommu", eno);
	}

	@Override
	public void deleteInviteCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.deleteInviteCommu", community);
	}

	@Override
	public CommuBoardVO selectCommuBoard(String cboardNo) throws SQLException {
		return session.selectOne("Community-Mapper.selectCommuBoard", cboardNo);
	}

	@Override
	public List<CommupostVO> selectCommuPostList(Map<String, Object> map, RowBounds rowBounds) throws SQLException {
		return session.selectList("Community-Mapper.selectCommuPostList", map, rowBounds);
	}

	@Override
	public int selectCommuPostListCount(Map<String, Object> map) {
		return session.selectOne("Community-Mapper.selectCommuPostListCount", map);
	}

	@Override
	public String selectCpostNo() throws SQLException {
		return session.selectOne("Community-Mapper.selectCpostNo");
	}

	@Override
	public void insertCommuPost(CommupostVO commuPost) throws SQLException {
		session.update("Community-Mapper.insertCommuPost", commuPost);
		
	}

	@Override
	public CommupostVO selectCommuPostByCpostNo(String cpostNo) throws SQLException {
		return session.selectOne("Community-Mapper.selectCommuPostByCpostNo", cpostNo);
	}

	@Override
	public void updateCommuPost(CommupostVO commuPost) throws SQLException {
		session.update("Community-Mapper.updateCommuPost", commuPost);
	}

	@Override
	public void increaseViewCnt(String cpostNo) throws SQLException {
		session.update("Community-Mapper.increaseViewCnt", cpostNo);
	}

	@Override
	public void deleteCommuPost(String cpostNo) throws SQLException {
		session.update("Community-Mapper.deleteCommuPost", cpostNo);
	}

	@Override
	public void updateCommunity(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.updateCommunity", community);
	}

	@Override
	public void updateCommuBoard(CommuBoardVO commuBoard) throws SQLException {
		session.update("Community-Mapper.updateCommuBoard", commuBoard);
	}

	@Override
	public void deleteCommuBoard(String cboardNo) throws SQLException {
		session.update("Community-Mapper.deleteCommuBoard", cboardNo);
	}

	@Override
	public String selectAuthority(CommunityVO community) throws SQLException {
		return session.selectOne("Community-Mapper.selectAuthority", community);
	}

	@Override
	public void updateJoinCommu(CommunityVO community) throws SQLException {
		session.update("Community-Mapper.updateJoinCommu", community);
	}

	@Override
	public List<SubCommuVO> selectSubCommu(String cmno) throws SQLException {
		return session.selectList("Community-Mapper.selectSubCommu", cmno);
	}

	


	

	
	

}
