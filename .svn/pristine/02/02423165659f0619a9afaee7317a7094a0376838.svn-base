package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.CooperReqVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.ObjectionVO;
import kr.or.warehouse.dto.ProxyReqVO;
import kr.or.warehouse.dto.WorkManagerVO;
import kr.or.warehouse.dto.WorkReportVO;
import kr.or.warehouse.dto.WorkVO;

@Repository
public class WorkDAOImpl implements WorkDAO{

	@Autowired
	SqlSession session;

	@Override
	public List<WorkVO> selectMyWorkList(int eno,String wstatus, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("wstatus", wstatus);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());

		return session.selectList("Work-Mapper.selectMyWorkList", param, rowBounds);
	}

	@Override
	public List<WorkManagerVO> selectWorkManagerList(String wcode) throws SQLException {
		return session.selectList("Work-Mapper.selectWorkManagerList", wcode);
	}

	@Override
	public EmployeeVO selectWorkRequestBy(String wcode) throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkRequestBy", wcode);
	}

	@Override
	public int selectMyWorkTotalCount(int eno, String wstatus, Criteria cri) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("wstatus", wstatus);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());

		return session.selectOne("Work-Mapper.selectMyWorkTotalCount", param);

	}

	@Override
	public List<WorkVO> selectMyWorkAllStatusList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Work-Mapper.selectMyWorkAllStatusList", param,rowBounds);
	}

	@Override
	public List<WorkVO> selectToReqAllStatusList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Work-Mapper.selectToReqAllStatusList", param,rowBounds);
	}

	@Override
	public List<WorkVO> selectToReqList(int eno, String wstatus, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("wstatus", wstatus);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());

		return session.selectList("Work-Mapper.selectToReqList", param, rowBounds);
	}

	@Override
	public int selectToReqTotalCount(int eno, String wstatus, Criteria cri) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("wstatus", wstatus);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectOne("Work-Mapper.selectToReqTotalCount", param);
	}

	@Override
	public List<WorkVO> selectDepWorkAllStatusList(int dno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dno", dno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Work-Mapper.selectDepWorkAllStatusList", param, rowBounds);
	}

	@Override
	public List<WorkVO> selectDepWorkList(int dno, String wstatus, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dno", dno);
		param.put("wstatus", wstatus);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());

		return session.selectList("Work-Mapper.selectDepWorkList", param, rowBounds);
	}

	@Override
	public int selectDepWorkTotalCount(int dno, String wstatus, Criteria cri) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dno", dno);
		param.put("wstatus", wstatus);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());

		return session.selectOne("Work-Mapper.selectDepWorkTotalCount", param);
	}

	@Override
	public int workReadCheck(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);

		return session.selectOne("Work-Mapper.workReadCheck", param);
	}

	@Override
	public String selectHashTagByWcode(String wcode) throws SQLException {
		return session.selectOne("Work-Mapper.selectHashTagByWcode",wcode);
	}

	@Override
	public int selectEnoByKeyword(String keyword) throws SQLException {
		return session.selectOne("Work-Mapper.selectEnoByKeyword", keyword);
	}

	@Override
	public List<WorkVO> selectMyWorkReadCheckList(int eno, Criteria cri) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Work-Mapper.selectMyWorkAllStatusList", param);
	}

	@Override
	public List<WorkVO> selectToReqReadCheckList(int eno, Criteria cri) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eno", eno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Work-Mapper.selectToReqAllStatusList", param);
	}

	@Override
	public List<WorkVO> selectDepWorkReadCheckList(int dno, Criteria cri) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dno", dno);
		param.put("searchType", cri.getSearchType());
		param.put("keyword", cri.getKeyword());
		return session.selectList("Work-Mapper.selectDepWorkAllStatusList", param);
	}

	@Override
	public WorkVO selectWorkByWcode(String wcode) throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkByWcode", wcode);
	}

	@Override
	public void updateMyWork(WorkVO work) throws SQLException {
		session.update("Work-Mapper.updateMyWork", work);
	}

	@Override
	public void updateWorkHashTag(WorkVO work) throws SQLException {
		session.update("Work-Mapper.updateWorkHashTag", work);
	}

	@Override
	public void insertCooperReq(CooperReqVO cooper) throws SQLException {
		session.insert("Work-Mapper.insertCooperReq", cooper);
	}

	@Override
	public void updateWorkWstatus(String wcode, String wstatus, String classcode) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("wstatus", wstatus);
		param.put("classcode", classcode);
		session.update("Work-Mapper.updateWorkWstatus", param);
	}

	@Override
	public CooperReqVO selectCooperReq(String wcode) throws SQLException {
		return session.selectOne("Work-Mapper.selectCooperReq", wcode);
	}

	@Override
	public EmployeeVO selectCooperRequesterByEno(int eno) throws SQLException {
		return session.selectOne("Work-Mapper.selectCooperRequesterByEno", eno);
	}

	@Override
	public EmployeeVO selectEmpByNodeId(int eno) throws SQLException {
		return session.selectOne("Work-Mapper.selectEmpByNodeId", eno);
	}

	@Override
	public void deleteWorkManager(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);
		session.delete("Work-Mapper.deleteWorkManager", param);
	}

	@Override
	public void insertNewWorkManager(WorkManagerVO manager) throws SQLException {
		session.insert("Work-Mapper.insertNewWorkManager", manager);
	}

	@Override
	public void updateToReq(WorkVO work) throws SQLException {
		session.update("Work-Mapper.updateToReq", work);
	}

	@Override
	public void updateCooperReqApprove(String wcode) throws SQLException {
		session.update("Work-Mapper.updateCooperReqApprove", wcode);
	}

	@Override
	public void updateWorkManagerAnswer(String wcode, int eno, String answer) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);
		param.put("answer", answer);

		session.update("Work-Mapper.updateWorkManaswerAnswer", param);
	}

	@Override
	public void updateHashTagClassCode(String wcode, String classcode) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("classcode", classcode);

		session.update("Work-Mapper.updateHashTagClassCode",param);
	}

	@Override
	public void insertObjection(ObjectionVO obj) throws SQLException {
		session.insert("Work-Mapper.insertObjection", obj);
	}

	@Override
	public ObjectionVO selectObjection(String wcode, int eno, int result) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);
		param.put("result", result);
		return session.selectOne("Work-Mapper.selectObjection", param);
	}

	@Override
	public void updateObjectionApprove(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);
		session.update("Work-Mapper.updateObjectionApprove", param);
	}

	@Override
	public void insertProxyReq(ProxyReqVO proxy) throws SQLException {
		session.insert("Work-Mapper.insertProxyReq", proxy);
	}

	@Override
	public ProxyReqVO selectProxyReq(String wcode) throws SQLException {
		return session.selectOne("Work-Mapper.selectProxyReq", wcode);
	}

	@Override
	public void updateProxyReqApprove(String wcode) throws SQLException {
		session.update("Work-Mapper.updateProxyReqApprove", wcode);
	}

	@Override
	public void updateCooperReqRefuse(String wcode, String content) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("content", content);
		session.update("Work-Mapper.updateCooperReqRefuse", param);
	}

	@Override
	public void updateObjectionRefuse(String wcode, int eno ,String content) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("content", content);
		param.put("eno", eno);
		session.update("Work-Mapper.updateObjectionRefuse", param);
	}

	@Override
	public void updateProxyReqRefuse(String wcode, String content) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("content", content);
		session.update("Work-Mapper.updateProxyReqRefuse", param);
	}

	@Override
	public void deleteWorkReader(String wcode) throws SQLException {
		session.delete("Work-Mapper.deleteWorkReader", wcode);
	}

	@Override
	public void insertWorkReader(String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wcode", wcode);
		param.put("eno", eno);
		session.update("Work-Mapper.insertWorkReader", param);
	}

	@Override
	public List<WorkVO> selectThisWeekEndMyWorkList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);


		return session.selectList("Work-Mapper.selectThisWeekEndMyWorkList", eno, rowBounds);
	}

	@Override
	public int selectThisWeekEndMyWorkTotalCount(int eno) throws SQLException {
		return session.selectOne("Work-Mapper.selectThisWeekEndMyWorkTotalCount", eno);
	}

	@Override
	public List<WorkVO> selectThisWeekEndToReqList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Work-Mapper.selectThisWeekEndToReqList", eno, rowBounds);
	}

	@Override
	public int selectThisWeekEndToReqTotalCount(int eno) throws SQLException {
		return session.selectOne("Work-Mapper.selectThisWeekEndToReqTotalCount", eno);
	}

	@Override
	public List<WorkVO> selectNotApproveMyWorkList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Work-Mapper.selectNotApproveMyWorkList", eno, rowBounds);
	}

	@Override
	public int selectNotApproveMyWorkTotalCount(int eno) throws SQLException {
		return session.selectOne("Work-Mapper.selectNotApproveMyWorkTotalCount", eno);
	}

	@Override
	public List<WorkVO> selectWaitToReqWorkList(int eno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Work-Mapper.selectWaitToReqWorkList", eno, rowBounds);
	}

	@Override
	public int selectWaitToReqWorkTotalCount(int eno) throws SQLException {
		return session.selectOne("Work-Mapper.selectWaitToReqWorkTotalCount", eno);
	}

	@Override
	public void insertKnowHow(String wcode) throws SQLException {
		session.insert("Knowhow-Mapper.insertKnowHow", wcode);
	}

	@Override
	public void increaseKnowHowViewCnt(String wcode) throws SQLException {
		session.update("Knowhow-Mapper.increaseKnowHowViewCnt", wcode);
	}

	@Override
	public void insertWork(WorkVO work) throws Exception {
		session.update("Work-Mapper.insertWork", work);
	}

	@Override
	public List<String> selectWcodeByDno(int dno) throws Exception {
		return session.selectList("Work-Mapper.selectWcodeByDno", dno);
	}

	@Override
	public void insertWorkManager(WorkManagerVO workManager) throws Exception {
		session.update("Work-Mapper.insertWorkManager", workManager);
	}

	@Override
	public void insertWorkHashTag(WorkVO work) throws Exception {
		session.update("Work-Mapper.insertWorkHashTag", work);
	}

	@Override
	public void updateWorkManagerWmStep(WorkManagerVO workmanager) throws SQLException {
		session.update("Work-Mapper.updateWorkManagerWmStep", workmanager);
	}

	@Override
	public void insertWorkReport(WorkReportVO workReport) throws SQLException {
		session.insert("Work-Mapper.insertWorkReport", workReport);
	}

	@Override
	public List<WorkVO> selectRelationMentoWork(Criteria cri, String wcode, int eno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("eno", eno);
		param.put("wcode", wcode);
		param.put("keyword", cri.getKeyword());

		return session.selectList("Work-Mapper.selectRelationMentoWork", param, rowBounds);
	}

	@Override
	public int selectRelationMentoWorkCount(Criteria cri, String wcode, int eno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("eno", eno);
		param.put("wcode", wcode);
		param.put("keyword", cri.getKeyword());

		return session.selectOne("Work-Mapper.selectRelationMentoWorkCount", param);
	}

	@Override
	public List<WorkReportVO> selectWorkReportList(int result, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("Work-Mapper.selectWorkReportList", result, rowBounds);
	}

	@Override
	public int selectWorkReportListTotalCount(int result) throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkReportListTotalCount", result);
	}

	@Override
	public WorkReportVO selectWorkReportByWrepNo(int wrepno) throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkReportByWrepNo", wrepno);
	}

	@Override
	public void approveWorkReport(int wrepno) throws SQLException {
		session.update("Work-Mapper.approveWorkReport", wrepno);
	}

	@Override
	public List<String> selectHashTagListByWcode(String wcode) throws SQLException {
		return session.selectList("Work-Mapper.selectHashTagListByWcode", wcode);
	}


}
