package kr.or.warehouse.dao;

import java.util.List;

import kr.or.warehouse.dto.PdsVO;

public interface PdsDAO {

	//수정....
	List<PdsVO> selectPdsListByUpPno(PdsVO pds) throws Exception;
	List<PdsVO> selectPdsListByEnoForTree(int eno) throws Exception;
	
	List<PdsVO> selectTrashPdsListForTree(int eno) throws Exception;
	
	//개인자료실 자료 select
	List<PdsVO> selectPdsListByEno(PdsVO pds) throws Exception;
	
	List<PdsVO> selectTrashListByEno(PdsVO pds) throws Exception;
	
	void insertFile(PdsVO pds) throws Exception;
	
	String selectPdsSeqNext() throws Exception;
	
	PdsVO selectPdsByPno(String pno) throws Exception;
	
	void deletePdsByPno(String pno) throws Exception;
	
	void deleteAllPdsByEno(int eno) throws Exception;
	
	void updateDelYnByPno(PdsVO pds) throws Exception;
	
	List<PdsVO> selectAllTrashByPno(int eno) throws Exception;
	
	List<PdsVO> selectPdsListByEnoForMoveTrash(PdsVO pds) throws Exception;
	
	
	
	//전사자료실 전용-------
	
	List<PdsVO> selectPdsListForAllEmpPds(PdsVO pds) throws Exception;
	List<PdsVO> selectAllEmpPdsListForTree() throws Exception;
	
}
