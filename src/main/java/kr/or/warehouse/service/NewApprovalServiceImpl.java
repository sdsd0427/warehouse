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
import kr.or.warehouse.dao.NewApprovalDAO;
import kr.or.warehouse.dto.AllSignVO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.DepartmentVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.FieldVO;
import kr.or.warehouse.dto.MySignLineVO;
import kr.or.warehouse.dto.SignDocVO;
import kr.or.warehouse.dto.SignLineGrVO;
import kr.or.warehouse.dto.SignLineVO;
import kr.or.warehouse.dto.SignerVO;

@Service
public class NewApprovalServiceImpl implements NewApprovalService {

	@Autowired
	private NewApprovalDAO newApprovalDAO;

	// 관련문서
	@Override
	public Map<String, Object> getRelatedDocList(Criteria cri, String sFormNo) throws SQLException {

		int offset = cri.getStartRowNum();// 추가
		int limit = cri.getPerPageNum();// 추가
		RowBounds rowBounds = new RowBounds(offset, limit); // 추가

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("sFormNo", sFormNo);

		// System.out.println("sformno서비스:"+sformno);

		int totalCount = newApprovalDAO.selectRelatedDocListCount(paramMap);


		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SignDocVO> myRelateDocList = newApprovalDAO.selectRelatedDocList(paramMap, rowBounds);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("myRelateDocList", myRelateDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	// 참조자
	@Override
	public Map<String, Object> getRefLineList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();// 추가
		int limit = cri.getPerPageNum();// 추가
		RowBounds rowBounds = new RowBounds(offset, limit); // 추가

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());

		Map<String, Object> dataRefLine = new HashMap<String, Object>();
		List<EmployeeVO> myRefLineList = newApprovalDAO.selectRefLineList(paramMap, rowBounds);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myRefLineList.size());

		dataRefLine.put("myRefLineList", myRefLineList);
		dataRefLine.put("pageMaker", pageMaker);

		return dataRefLine;
	}

	// 조직도
	public List<OrganizationNode> organization(List<DepartmentVO> depList) {
		List<OrganizationNode> nodeList = new ArrayList<OrganizationNode>();

		for (DepartmentVO dep : depList) {
			OrganizationNode node = new OrganizationNode();
			node.setId(Integer.toString(dep.getDno()));
			node.setText(dep.getDname());
			if (dep.getUpdno() == 0) {
				node.setParent("#");
			} else {
				node.setParent(Integer.toString(dep.getUpdno()));
			}

			if (dep.getEmpList().size() > 0) {
				List<EmployeeVO> empList = dep.getEmpList();
				for (EmployeeVO emp : empList) {
					OrganizationNode childNode = new OrganizationNode();
					childNode.setId(Integer.toString(emp.getEno()));
					childNode.setText(emp.getName());
					childNode.setParent(Integer.toString(dep.getDno()));
					childNode.setIcon("fas fa-user");
					nodeList.add(childNode);
				}
			}
			node.setIcon("fas fa-building");
			nodeList.add(node);
		}
		return nodeList;
	}

	// 조직도 부서 찾기
	@Override
	public Map<String, Object> getDeptName(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SignDocVO> myDepList = newApprovalDAO.selectDeptName(cri, eno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(myDepList.size());

		dataMap.put("myDepList", myDepList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	// 결재선
	@Override
	public Map<String, Object> getSignLineList(Criteria cri, int dno) throws SQLException {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("dno", dno);

		// System.out.println("dno:서비스"+dno);

		Map<String, Object> dataSignLine = new HashMap<String, Object>();
		List<SignLineVO> mySignLineList = newApprovalDAO.selectSignLineList(paramMap);
		// System.out.println("service : " + mySignLineList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mySignLineList.size());

		dataSignLine.put("mySignLineList", mySignLineList);
		dataSignLine.put("pageMaker", pageMaker);

		return dataSignLine;

	}

	// 로그인한 사원 정보
	@Override
	public Map<String, Object> getContactList(Criteria cri, int eno) throws SQLException {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("eno", eno);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<EmployeeVO> myconList = newApprovalDAO.selectSearchContactList(paramMap);

		dataMap.put("myconList", myconList);

		return dataMap;
	}

	// 문서정보
	@Override
	public Map<String, Object> getSignDocNo() throws SQLException {

		Map<String, Object> dataSignDocMap = new HashMap<String, Object>();
		String DocNo = newApprovalDAO.selectSignDocNo();

		// System.out.println("DocNo:"+DocNo);
		dataSignDocMap.put("DocNo", DocNo);

		return dataSignDocMap;
	}

	// 문서결재 저장
	@Override
	public void registSignDoc(SignDocVO signDoc, List<String> signerMemberList, List<String> reFMemberList,
			List<String> viewerMemberList) throws Exception {

		// signDoc저장
		String signNo = newApprovalDAO.selectSignDocNo();
		signDoc.setSignNo(signNo);
		newApprovalDAO.insertSignDoc(signDoc);

		System.out.println("signNo:" + signNo);
		System.out.println("signDoc:" + signDoc);

		// 결재선 저장
		String signLineno = newApprovalDAO.selectSignLineNo();
		SignLineVO signLine = new SignLineVO();
		signLine.setSignLineNo(signLineno);
		signLine.setSignNo(signNo);
		newApprovalDAO.insertSignLine(signLine);

		// System.out.println("signLineno:"+signLineno);
		// System.out.println("signLine:"+signLine);

		// signer memberList - 우선순위
		// 결재자 저장
		int index = 0;
		for (String strEno : signerMemberList) {
			int eno = Integer.parseInt(strEno);

			// System.out.println("eno-우선순위"+eno);

//			int signRank = Integer.parseInt(newApprovalDAO.selectRankCode(eno));

			// System.out.println("signRank-우선순위:"+signRank);

			SignerVO signer = new SignerVO();
			signer.setSignLineno(signLineno);
			signer.setEno(eno);
//			signer.setSignRank(signRank);
			signer.setSignRank(++index);

			// System.out.println("결재자컨트롤러:"+signer);

			// 우선순위
			System.out.println("signer : " + signer);

			newApprovalDAO.insertSigner(signer);

			newApprovalDAO.updateSignCheckOfSignRank(signer.getSignLineno());
		}

		// 첨부파일 저장
		if (signDoc.getAttachList() != null)
			for (AttachVO attach : signDoc.getAttachList()) {
				System.out.println("attach서비스:" + attach);

				String attachNo = newApprovalDAO.selectSignAttachNo();
				attach.setAttachNo(attachNo);
				attach.setRefNo(signNo);
				newApprovalDAO.insertSignAttach(attach);
			}

		// 해시태그
		newApprovalDAO.insertApprovalHashTag(signDoc);

		// 참조자 저장
		for (String strEno : reFMemberList) {
			int eno = Integer.parseInt(strEno);

			System.out.println("eno-참조자" + eno);

			signDoc.setSignNo(signNo);
			signDoc.setEno(eno);

			System.out.println("참조자서비스:" + signDoc);

			newApprovalDAO.insertsignRef(signDoc);
		}

		// 열람자 저장
		for (String strEno : viewerMemberList) {
			int eno = Integer.parseInt(strEno);

			System.out.println("eno-열람자" + eno);

//			SignerVO signer = new SignerVO();
//			signer.setSignLineno(signLineno);
//			signer.setEno(eno);

			signDoc.setSignNo(signNo);
			signDoc.setEno(eno);

			System.out.println("열람자서비스:" + signDoc);

			newApprovalDAO.insertSignViewer(signDoc);
		}

	}


	// 문서결재 저장
	@Override
	public void reRegistSignDoc(SignDocVO signDoc, List<String> signerMemberList, List<String> reFMemberList,
			List<String> viewerMemberList) throws Exception {

		// signDoc저장
		signDoc.setSignNo(signDoc.getSignNo());
		newApprovalDAO.insertSignDoc(signDoc);

		// 결재선 저장
		String signLineno = newApprovalDAO.selectSignLineNo();
		SignLineVO signLine = new SignLineVO();
		signLine.setSignLineNo(signLineno);
		signLine.setSignNo(signDoc.getSignNo());
		newApprovalDAO.insertSignLine(signLine);

		// 결재자 저장
		int index = 0;
		for (String strEno : signerMemberList) {
			int eno = Integer.parseInt(strEno);
			SignerVO signer = new SignerVO();
			signer.setSignLineno(signLineno);
			signer.setEno(eno);
			signer.setSignRank(++index);

			// 우선순위
			newApprovalDAO.insertSigner(signer);

			newApprovalDAO.updateSignCheckOfSignRank(signer.getSignLineno());
		}

		// 첨부파일 저장
		if (signDoc.getAttachList() != null)
			for (AttachVO attach : signDoc.getAttachList()) {

				String attachNo = newApprovalDAO.selectSignAttachNo();
				attach.setAttachNo(attachNo);
				attach.setRefNo(signDoc.getSignNo());
				newApprovalDAO.insertSignAttach(attach);
			}

		// 해시태그
		newApprovalDAO.insertApprovalHashTag(signDoc);

		// 참조자 저장
		for (String strEno : reFMemberList) {
			int eno = Integer.parseInt(strEno);

			signDoc.setSignNo(signDoc.getSignNo());
			signDoc.setEno(eno);

			newApprovalDAO.insertsignRef(signDoc);
		}

		// 열람자 저장
		for (String strEno : viewerMemberList) {
			int eno = Integer.parseInt(strEno);

			signDoc.setSignNo(signDoc.getSignNo());
			signDoc.setEno(eno);

			newApprovalDAO.insertSignViewer(signDoc);
		}

	}





	// 개인결재선 그룹 저장
	@Override
	public String registSignGr(SignLineGrVO signLineGr, int eno, List<String> signerMemberList) throws SQLException {
		// 그룹 코드

		// System.out.println("signLineGr서비스:"+signLineGr);
		String signGroupNo = newApprovalDAO.selectSignGroupNo();
		signLineGr.setSignGroupNo(signGroupNo);
		signLineGr.setEno(eno);

		newApprovalDAO.insertSignLineGr(signLineGr);

		for (String strEno : signerMemberList) {

			MySignLineVO mySignLine = new MySignLineVO();
			mySignLine.setSignGroupNo(signGroupNo);

			int signerEno = Integer.parseInt(strEno);

//			int signRank = Integer.parseInt(newApprovalDAO.selectRankCode(signerEno));

			// 결재 사원들 저장
//			mySignLine.setSignRank(signRank);
			mySignLine.setEno(signerEno);

			newApprovalDAO.insertMySignLine(mySignLine);
		}
		// System.out.println("그룹서비스:"+signLineGr);

		return signGroupNo;
	}

	// 개인결재선 그룹리스트
	@Override
	public Map<String, Object> getSignLineGr(int eno) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SignLineGrVO> mySignGroupList = newApprovalDAO.selectSignLineGr(eno);

		dataMap.put("mySignGroupList", mySignGroupList);

		return dataMap;
	}

	// 개인결재선 그룹에 속한 사원 리스트
	@Override
	public Map<String, Object> getMySignMemberList(String signGroupNo) throws SQLException {

		Map<String, Object> SignGroupInfoMap = new HashMap<String, Object>();
		List<MySignLineVO> mySignGroupMemberList = newApprovalDAO.selectMySignMemberList(signGroupNo);

		SignGroupInfoMap.put("mySignGroupMemberList", mySignGroupMemberList);

		return SignGroupInfoMap;
	}

	// 개인결재선 그룹 삭제
	@Override
	public void removeSignGr(String signGroupNo) throws SQLException {
		newApprovalDAO.deleteSignGr(signGroupNo);
	}

	@Override
	public AttachVO getMailAttachByMaNo(String AttachNo) throws SQLException {
		return newApprovalDAO.selectSignAttachBySianAttachNo(AttachNo);
	}

	@Override
	public List<FieldVO> getFieldSetting(int eno) throws SQLException {
		List<FieldVO> fieldList = newApprovalDAO.selectFieldSetting(eno);
		return fieldList;
	}

	@Override
	public void insertFieldSetting(FieldVO field) throws SQLException {
		newApprovalDAO.insertFieldSetting(field);
	}

	@Override
	public void deleteField(int eno) throws SQLException {
		newApprovalDAO.deleteField(eno);
	}

	private Map<String, Integer> setNoneCheckCnt(List<AllSignVO> signDocList, int eno) throws SQLException {
		Map<String, Integer> noneCheckMap = new HashMap<String, Integer>();
		noneCheckMap.put("1", 0);
		noneCheckMap.put("2", 0);
		noneCheckMap.put("3", 0);
		noneCheckMap.put("4", 0);
		noneCheckMap.put("5", 0);
		noneCheckMap.put("0", 0);
		System.out.println("signDocList : " + signDocList);
		for (AllSignVO signDoc : signDocList) {
			if(signDoc.getSignerList() != null && signDoc.getSignerList().size() > 0) {				
				for(SignerVO signer : signDoc.getSignerList()) {
					if (signer.getEno() == eno && signer.getSignCheck() == 1) {
						addCnt(noneCheckMap, signDoc, eno, "1");
					}
					if (signer.getEno() == eno && signer.getSignCheck() == 4 && signer.getSignState() == 2) {
						addCnt(noneCheckMap, signDoc, eno, "2");
					}
					if (signer.getEno() == eno && signer.getSignCheck() == 2 && signer.getSignState() == 3) {
						addCnt(noneCheckMap, signDoc, eno, "3");
					}
					if (signer.getEno() == eno && signer.getSignCheck() == 3 && signer.getSignState() == 4) {
						addCnt(noneCheckMap, signDoc, eno, "4");
					}
					if (signer.getEno() == eno && signer.getSignCheck() == 2 && signer.getSignState() == 5) {
						addCnt(noneCheckMap, signDoc, eno, "5");
					}
				}
			}else {
				if(signDoc.getState() == 1) {
					addCnt(noneCheckMap, signDoc, eno, "1");
				}
				if(signDoc.getState() == 2) {
					addCnt(noneCheckMap, signDoc, eno, "2");
				}
				if(signDoc.getState() == 3) {
					addCnt(noneCheckMap, signDoc, eno, "3");
				}
				if(signDoc.getState() == 4) {
					addCnt(noneCheckMap, signDoc, eno, "4");
				}
				if(signDoc.getState() == 5) {
					addCnt(noneCheckMap, signDoc, eno, "5");
				}
			}
		}
		System.out.println("noneCheckMap : " + noneCheckMap);

		return noneCheckMap;
	}

	private void addCnt(Map<String, Integer> noneCheckMap, AllSignVO signDoc, int eno, String state)
			throws SQLException {
		int cnt = newApprovalDAO.signReadCheck(signDoc.getSignNo(), eno);
		if (cnt == 0) {
			noneCheckMap.put(state, noneCheckMap.get(state) + 1);
			noneCheckMap.put("0", noneCheckMap.get("0") + 1);
		}
	}

	// 결재문서함
	@Override
	public Map<String, Object> getApproveList(Criteria cri, int eno, int signState) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		paramMap.put("signState", signState);
		paramMap.put("signForm", cri.getSignForm());

		List<AllSignVO> approveList = newApprovalDAO.selectApproveList(paramMap, rowBounds);

		// 첨부파일 가져오기
		for (AllSignVO approve : approveList) {
			List<AttachVO> attachList = newApprovalDAO.selectSignAttachBySianNo(approve.getSignNo());
			approve.setAttachList(attachList);

			String drafter = newApprovalDAO.selectDrafter(approve.getSignNo());
			approve.setDrafter(drafter);
			System.out.println("결재 문서함 기안자 : " + drafter);

			String name = newApprovalDAO.selectNameOfLastSigner(approve.getSignNo());
			approve.setLastSigner(name);
		}

		// 리스트 갯수
		int totalCount = newApprovalDAO.selectApproveListCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("approveList", approveList);
		dataMap.put("signState", signState);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("totalCount", totalCount);

		return dataMap;
	}

	// 참조문서함
	@Override
	public Map<String, Object> getViewerList(Criteria cri, int eno, int state) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		paramMap.put("state", state);
		paramMap.put("signForm", cri.getSignForm());

		List<AllSignVO> viewerList = newApprovalDAO.selectViewerList(paramMap, rowBounds);

		System.out.println("Service viewerList : " + viewerList);

		// 첨부파일 가져오기
		for (AllSignVO approve : viewerList) {
			List<AttachVO> attachList = newApprovalDAO.selectSignAttachBySianNo(approve.getSignNo());
			approve.setAttachList(attachList);

			String drafter = newApprovalDAO.selectDrafter(approve.getSignNo());
			approve.setDrafter(drafter);

			String name = newApprovalDAO.selectNameOfLastSigner(approve.getSignNo());
			approve.setLastSigner(name);
			System.out.println("참조 문서함 최종결재자 : " + name);
		}

		// 리스트 갯수
		int totalCount = newApprovalDAO.selectViewerListCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("viewerList", viewerList);
		dataMap.put("state", state);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("totalCount", totalCount);

		return dataMap;
	}

	// 기안문서함
	@Override
	public Map<String, Object> getDraftList(Criteria cri, int eno, int state) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		paramMap.put("state", state);
		paramMap.put("signForm", cri.getSignForm());

		List<AllSignVO> draftList = newApprovalDAO.selectDraftList(paramMap, rowBounds);

		// 첨부파일 가져오기
		for (AllSignVO approve : draftList) {
			List<AttachVO> attachList = newApprovalDAO.selectSignAttachBySianNo(approve.getSignNo());
			approve.setAttachList(attachList);

			String name = newApprovalDAO.selectNameOfLastSigner(approve.getSignNo());
			approve.setLastSigner(name);
		}

		System.out.println("Service draftList : " + draftList);

		// 리스트 갯수
		int totalCount = newApprovalDAO.selectDraftListCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("draftList", draftList);
		dataMap.put("state", state);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("totalCount", totalCount);

		return dataMap;
	}

	// 임시문서함
	@Override
	public Map<String, Object> getTempList(Criteria cri, int eno, int state) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		paramMap.put("state", state);
		paramMap.put("signForm", cri.getSignForm());

		List<AllSignVO> tempList = newApprovalDAO.selectTempList(paramMap, rowBounds);

		// 첨부파일 가져오기
		for (AllSignVO approve : tempList) {
			List<AttachVO> attachList = newApprovalDAO.selectSignAttachBySianNo(approve.getSignNo());
			approve.setAttachList(attachList);

			String name = newApprovalDAO.selectNameOfLastSigner(approve.getSignNo());
			approve.setLastSigner(name);
		}

		// 리스트 갯수
		int totalCount = newApprovalDAO.selectTempListCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("tempList", tempList);
		dataMap.put("state", state);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("totalCount", totalCount);

		return dataMap;
	}

	// 회람함
	@Override
	public Map<String, Object> getCirculateList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);
		paramMap.put("signForm", cri.getSignForm());

		List<AllSignVO> circulateList = newApprovalDAO.selectCirculateList(paramMap, rowBounds);

		// 첨부파일 가져오기
		for (AllSignVO approve : circulateList) {
			List<AttachVO> attachList = newApprovalDAO.selectSignAttachBySianNo(approve.getSignNo());
			approve.setAttachList(attachList);

			String name = newApprovalDAO.selectNameOfLastSigner(approve.getSignNo());
			approve.setLastSigner(name);

			String drafter = newApprovalDAO.selectDrafter(approve.getSignNo());
			approve.setDrafter(drafter);
		}

		// 리스트 갯수
		int totalCount = newApprovalDAO.selectCirculateListCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("circulateList", circulateList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("totalCount", totalCount);

		return dataMap;
	}

	@Override
	public void addSignAttachList(AllSignVO allSign) throws SQLException {
		if (allSign == null)
			return;

		String signNo = allSign.getSignNo();
		List<AttachVO> attachList = newApprovalDAO.selectSignAttachBySianNo(signNo);

		allSign.setAttachList(attachList);
	}

	@Override
	public AllSignVO getSignDocBySignNo(String signNo) throws SQLException {
		AllSignVO allSign = newApprovalDAO.selectSignDocBySignNo(signNo);
		List<SignerVO> signerList = newApprovalDAO.selectSignerList(signNo);
		List<SignerVO> viewerList = newApprovalDAO.selectSignRefList(signNo);
		System.out.println(signerList);
		allSign.setSignRefList(viewerList);
		allSign.setSignerList(signerList);

		System.out.println("Service allSign : " + allSign);

		// 첨부파일
		addSignAttachList(allSign);

		newApprovalDAO.increaseDocViewCnt(signNo);

		return allSign;
	}

	@Override
	public AttachVO getSignAttachBySignAno(String attachNo) throws SQLException {
		return newApprovalDAO.selectSignAttachBySignAno(attachNo);
	}

	@Override
	public void updateSignRank(SignerVO signer) throws SQLException {
		newApprovalDAO.updateSignRank(signer);
	}

	@Override
	public void updateNextSignCheck(SignerVO signer) throws SQLException {
		newApprovalDAO.updateNextSignCheck(signer);
	}

	@Override
	public void updateLastSignState(String signLineno) throws SQLException {
		newApprovalDAO.updateLastSignState(signLineno);
	}

	@Override
	public void updateStateOfSignDoc(SignerVO signer) throws SQLException {
		newApprovalDAO.updateStateOfSignDoc(signer);
	}

	@Override
	public void updateSignStateByReject(SignerVO signer) throws SQLException {
		newApprovalDAO.updateSignStateByReject(signer);
	}

	@Override
	public void updateLowRankSignStateByReject(String signLineno) throws SQLException {
		newApprovalDAO.updateLowRankSignStateByReject(signLineno);
	}

	@Override
	public void updateSignStateByWait(SignerVO signer) throws SQLException {
		newApprovalDAO.updateSignStateByWait(signer);
	}

	@Override
	public void deleteSignDoc(String signNo) throws SQLException {
		newApprovalDAO.deleteSignDoc(signNo);
	}

	@Override
	public void deleteHashTag(String signNo) throws SQLException {
		newApprovalDAO.deleteHashTag(signNo);
	}

	@Override
	public Map<String, Integer> readCheck(int eno, String referMcode) throws SQLException {
		List<AllSignVO> allSign = null;

		if (referMcode.equals("M122000")) {
			allSign = newApprovalDAO.selectReadCheckApproveList(eno);
			for(AllSignVO sign : allSign) {
				List<SignerVO> signerList = newApprovalDAO.selectSignerList(sign.getSignNo());
				sign.setSignerList(signerList);
			}
		}

		if (referMcode.equals("M123000")) {
			allSign = newApprovalDAO.selectReadCheckViewerList(eno);
			
		}

		if (referMcode.equals("M124000")) {
			allSign = newApprovalDAO.selectReadCheckDraftList(eno);
		}
		Map<String, Integer> noneCheckCnt = setNoneCheckCnt(allSign, eno);

		return noneCheckCnt;
	}

	@Override
	public void insertSignReader(AllSignVO allSign) throws SQLException {
		newApprovalDAO.insertSignReader(allSign);
	}

	@Override
	public void updateSignerScehck(AllSignVO allSign) throws SQLException {
		newApprovalDAO.updateSignerScehck(allSign);
	}

	@Override
	public void updateSingDocScehck(AllSignVO allSign) throws SQLException {
		newApprovalDAO.updateSingDocScehck(allSign);
	}

	@Override
	public void updateSignViewerScehck(AllSignVO allSign) throws SQLException {
		newApprovalDAO.updateSignViewerScehck(allSign);
	}

	@Override
	public AllSignVO getReSignDocBySignNo(String signNo) throws SQLException {
		AllSignVO allSign = newApprovalDAO.selectSignDocBySignNo(signNo);

		allSign.setSignerList(newApprovalDAO.selectSignerList(signNo));
		allSign.setSignRefList(newApprovalDAO.selectSignRefList(signNo));
		allSign.setSignViewerList(newApprovalDAO.selectSignViewerList(signNo));
		allSign.setAttachList(newApprovalDAO.selectSignAttachBySianNo(signNo));


		return allSign;
	}

	@Override
	public void updateStateOfSignDocIng(SignerVO signer) throws SQLException {
		newApprovalDAO.updateStateOfSignDocIng(signer);
	}

	@Override
	public void insertApproveSignDoc(String signNo) throws SQLException {
		newApprovalDAO.insertApproveSignDoc(signNo);

	}

	public int selectReaderCount(AllSignVO allSign) throws SQLException{
		return newApprovalDAO.selectReaderCount(allSign);
	}

	@Override
	public void updateClassCodeHashTag(AllSignVO allSign) throws SQLException {
		newApprovalDAO.updateClassCodeHashTag(allSign);
	}

	@Override
	public void updateClassCodeSignDoc(AllSignVO allSign) throws SQLException {
		newApprovalDAO.updateClassCodeSignDoc(allSign);
	}

	@Override
	public Map<String, Object> getProceedingDraftDocList(Criteria cri, int eno) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String, Object>();

		cri.setPerPageNum(5);

		List<AllSignVO> draftList = newApprovalDAO.selectProceedingDraftList(cri, eno);

		int totalCount = newApprovalDAO.selectProceedingDraftTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("draftList", draftList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getRecentTempSaveDocList(Criteria cri, int eno) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String, Object>();

		cri.setPerPageNum(5);

		List<AllSignVO> tempList = newApprovalDAO.selectRecentTempSaveDocList(cri, eno);

		int totalCount = newApprovalDAO.selectRecentTempSaveDocTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("tempList", tempList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getSignMyTurnDocList(Criteria cri, int eno) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String, Object>();

		cri.setPerPageNum(5);

		List<AllSignVO> signList = newApprovalDAO.selectSignMyTurnDocList(cri, eno);

		for(AllSignVO doc : signList) {
			String lastSigner = newApprovalDAO.selectNameOfLastSigner(doc.getSignNo());
			doc.setLastSigner(lastSigner);
		}

		int totalCount = newApprovalDAO.selectSignMyTurnDocTotalCount(eno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("signList", signList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}



 }
