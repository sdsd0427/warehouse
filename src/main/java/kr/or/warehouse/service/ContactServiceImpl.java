package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.controller.view.OrganizationNode;
import kr.or.warehouse.dao.ContactDAO;
import kr.or.warehouse.dto.ContactgrVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MycontactVO;

@Service
public class ContactServiceImpl implements ContactService{

	@Autowired
	private ContactDAO contactDAO;

	//전체주소록 리스트
	@Override
	public Map<String, Object> getContactList(Criteria cri) throws SQLException {

		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<EmployeeVO> myconList = contactDAO.selectSearchContactList(paramMap,rowBounds);

		int totalCount = contactDAO.selectSearchContactListCount(paramMap);
		
		//System.out.println("전체주소록:"+totalCount);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		//System.out.println("size : " + myconList.size());
		dataMap.put("myconList", myconList);
		dataMap.put("pageMaker", pageMaker);


		return dataMap;

	}

	//전체주소록 팀 클릭시 리스트
	@Override
	public Map<String, Object> getTeamContactList(Criteria cri, String dname) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		
		int totalCount = contactDAO.selectTeamContactListCount(dname);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<EmployeeVO> myconList = contactDAO.selectTeamContactList(cri, dname);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myconList", myconList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	
	//부서주소록
	@Override
	public Map<String, Object> getDepartmentList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<EmployeeVO> myDepartmenList = contactDAO.selectDepartment(paramMap,rowBounds);

		System.out.println("myDepartmenList :  " + myDepartmenList);
		int totalCount = contactDAO.selectDepartmentCount(paramMap);
		System.out.println("totalCount부서주소록:"+totalCount);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myDepartmenList", myDepartmenList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	

	//개인주소록 그룹된 사원 리스트
	@Override
	public Map<String, Object> getGroupInfoList(Criteria cri, String cogroupcode) throws SQLException {
		Map<String, Object> groupInfoMap = new HashMap<String, Object>();
		List<EmployeeVO> mygroupList = contactDAO.selectGroupInfoList(cri,cogroupcode);
		

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mygroupList.size());

		groupInfoMap.put("mygroupList",mygroupList);
		groupInfoMap.put("pageMaker", pageMaker);

		//그룹 Count
		String GroupCount = contactDAO.selectGroupCount(cogroupcode);
		groupInfoMap.put("GroupCount", GroupCount);
		
		return groupInfoMap;
		
	}


	//개인주소록 그룹 name등록
	@Override
	public String regist(ContactgrVO contactgr) throws SQLException {
		String cogroupcode = contactDAO.selectContactGrNo();
		contactgr.setCogroupcode(cogroupcode);
		contactDAO.insertGroup(contactgr);

		return cogroupcode;
	}

	//그룹된 사원들 정보 등록
	@Override
	public void registInfo(String cogroupcode, List<String> groupMember) throws SQLException {
		for(String strEno : groupMember) {
			int eno = Integer.parseInt(strEno);
			MycontactVO mycontact = new MycontactVO();
			mycontact.setCogroupcode(cogroupcode);
			mycontact.setEno(eno);
			contactDAO.insertGrInfo(mycontact);
		}
		
		
	}


	//그룹 지정
	@Override
	public String registGroupAssign(String cogroupcode, List<String> groupMember) throws SQLException {
		for(String strEno : groupMember) {
			int eno = Integer.parseInt(strEno);
			MycontactVO mycontact = new MycontactVO();

			mycontact.setCogroupcode(cogroupcode);
			mycontact.setEno(eno);

			contactDAO.insertGrInfo(mycontact);
		}
		return cogroupcode;
	}






	// 개인주소록 그룹 리스트
	@Override
	public Map<String, Object> getContactGroupList(Criteria cri,int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("eno", eno);
		
		List<ContactgrVO> mygroupList = contactDAO.selectGroupList(dataMap, rowBounds);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mygroupList.size());

		dataMap.put("mygroupList", mygroupList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	//개인주소록 전체리스트
	@Override
	public Map<String, Object> getPersonalList(Criteria cri,int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		Map<String, Object> dataPersonal = new HashMap<String, Object>();  //다름
		List<ContactgrVO> myPersonalList = contactDAO.selectPersonalList(paramMap,rowBounds); //다름

		int totalCount = contactDAO.selectPersonalListCount(paramMap);
		
		System.out.println("개인totalCount:"+totalCount);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataPersonal.put("myPersonalList", myPersonalList);
		dataPersonal.put("pageMaker", pageMaker);

		return dataPersonal;
	}


	//개인주소록 그룹 안 사원 삭제
	@Override
	public void remove(List<String> empList, String cogroupcode) throws SQLException {
		for(String enoStr : empList) {
			MycontactVO mycontact = new MycontactVO();
			int eno = Integer.parseInt(enoStr);
			mycontact.setEno(eno);
			mycontact.setCogroupcode(cogroupcode);
			contactDAO.deleteGrEmployee(mycontact);
		}
	}

	//그룹삭제
	@Override
	public void removeGr(String cogroupcode) throws SQLException {
		contactDAO.deleteGr(cogroupcode);
	}


	// 개인주소록 그룹 count리스트
//	@Override
//	public Map<String, Object> getGroupCountList(String cogroupcode) throws SQLException {
//		Map<String, Object> dataCountMap = new HashMap<String, Object>();
//		dataCountMap.put("cogroupcode", cogroupcode);
//		
//		List<MycontactVO> mygroupCountList = contactDAO.selectGroupCount(dataCountMap);
//
//		dataCountMap.put("mygroupCountList", mygroupCountList);
//
//		return dataCountMap;
//
//	}

	
	
	
	//-------------------------------- 초성 ---------------------------------------------------
	@Override
	public Map<String, Object> getGiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectGirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());

		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}
	
	
	
	
	@Override
	public Map<String, Object> getNiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectNirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getDiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectDirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getRiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectRirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getMiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectMirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getBiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectBirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getXiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectXirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getOiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectOirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getJiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectJirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getCiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectCirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getCaiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectCairstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getTiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectTirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getPiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectPirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> getHiList(Criteria cri) throws SQLException {
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.selectHirstList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public List<OrganizationNode> organization(List<DepartmentVO> depList) throws Exception {
		List<OrganizationNode> nodeList = new ArrayList<OrganizationNode>();

		for(DepartmentVO dep : depList) {
			OrganizationNode node = new OrganizationNode();
			node.setId(Integer.toString(dep.getDno()));
			node.setText(dep.getDname());
			if(dep.getUpdno() == 0) {
				node.setParent("#");
			}else {
				node.setParent(Integer.toString(dep.getUpdno()));
			}


			node.setIcon("fas fa-building");

			nodeList.add(node);
		}

		return nodeList;
	}

	
	

	
	
	
	
	
	//부서 초성
	@Override
	public Map<String, Object> DgetGiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myGiList = contactDAO.DselectGirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myGiList.size());
		dataGiMap.put("myconList", myGiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetNiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myNiList = contactDAO.DselectNirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myNiList.size());
		dataGiMap.put("myconList", myNiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetDiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myDiList = contactDAO.DselectDirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myDiList.size());
		dataGiMap.put("myconList", myDiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetRiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myRiList = contactDAO.DselectRirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myRiList.size());
		dataGiMap.put("myconList", myRiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetMiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myMiList = contactDAO.DselectMirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myMiList.size());
		dataGiMap.put("myconList", myMiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetBiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myBiList = contactDAO.DselectBirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myBiList.size());
		dataGiMap.put("myconList", myBiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetXiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myXiList = contactDAO.DselectXirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myXiList.size());
		dataGiMap.put("myconList", myXiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetOiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myOiList = contactDAO.DselectOirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myOiList.size());
		dataGiMap.put("myconList", myOiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetJiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myJiList = contactDAO.DselectJirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myJiList.size());
		dataGiMap.put("myconList", myJiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetCiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myCiList = contactDAO.DselectCirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myCiList.size());
		dataGiMap.put("myconList", myCiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetCaiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myCaiList = contactDAO.DselectCairstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myCaiList.size());
		dataGiMap.put("myconList", myCaiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetTiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myTiList = contactDAO.DselectTirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myTiList.size());
		dataGiMap.put("myconList", myTiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetPiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myPiList = contactDAO.DselectPirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myPiList.size());
		dataGiMap.put("myconList", myPiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> DgetHiList(Criteria cri, int dno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("dno", dno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.DselectHirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetGiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectGirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	
	
	@Override
	public Map<String, Object> PgetNiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectNirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetDiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectDirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetRiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectRirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetMiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectMirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetBiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectBirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetXiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectXirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetOiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectOirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetJiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectJirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetCiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectCirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetCaiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectCairstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetTiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectTirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetPiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectPirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

	@Override
	public Map<String, Object> PgetHiList(Criteria cri, int eno) throws SQLException {
		int offset=cri.getStartRowNum();//추가
		int limit=cri.getPerPageNum();//추가
		RowBounds rowBounds=new RowBounds(offset,limit); //추가
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		
		Map<String, Object> dataGiMap = new HashMap<String, Object>();
		List<EmployeeVO> myHiList = contactDAO.PselectHirstList(paramMap,rowBounds);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myHiList.size());
		dataGiMap.put("myconList", myHiList);
		dataGiMap.put("pageMaker", pageMaker);
		return dataGiMap;
	}

  
	




}
