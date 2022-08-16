package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.WorkReplyDAO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.WorkReplyVO;

@Service
public class WorkReplyServiceImpl implements WorkReplyService{

	@Autowired
	private WorkReplyDAO workReplyDAO;

	@Override
	public Map<String, Object> getReplyList(String wcode, Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<WorkReplyVO> replyList = workReplyDAO.selectReplyList(wcode, cri);

		for(WorkReplyVO workReply : replyList) {
			EmployeeVO writer = workReplyDAO.selectReplyWriterByEno(workReply.getEno());
			workReply.setWriter(writer);
		}

		int totalCount = workReplyDAO.selectReplyTotalCount(wcode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void registReply(WorkReplyVO reply, int eno) throws SQLException {
		String wrno = workReplyDAO.selectMaxReplyNo();
		reply.setWrno(wrno);
		reply.setEno(eno);

		workReplyDAO.insertWorkReply(reply);
	}

	@Override
	public void deleteWorkReply(String wrno) throws SQLException {
		workReplyDAO.deleteWorkReply(wrno);
	}



}
