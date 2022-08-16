package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.CommunityDAO;
import kr.or.warehouse.dto.CommuBoardVO;
import kr.or.warehouse.dto.CommunityVO;
import kr.or.warehouse.dto.CommupostVO;
import kr.or.warehouse.dto.JoinCommuVO;
import kr.or.warehouse.dto.SubCommuVO;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public Map<String, Object> getCommunityList(Criteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<CommunityVO> communityList = communityDAO.selectSearchCommunityList(cri, rowBounds);
		for(CommunityVO community : communityList) {
			String name = communityDAO.selectName(community);
			int joinCnt = communityDAO.selectJoinCommuCount(community.getCmno());
			
			community.setName(name);
			community.setJoinCnt(joinCnt);
			
		}
		
		int totalCount = communityDAO.selectSearchCommunityListCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("communityList", communityList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<CommunityVO> getJoinCommuList(int eno) throws SQLException {
		List<CommunityVO> joinCommuList = communityDAO.selectJoinCommuList(eno);
		for(CommunityVO community : joinCommuList) {
			String name = communityDAO.selectName(community);
			int joinCnt = communityDAO.selectJoinCommuCount(community.getCmno());
			
			community.setName(name);
			community.setJoinCnt(joinCnt);
			
			
		}
		return joinCommuList;
	}

	@Override
	public List<CommunityVO> getSubCommuList(int eno) throws SQLException {
		
		List<CommunityVO> subCommuList = communityDAO.selectSubCommuList(eno);
				
		for(CommunityVO community : subCommuList) {
			String name = communityDAO.selectName(community);
			int joinCnt = communityDAO.selectJoinCommuCount(community.getCmno());
			
			community.setName(name);
			community.setJoinCnt(joinCnt);
			
			
		}
		return subCommuList;
	}

	@Override
	public List<CommunityVO> getBestCommuList(int eno) throws SQLException {
		List<CommunityVO> bestCommuList = communityDAO.selectBestCommuList();
		
		for(CommunityVO community : bestCommuList) {
			String name = communityDAO.selectName(community);
			community.setCheckEno(eno);
			int checkJoin = communityDAO.checkJoinCommu(community);
			
			community.setCheckJoin(checkJoin);
			community.setName(name);
			
		}
		return bestCommuList;
	}

	@Override
	public List<CommunityVO> getMyApproveCommuList(int eno) throws SQLException {
		return communityDAO.selectMyApproveCommuList(eno);
	}

	@Override
	public void removeSubCommu(CommunityVO community) throws SQLException {
		communityDAO.deleteSubCommu(community);
	}

	@Override
	public void removeCommu(String cmno) throws SQLException {
		communityDAO.deleteCommu(cmno);
	}

	@Override
	public String insertSubCommu(CommunityVO community) throws SQLException {
		String str = "이미 가입신청 중입니다.";
		
		int checkSubCommu = communityDAO.checkSubCommu(community);
		
		if(checkSubCommu == 0) {
			communityDAO.insertSubCommu(community);
			str = "가입신청 되었습니다.";
		}
		
		return str;
	}

	@Override
	public CommunityVO getCommunity(String cmno, int eno) throws SQLException {
		CommunityVO community = communityDAO.selectCommunity(cmno);
		community.setCheckEno(eno);
		int checkJoin = communityDAO.checkJoinCommu(community);
		community.setCheckJoin(checkJoin);
		return community;
	}
	
	@Override
	public CommunityVO getCommunity(String cmno) throws SQLException {
		CommunityVO community = communityDAO.selectCommunity(cmno);
		return community;
	}
	
	

	@Override
	public void insertCommunity(CommunityVO community, List<Integer> enoList) throws SQLException {
		String cmno = communityDAO.selectCmno();
		community.setCmno(cmno);
		
		communityDAO.insertCommunity(community);
		
		if(enoList != null) {
			for(int e : enoList) {
				CommunityVO commu = new CommunityVO();
				commu.setEno(e);
				commu.setCmno(cmno);
				commu.setAuthority(0);
				communityDAO.insertJoinCommu(commu);
			}
		}
	}

	@Override
	public List<CommunityVO> getOpenCommuList() throws SQLException {
		return communityDAO.selectOpenCommuList();
	}

	@Override
	public Map<String, Object> getApproveCommuList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<CommunityVO> approveCommuList = communityDAO.selectApproveCommuList(cri, rowBounds);
		
		int totalCount = communityDAO.selectApproveCommuListCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("approveCommuList", approveCommuList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void approveCommunity(String cmno) throws SQLException {
		communityDAO.approveCommunity(cmno);
	}
	
	@Override
	public void approveDeleteCommunity(String cmno) throws SQLException {
		communityDAO.approveDeleteCommunity(cmno);
	}

	@Override
	public void insertJoinCommu(CommunityVO community) throws SQLException {
		communityDAO.insertJoinCommu(community);
	}

	@Override
	public List<CommunityVO> getEmpOpenCommuList(int eno) throws SQLException {
		return communityDAO.selectEmpOpenCommuList(eno);
	}

	@Override
	public void insertCommuBoard(CommuBoardVO commuBoard) throws SQLException {
		String cboardNo = communityDAO.selectCboardNo();
		
		commuBoard.setCboardNo(cboardNo);
		communityDAO.insertCommuBoard(commuBoard);
		
	}

	@Override
	public List<CommuBoardVO> getCommuBoardList(String cmno) throws SQLException {
		return communityDAO.selectCommuBoardList(cmno);
	}

	@Override
	public List<JoinCommuVO> getJoinCommuEmpList(String cmno) throws SQLException {
		return communityDAO.selectJoinCommuEmpList(cmno);
	}

	@Override
	public List<CommupostVO> getRecentCommuPostList(String cmno) throws SQLException {
		return communityDAO.selectRecentCommuPostList(cmno);
	}

	@Override
	public void removeJoinCommu(CommunityVO community) throws SQLException {
		communityDAO.removeJoinCommu(community);
	}

	@Override
	public void insertInviteCommu(String cmno, List<Integer> eno) throws SQLException {
		for(int e : eno) {
			CommunityVO commu = new CommunityVO();
			commu.setCmno(cmno);
			commu.setEno(e);
			communityDAO.insertInviteCommu(commu);
		}
		
	}

	@Override
	public List<CommunityVO> getInviteCommu(int eno) throws SQLException {
		return communityDAO.selectInviteCommu(eno);
	}

	@Override
	public void acceptCommu(CommunityVO community) throws SQLException {
		communityDAO.deleteInviteCommu(community);
		communityDAO.insertJoinCommu(community);
		
	}

	@Override
	public void removeInviteCommu(CommunityVO community) throws SQLException {
		communityDAO.deleteInviteCommu(community);
	}

	@Override
	public CommuBoardVO getCommuBoard(String cboardNo) throws SQLException {
		return communityDAO.selectCommuBoard(cboardNo);
	}

	@Override
	public Map<String, Object> getCommuPostList(Criteria cri, String cboardNo) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cboardNo", cboardNo);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		List<CommupostVO> commuPostList = communityDAO.selectCommuPostList(map, rowBounds);
		
		int totalCount = communityDAO.selectCommuPostListCount(map);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("commuPostList", commuPostList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void insertCommuPost(CommupostVO commuPost) throws SQLException {
		
		String cpostNo = communityDAO.selectCpostNo();
		commuPost.setCpostNo(cpostNo);
		
		communityDAO.insertCommuPost(commuPost);
		
	}

	@Override
	public CommupostVO getCommuPostByCpostNo(String cpostNo) throws SQLException {
		CommupostVO commuPost = communityDAO.selectCommuPostByCpostNo(cpostNo);
		communityDAO.increaseViewCnt(cpostNo);
		return commuPost;
		
	}

	@Override
	public CommupostVO getCommuPostByCpostNoForModify(String cpostNo) throws SQLException {
		CommupostVO commuPost = communityDAO.selectCommuPostByCpostNo(cpostNo);
		return commuPost;
	}
	
	@Override
	public void updateCommuPost(CommupostVO commuPost) throws SQLException {
		communityDAO.updateCommuPost(commuPost);
	}

	@Override
	public void deleteCommuPost(String cpostNo) throws SQLException {
		communityDAO.deleteCommuPost(cpostNo);
	}

	@Override
	public void updateCommunity(CommunityVO community) throws SQLException {
		communityDAO.updateCommunity(community);
	}

	@Override
	public void updateCommuBoard(CommuBoardVO commuBoard) throws SQLException {
		communityDAO.updateCommuBoard(commuBoard);
	}

	@Override
	public void deleteCommuBoard(String cboardNo) throws SQLException {
		communityDAO.deleteCommuBoard(cboardNo);
	}

	@Override
	public String getAuthority(int eno, String cmno) throws SQLException {
		CommunityVO community = new CommunityVO();
		community.setCmno(cmno);
		community.setEno(eno);
		return communityDAO.selectAuthority(community);
	}

	@Override
	public void updateJoinCommu(CommunityVO community) throws SQLException {
		communityDAO.updateJoinCommu(community);
	}

	@Override
	public List<SubCommuVO> getSubCommu(String cmno) throws SQLException {
		return communityDAO.selectSubCommu(cmno);
	}


	
	

	

	
	
}
