package kr.or.warehouse.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.controller.view.OrganizationNode;
import kr.or.warehouse.dao.PdsDAO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.PdsNode;
import kr.or.warehouse.dto.PdsVO;

@Service
public class PdsServiceImpl implements PdsService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PdsServiceImpl.class);
	
	@Autowired
	private PdsDAO pdsDAO;
	
	@Override
	public List<PdsVO> getPdsListByUpPno(PdsVO pds) throws Exception {
		List<PdsVO> pdsList = null;
		pdsList = pdsDAO.selectPdsListByUpPno(pds);
		return pdsList;
	}
	
	@Override
	public List<PdsNode> pdsExplorer(List<PdsVO> pdsList){
		List<PdsNode> nodeList = new ArrayList<PdsNode>();
		PdsNode node = new PdsNode();

		for(PdsVO pds : pdsList) {
			node = new PdsNode();
			node.setId(pds.getPno());
			node.setText(pds.getFileName());
			
			String dist = pds.getDist();
			
			if(dist.equals("휴지통") ) {
				//휴지통
				if(pds.getUpPno().equals("#")) {
					node.setParent("#");
				}else{
					node.setParent(pds.getUpPno());
				}
				
				if(pds.getFolderYn() == 1) {
					for(PdsVO pdsIn : pdsList) {
						if(pds.getFolderYn() == 0) {
							PdsNode childNode = new PdsNode();
							childNode.setId(pdsIn.getPno());
							childNode.setText(pdsIn.getFileName());
							childNode.setParent(pds.getPno());
							childNode.setIcon("far fa-file");
							nodeList.add(childNode);
						}
					}
				}
				
				if(pds.getFolderYn() == 1) {
					node.setIcon("far fa-folder");
				} else {
					node.setIcon("far fa-file");
				}
				
				nodeList.add(node);
				
			}else if(dist.equals("개인자료실")){
				//개인자료실
				if(pds.getUpPno().equals("#")) {
					node.setParent("#");
				}else{
					node.setParent(pds.getUpPno());
				}
				
				if(pds.getFolderYn() == 1) {
					for(PdsVO pdsIn : pdsList) {
						if(pds.getFolderYn() == 0) {
							PdsNode childNode = new PdsNode();
							childNode.setId(pdsIn.getPno());
							childNode.setText(pdsIn.getFileName());
							childNode.setParent(pds.getPno());
							childNode.setIcon("far fa-file");
							nodeList.add(childNode);
						}
					}
				}
				
				if(pds.getFolderYn() == 1) {
					node.setIcon("far fa-folder");
				} else {
					node.setIcon("far fa-file");
				}
				
				nodeList.add(node);
				
			}else {
				//전사자료실
				if(pds.getUpPno().equals("#")) {
					node.setParent("#");
				}else{
					node.setParent(pds.getUpPno());
				}
				
				if(pds.getFolderYn() == 1) {
					for(PdsVO pdsIn : pdsList) {
						if(pds.getFolderYn() == 0) {
							PdsNode childNode = new PdsNode();
							childNode.setId(pdsIn.getPno());
							childNode.setText(pdsIn.getFileName());
							childNode.setParent(pds.getPno());
							childNode.setIcon("far fa-file");
							nodeList.add(childNode);
						}
					}
				}
				
				if(pds.getFolderYn() == 1) {
					node.setIcon("far fa-folder");
				} else {
					node.setIcon("far fa-file");
				}
				
				nodeList.add(node);
			}
			
		}

		return nodeList;
	}
	
	@Override
	public List<PdsVO> getPdsListForTree(int eno) throws Exception {
		List<PdsVO> pdsList = null;
		pdsList = pdsDAO.selectPdsListByEnoForTree(eno);
		return pdsList;
	}

	@Override
	public List<PdsVO> getPdsList(PdsVO pds) throws Exception {
		List<PdsVO> pdsList = null;
		pdsList = pdsDAO.selectPdsListByEno(pds);
		return pdsList;
	}
	
	@Override
	public List<PdsVO> getTrashList(PdsVO pds) throws Exception {
		List<PdsVO> pdsList = null;
		pds.setDist("휴지통");
		pdsList = pdsDAO.selectTrashListByEno(pds);
		return pdsList;
	}

	@Override
	public void uploadFile(PdsVO pds) throws Exception {
		//1.pno
		String pno = pdsDAO.selectPdsSeqNext();
		pds.setPno(pno);
		
		pdsDAO.insertFile(pds);
	}

	@Override
	public PdsVO getPdsByPno(String pno) throws Exception {
		PdsVO pds = null;
		pds = pdsDAO.selectPdsByPno(pno);
		if(pds != null) {
			int fileCnt = 0;		
			int dirCnt = 0;
			pds.setContent(showFileList(pds.getUploadPath()+"/"+pds.getFileName(), fileCnt, dirCnt));
			File dir = new File(pds.getUploadPath()+"/"+pds.getFileName());
			if(dir.isDirectory()) {
				long folderSize = getFolderSize(dir);
				pds.setFileSize(folderSize);
			}
		}
		
		return pds;
	}

	@Override
	public void moveTrash(String pno) throws Exception {
		PdsVO pds = pdsDAO.selectPdsByPno(pno);
		//폴더 여부 확인
		if(pds.getFolderYn() == 1) {
			//폴더면 한 번 더
			PdsVO temp = new PdsVO();
			
			//eno가 같아야 하고, 디렉토리가 같은 것, upPno가 pno와 같은 pno를 다시 찾아서 재귀호출
			temp.setEno(pds.getEno());
			temp.setUpPno(pds.getPno());
			temp.setSeparation(pds.getSeparation());
			
			List<PdsVO> tempList = pdsDAO.selectPdsListByEnoForMoveTrash(temp);
			for(PdsVO pdsVO : tempList) {
				//moveTrash 재귀호출
				moveTrash(pdsVO.getPno());
			}
		}
		String dist = "휴지통";
		pds.setDist(dist);
		pds.setDelYn(1);
		pds.setDelDate(new Date());
		pdsDAO.updateDelYnByPno(pds);
	}
	
	@Override
	public void recycleFile(String pno) throws Exception {
		PdsVO pds = pdsDAO.selectPdsByPno(pno);
		//폴더 여부 확인
		if(pds.getFolderYn() == 1) {
			//폴더면 한 번 더
			PdsVO temp = new PdsVO();
			
			//eno가 같아야 하고, 디렉토리가 같은 것, upPno가 pno와 같은 pno를 다시 찾아서 재귀호출
			temp.setEno(pds.getEno());
			temp.setUpPno(pds.getPno());
			temp.setSeparation(pds.getSeparation());
			
			List<PdsVO> tempList = pdsDAO.selectPdsListByEnoForMoveTrash(temp);
			for(PdsVO pdsVO : tempList) {
				//moveTrash 재귀호출
				recycleFile(pdsVO.getPno());
			}
		}
		String dist = pds.getSeparation();
		pds.setDist(dist);
		pds.setDelYn(0);
		pds.setDelDate(null);
		pdsDAO.updateDelYnByPno(pds);
		
	}
	
	@Override
	public void removePdsByPno(String pno) throws Exception {
		pdsDAO.deletePdsByPno(pno);
	}
	
	@Override
	public void removeAllPdsByEno(int eno) throws Exception {
		pdsDAO.deleteAllPdsByEno(eno);
	}
	
	@Override
	public List<PdsVO> getAllTrashByEno(int eno) throws Exception {
		List<PdsVO> pdsList = pdsDAO.selectAllTrashByPno(eno);
		return pdsList;
	}
	
	@Override
	public List<PdsVO> getAllEmpPdsList(PdsVO pds) throws Exception {
		List<PdsVO> pdsList = null;
		pdsList = pdsDAO.selectPdsListForAllEmpPds(pds);
		return pdsList;
	}
	
	
	//----------------------
	
	//폴더 내 파일 용량 합계
	private long getFolderSize(File folder) {
	    long length = 0;
	    length += folder.length();
	    File[] files = folder.listFiles();
	    int count = files.length;
	    for (int i = 0; i < count; i++) {
	        if (files[i].isFile()) {
	            length += files[i].length();
	        } else {
	            length += getFolderSize(files[i]);
	        }
	    }
	    return length;
	}
	
	
	//폴더 내 파일 개수 확인
	public String showFileList(String path, int fileCnt, int dirCnt) throws Exception {
//		System.out.println("폴더 : " + dirCnt);
//		System.out.println("파일 : " + fileCnt);
		
		String result = "-";
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		if(dir.isFile()) return result;
		
		File[] files = dir.listFiles();
		
	
		for (int i = 0; i < files.length; i++) {
			File file = files[i];

			if (file.isFile()) {
				fileCnt++;// 파일 개수 				
//				System.out.println("[File]" + file.getCanonicalPath().toString());				
//				System.out.println("[Directory CNT]" + file.getCanonicalPath().toString()+"  " +fileCnt);
				
			} else if (file.isDirectory()) {
				dirCnt++;
//				System.out.println("[Directory]" + file.getCanonicalPath().toString());
				
				try {
					showFileList(file.getCanonicalPath().toString(), fileCnt, dirCnt);
				} catch (Exception e) {
					
				}
			}
		}		
//		System.out.println(dir.getCanonicalPath().toString()+"  file :"+fileCnt+"  dirCnt:"+dirCnt);
		result = "폴더 "+dirCnt+",  파일 "+fileCnt;
//		System.out.println(result);
		return result;
	}

	@Override
	public List<PdsVO> getAllEmpPdsListForTree() throws Exception {
		return pdsDAO.selectAllEmpPdsListForTree();
	}

	@Override
	public List<PdsVO> getTrashPdsListForTree(int eno) throws Exception {
		return pdsDAO.selectTrashPdsListForTree(eno);
	}




}
