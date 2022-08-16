package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.BoardReplyDAO;
import kr.or.warehouse.dto.ReplyVO;

@Service
public class BoardReplyServiceImpl implements BoardReplyService{
	@Autowired
	private BoardReplyDAO boardReplyDAO;

	@Override
	public Map<String, Object> getReplyList(String boardNo, Criteria cri) throws SQLException {
		System.out.println("rservice");
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ReplyVO> replyList = boardReplyDAO.selectReplyList(boardNo, cri);

		if(replyList!=null) for(ReplyVO reply : replyList) {
			String name = boardReplyDAO.selectName(reply.getRno());
			reply.setName(name);
			String photo = boardReplyDAO.selectPhoto(reply.getEno());
			reply.setPhoto(photo);
		}

		int count = boardReplyDAO.countReply(boardNo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int getReplyListCount(String boardNo) throws SQLException {
		int count = boardReplyDAO.countReply(boardNo);
		return count;
	}

	@Override
	public void registReply(ReplyVO reply) throws SQLException {
		System.out.println("registReplyservice");
		int eno = boardReplyDAO.selectEno(reply.getName());
		reply.setEno(eno);

		String replyNo = boardReplyDAO.selectReplyNo();
		reply.setRno(replyNo);
		boardReplyDAO.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		System.out.println("modireservice");
		boardReplyDAO.updateReply(reply);
	}

	@Override
	public void removeReply(String replyNo) throws SQLException {
		boardReplyDAO.deleteReply(replyNo);
	}

}
