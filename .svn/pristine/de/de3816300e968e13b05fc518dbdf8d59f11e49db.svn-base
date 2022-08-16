package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.ManualDAO;
import kr.or.warehouse.dao.ManualReplyDAO;
import kr.or.warehouse.dto.ManualVO;
import kr.or.warehouse.dto.ReplyVO;

@Service
public class ManualReplyServiceImpl implements ManualReplyService{

	@Autowired
	private ManualReplyDAO manualReplyDAO;

	@Autowired
	private ManualDAO manualDAO;

	@Override
	public Map<String, Object> getReplyList(String refNo, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<ReplyVO> replyList = manualReplyDAO.selectReplyListPage(refNo,rowBounds);

		if(replyList!=null)for(ReplyVO reply : replyList) {
			String name = manualReplyDAO.selectName(reply.getRno());
			String photo = manualReplyDAO.selectPhoto(reply.getRno());
			reply.setName(name);
			reply.setPhoto(photo);
		}

		int count = manualReplyDAO.countReply(refNo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int getReplyListCount(String refNo) throws SQLException {
		return manualReplyDAO.countReply(refNo);
	}

	@Override
	public void registReply(ReplyVO reply) throws SQLException {
		String rno = manualReplyDAO.selectRno();
		reply.setRno(rno);
		manualReplyDAO.insertReply(reply);

	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		manualReplyDAO.updateReply(reply);
	}

	@Override
	public void removeReply(String rno) throws SQLException {
		manualReplyDAO.deleteReply(rno);
	}

}
