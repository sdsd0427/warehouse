package kr.or.warehouse.service;

import java.util.List;

import kr.or.warehouse.dto.PdsNode;
import kr.or.warehouse.dto.PdsVO;

public interface PdsService {

	//수정
	List<PdsNode> pdsExplorer(List<PdsVO> pdsList) throws Exception;
	List<PdsVO> getPdsListByUpPno(PdsVO pds) throws Exception;
	
	
	List<PdsVO> getPdsListForTree(int eno) throws Exception;
	
	List<PdsVO> getPdsList(PdsVO pds) throws Exception;
	
	List<PdsVO> getTrashList(PdsVO pds) throws Exception;
	
	void uploadFile(PdsVO pds) throws Exception;
	
	PdsVO getPdsByPno(String pno) throws Exception;
	
	void removePdsByPno(String pno) throws Exception;
	
	void removeAllPdsByEno(int eno) throws Exception;
	
	void moveTrash(String pno) throws Exception;

	void recycleFile(String pno) throws Exception;
	
	List<PdsVO> getAllTrashByEno(int eno) throws Exception;
	
	List<PdsVO> getAllEmpPdsList(PdsVO pds) throws Exception;
	List<PdsVO> getAllEmpPdsListForTree() throws Exception;
	
	List<PdsVO> getTrashPdsListForTree(int eno) throws Exception;
	
}
