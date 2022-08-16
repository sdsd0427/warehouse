package kr.or.warehouse.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.PdsVO;

@Repository
public class PdsDAOImpl implements PdsDAO {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PdsDAOImpl.class);
	
	@Autowired
	private SqlSession session;

	//수정
	@Override
	public List<PdsVO> selectPdsListByEnoForTree(int eno) throws Exception {
		return session.selectList("Pds-Mapper.selectPdsListByEnoForTree", eno);
	}
	
	@Override
	public List<PdsVO> selectPdsListByUpPno(PdsVO pds) throws Exception {
		return session.selectList("Pds-Mapper.selectPdsListByUpPno", pds);
	}
	
	
	
	
	@Override
	public List<PdsVO> selectPdsListByEno(PdsVO pds) throws Exception {
		return session.selectList("Pds-Mapper.selectPdsListByEno", pds);
	}
	
	@Override
	public List<PdsVO> selectTrashListByEno(PdsVO pds) throws Exception {
		return session.selectList("Pds-Mapper.selectTrashListByEno", pds);
	}

	@Override
	public void insertFile(PdsVO pds) throws Exception {
		session.update("Pds-Mapper.insertFile", pds);
	}

	@Override
	public String selectPdsSeqNext() throws Exception {
		return session.selectOne("Pds-Mapper.selectPdsSeqNext");
	}

	@Override
	public PdsVO selectPdsByPno(String pno) throws Exception {
		return session.selectOne("Pds-Mapper.selectPdsByPno", pno);
	}

	@Override
	public void deletePdsByPno(String pno) throws Exception {
		session.update("Pds-Mapper.deletePdsByPno", pno);
	}

	@Override
	public void updateDelYnByPno(PdsVO pds) throws Exception {
		session.update("Pds-Mapper.updateDelYnByPno", pds);
	}

	@Override
	public void deleteAllPdsByEno(int eno) throws Exception {
		session.update("Pds-Mapper.deleteAllPdsByEno", eno);
	}

	@Override
	public List<PdsVO> selectAllTrashByPno(int eno) throws Exception {
		return session.selectList("Pds-Mapper.selectAllTrashByPno", eno);
	}

	@Override
	public List<PdsVO> selectPdsListByEnoForMoveTrash(PdsVO pds) throws Exception {
		return session.selectList("Pds-Mapper.selectPdsListByEnoForMoveTrash", pds);
	}

	@Override
	public List<PdsVO> selectPdsListForAllEmpPds(PdsVO pds) throws Exception {
		return session.selectList("Pds-Mapper.selectPdsListForAllEmpPds", pds);
	}

	@Override
	public List<PdsVO> selectAllEmpPdsListForTree() throws Exception {
		return session.selectList("Pds-Mapper.selectAllEmpPdsListForTree");
	}

	@Override
	public List<PdsVO> selectTrashPdsListForTree(int eno) throws Exception {
		return session.selectList("Pds-Mapper.selectTrashPdsListForTree", eno);
	}

	


}
