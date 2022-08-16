package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.BoardVO;
import kr.or.warehouse.dto.ContactgrVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MycontactVO;

@Repository
public class ContactDAOImpl implements ContactDAO{

	@Autowired
	private SqlSession session;


	@Override
	public List<EmployeeVO> selectSearchContactList(Map<String, String> paramMap,RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.selectSearchContactList", paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> selectTeamContactList(Criteria cri, String dname) throws SQLException {
		return session.selectList("Contact-Mapper.selectTeamContactList",dname);
	}

	@Override
	public List<EmployeeVO> selectGroupInfoList(Criteria cri,String cogroupcode) throws SQLException {
		return session.selectList("Contact-Mapper.selectGroupInfoList",cogroupcode);
	}

	@Override
	public int selectSearchContactListCount(Map<String, String> paramMap) throws SQLException {
		return session.selectOne("Contact-Mapper.selectSearchContactListCount",paramMap);
	}


	//Gr

	@Override
	public String selectContactGrNo() throws SQLException {
		return session.selectOne("Contact-Mapper.selectContactGrNo");
	}


	@Override
	public void insertGroup(ContactgrVO contactgr) throws SQLException {
		session.insert("Contact-Mapper.insertGroup",contactgr);
	}

	@Override
	public void insertGrInfo(MycontactVO mycontact) throws SQLException {
		session.insert("Contact-Mapper.insertGrInfo",mycontact);
	}

	@Override
	public int selectEno(String cogroupcode) throws SQLException {
		return session.selectOne("Contact-Mapper.selectEno",cogroupcode);
	}


	@Override
	public List<ContactgrVO> selectGroupList(Map<String, Object> dataMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.selectGroupList", dataMap,rowBounds);
	}


	@Override
	public List<ContactgrVO> selectPersonalList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.selectPersonalList", paramMap,rowBounds);
	}

	@Override
	public void deleteGrEmployee(MycontactVO mycontact) throws SQLException {
		 session.delete("Contact-Mapper.deleteGrEmployee",mycontact);
	}

	@Override
	public void deleteGr(String cogroupcode) throws SQLException {
		session.delete("Contact-Mapper.deleteGr",cogroupcode);
	}

	
	
	@Override
	public List<EmployeeVO> selectDepartment(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.selectDepartment",paramMap,rowBounds);
	}

	@Override
	public int selectDepartmentCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Contact-Mapper.selectDepartmentCount",paramMap);
	}

	//그룹count
	@Override
	public String selectGroupCount(String cogroupcode) throws SQLException {
		return session.selectOne("Contact-Mapper.selectGroupCount",cogroupcode);
	}
	
	//개인 
	@Override
	public int selectPersonalListCount(Map<String, Object> paramMap) throws SQLException {
		return session.selectOne("Contact-Mapper.selectPersonalListCount",paramMap);
	}
	
	@Override
	public int selectTeamContactListCount(String dname) throws SQLException {
		return session.selectOne("Contact-Mapper.selectTeamContactListCount",dname);
	}
	
	
	//--------------------------  초성    ------------------------------

	@Override
	public List<EmployeeVO> selectGirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectGirstList");
	}
	@Override
	public List<EmployeeVO> selectNirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectNirstList");
	}
	@Override
	public List<EmployeeVO> selectDirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectDirstList");
	}
	@Override
	public List<EmployeeVO> selectRirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectRirstList");
	}
	@Override
	public List<EmployeeVO> selectMirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectMirstList");
	}
	@Override
	public List<EmployeeVO> selectBirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectBirstList");
	}
	@Override
	public List<EmployeeVO> selectXirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectXirstList");
	}
	@Override
	public List<EmployeeVO> selectOirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectOirstList");
	}
	@Override
	public List<EmployeeVO> selectJirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectJirstList");
	}
	@Override
	public List<EmployeeVO> selectCirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectCirstList");
	}
	@Override
	public List<EmployeeVO> selectCairstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectCairstList");
	}
	@Override
	public List<EmployeeVO> selectTirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectTirstList");
	}
	@Override
	public List<EmployeeVO> selectPirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectPirstList");
	}
	@Override
	public List<EmployeeVO> selectHirstList(Criteria cri) throws SQLException {
		return session.selectList("Contact-Mapper.selectHirstList");
	}

	//부서 초성
	@Override
	public List<EmployeeVO> DselectGirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectGirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectNirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectNirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectDirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectDirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectRirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectRirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectMirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectMirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectBirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectBirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectXirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectXirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectOirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectOirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectJirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectJirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectCirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectCirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectCairstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectCairstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectTirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectTirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectPirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectPirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> DselectHirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.DselectHirstList",paramMap,rowBounds);
	}

	
	
	//개인
	@Override
	public List<EmployeeVO> PselectGirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectGirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectNirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectNirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectDirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectDirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectRirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectRirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectMirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectMirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectBirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectBirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectXirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectXirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectOirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectOirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectJirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectJirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectCirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectCirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectCairstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectCairstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectTirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectTirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectPirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectPirstList",paramMap,rowBounds);
	}

	@Override
	public List<EmployeeVO> PselectHirstList(Map<String, Object> paramMap, RowBounds rowBounds) throws SQLException {
		return session.selectList("Contact-Mapper.PselectHirstList",paramMap,rowBounds);
	}

	

	

	

	
	





}
