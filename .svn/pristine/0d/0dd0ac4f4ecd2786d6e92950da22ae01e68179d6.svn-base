package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.controller.view.OrganizationNode;
import kr.or.warehouse.dto.BoardVO;
import kr.or.warehouse.dto.ContactgrVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MycontactVO;

public interface ContactService {

	Map<String,Object> getContactList(Criteria cri)throws SQLException;

	Map<String,Object> getTeamContactList(Criteria cri, String dname)throws SQLException;

	Map<String, Object>getGroupInfoList(Criteria cri, String cogroupcode)throws SQLException;


	//Gr

	//그룹 등록
	String regist(ContactgrVO contactgr)throws SQLException;

	//그룹 사원들 등록
	void registInfo(String cogroupcode, List<String>groupMember) throws SQLException;

	// 그룹지정 등록
	String registGroupAssign(String cogroupcode, List<String>groupMember) throws SQLException;

	Map<String,Object> getContactGroupList(Criteria cri,int eno)throws SQLException;

	//개인주소록 전체리스트
	Map<String, Object>getPersonalList(Criteria cri,int eno)throws SQLException;

	//개인주소록 그룹 안 사원 삭제
	void remove(List<String> empList, String cogroupcode) throws SQLException;

	//개인주소록 그룹 삭제
	void removeGr(String cogroupcode) throws SQLException;

	//부서주소록
	Map<String,Object> getDepartmentList(Criteria cri, int dno)throws SQLException;

	//count
	//Map<String, Object>getGroupCountList(String cogroupcode)throws SQLException;


	
	// 초성-------------------------------------------------------------------------
	
	//개인
	Map<String,Object> PgetGiList(Criteria cri,int eno)throws SQLException;
	
	Map<String,Object> PgetNiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetDiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetRiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetMiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetBiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetXiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetOiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetJiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetCiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetCaiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetTiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetPiList(Criteria cri,int eno)throws SQLException;
	Map<String,Object> PgetHiList(Criteria cri,int eno)throws SQLException;
	
	
	//부서 초성
	Map<String,Object> DgetGiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetNiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetDiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetRiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetMiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetBiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetXiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetOiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetJiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetCiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetCaiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetTiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetPiList(Criteria cri,int dno)throws SQLException;
	Map<String,Object> DgetHiList(Criteria cri,int dno)throws SQLException;
	//전체 초성
	Map<String,Object> getGiList(Criteria cri)throws SQLException;
	Map<String,Object> getNiList(Criteria cri)throws SQLException;
	Map<String,Object> getDiList(Criteria cri)throws SQLException;
	Map<String,Object> getRiList(Criteria cri)throws SQLException;
	Map<String,Object> getMiList(Criteria cri)throws SQLException;
	Map<String,Object> getBiList(Criteria cri)throws SQLException;
	Map<String,Object> getXiList(Criteria cri)throws SQLException;
	Map<String,Object> getOiList(Criteria cri)throws SQLException;
	Map<String,Object> getJiList(Criteria cri)throws SQLException;
	Map<String,Object> getCiList(Criteria cri)throws SQLException;
	Map<String,Object> getCaiList(Criteria cri)throws SQLException;
	Map<String,Object> getTiList(Criteria cri)throws SQLException;
	Map<String,Object> getPiList(Criteria cri)throws SQLException;
	Map<String,Object> getHiList(Criteria cri)throws SQLException;

	//조직도
	public List<OrganizationNode> organization(List<DepartmentVO> depList) throws Exception;






}
