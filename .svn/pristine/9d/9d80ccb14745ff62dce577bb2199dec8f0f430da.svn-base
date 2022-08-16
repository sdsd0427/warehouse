package kr.or.warehouse.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.BoardAttachDAO;
import kr.or.warehouse.dao.BoardDAO;
import kr.or.warehouse.dao.BoardReplyDAO;
import kr.or.warehouse.dao.HrDAO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.BoardVO;
import kr.or.warehouse.dto.ManualVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardAttachDAO boardAttachDAO;
	@Autowired
	private BoardReplyDAO boardReplyDAO;
	@Autowired
	private HrDAO hrDAO;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public Map<String, Object> getBoardList(Criteria cri, String temp, String temp2) throws SQLException {
		System.out.println("service");
		System.out.println(temp);

		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("temp", temp.toUpperCase());
		paramMap.put("temp2", temp2);

		List<BoardVO> tempList = boardDAO.selectSearchBoardList(paramMap,rowBounds);
		System.out.println("tempList:"+tempList);
		System.out.println(tempList.size());
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		List<BoardVO> fixBoardList = boardDAO.selectFixBoardList(temp.toUpperCase());

		for(BoardVO board : fixBoardList) {
			String name = boardDAO.selectName(board.getBoardNo());
			board.setName(name);
			String photo = boardDAO.selectPhoto(board.getEno());
			board.setPhoto(photo);
		}

		for(BoardVO board : tempList) {
			System.out.println(board);
			String name = boardDAO.selectName(board.getBoardNo());
			board.setName(name);
			if(temp.equals("n")) { //공지사항
				if((board.getClassCode()).equals("A101")){
					boardList.add(board);
				}
			}else if(temp.equals("f")) { //자유게시판
				if( (board.getClassCode()).equals("A102")){
					boardList.add(board);
				}
			}else { //경조사게시판
				if((board.getClassCode()).equals("A103")){
					boardList.add(board);
				}
			}
		}

		if(boardList!=null) {
			for(BoardVO board : boardList) {
				Date regDate = board.getRegDate();
				Date endDate = board.getEnddate();
				Date today = new Date();

				Calendar regDateCal = Calendar.getInstance();
				Calendar endDateCal = Calendar.getInstance();
				Calendar todayCal = Calendar.getInstance();
				regDateCal.setTime(regDate);
				endDateCal.setTime(endDate);
				todayCal.setTime(today);
				if(regDateCal.get(Calendar.YEAR) == todayCal.get(Calendar.YEAR) &&
						regDateCal.get(Calendar.MONTH) == todayCal.get(Calendar.MONTH) &&
						regDateCal.get(Calendar.DAY_OF_MONTH) == todayCal.get(Calendar.DAY_OF_MONTH)) {
					System.out.println("board : " + board.getBoardTitle());
					board.setNewCheck(1);
				}
				if(endDateCal.get(Calendar.YEAR) <= todayCal.get(Calendar.YEAR) &&
						endDateCal.get(Calendar.MONTH) <= todayCal.get(Calendar.MONTH) &&
						endDateCal.get(Calendar.DAY_OF_MONTH) <= todayCal.get(Calendar.DAY_OF_MONTH)) {
					board.setEndCheck(1);
				}
				addAttachList(board);
			}
		}

		if(fixBoardList != null) {
			for(BoardVO board : fixBoardList) {
				Date regDate = board.getRegDate();
				Date today = new Date();

				Calendar regDateCal = Calendar.getInstance();
				Calendar todayCal = Calendar.getInstance();
				regDateCal.setTime(regDate);
				todayCal.setTime(today);
				if(regDateCal.get(Calendar.YEAR) == todayCal.get(Calendar.YEAR) &&
						regDateCal.get(Calendar.MONTH) == todayCal.get(Calendar.MONTH) &&
						regDateCal.get(Calendar.DAY_OF_MONTH) == todayCal.get(Calendar.DAY_OF_MONTH)) {
					System.out.println("board : " + board.getBoardTitle());
					board.setNewCheck(1);
				}
				addAttachList(board);
			}
		}

		for (BoardVO board : boardList) {
			int replyCnt = boardReplyDAO.countReply(board.getBoardNo());
			board.setReplyCnt(replyCnt);
		}


		int totalCount = boardDAO.selectSearchBoardListCount(paramMap);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		Date today = new Date();
		String date = sdf.format(today);
		Map<String, String> selectWeekStEd = null;
		try {
			selectWeekStEd = hrDAO.selectWeekStEd(date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String weekStart = selectWeekStEd.get("WEEKSTART");
		String weekEnd = selectWeekStEd.get("WEEKEND");
		System.out.println("weekStart" + weekStart);
		System.out.println("weekEnd" + weekEnd);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		System.out.println(boardList);
		dataMap.put("boardList", boardList);
		dataMap.put("fixBoardList", fixBoardList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("weekStart", weekStart);
		dataMap.put("weekEnd", weekEnd);

		return dataMap;
	}

	@Override
	public BoardVO getBoard(String boardNo) throws SQLException {
		System.out.println("boardNo : "+ boardNo);
		BoardVO board = boardDAO.selectBoardByBoardNo(boardNo);
		String name = boardDAO.selectName(board.getBoardNo());
		board.setName(name);
		String photo = boardDAO.selectPhoto(board.getEno());
		board.setPhoto(photo);
		boardDAO.increaseViewCnt(boardNo);

		int replycnt = boardReplyDAO.countReply(board.getBoardNo());
		board.setReplyCnt(replycnt);

		addAttachList(board);
		return board;
	}

	@Override
	public void regist(BoardVO board) throws SQLException {
		System.out.println("registservice");

		int eno = boardDAO.selectEno(board.getName());
		board.setEno(eno);

		if(board.getClassCode().equals("A101")) { //공지사항
			String noticeNo = boardDAO.selectNoticeNo();
			board.setBoardNo(noticeNo);
			boardDAO.insertBoard(board);

			if(board.getAttachList()!=null) {
				for(AttachVO attach : board.getAttachList()) {
					String attachNo = boardAttachDAO.selectAttachNo();
					attach.setRefNo(noticeNo);
					attach.setEno(board.getEno());
					attach.setAttachNo(attachNo);
					boardAttachDAO.insertAttach(attach);
				}
			}

		}else if(board.getClassCode().equals("A102")) { //자유게시판
			String freeNo= boardDAO.selectFreeNo();
			board.setBoardNo(freeNo);
			boardDAO.insertBoard(board);

			if(board.getAttachList()!=null) {
				for(AttachVO attach : board.getAttachList()) {
					String attachNo = boardAttachDAO.selectAttachNo();
					attach.setRefNo(freeNo);
					attach.setEno(board.getEno());
					attach.setAttachNo(attachNo);
					boardAttachDAO.insertAttach(attach);
				}
			}

		}else { //경조사게시판
			String eventNo = boardDAO.selectEventNo();
			board.setBoardNo(eventNo);
			boardDAO.insertBoard(board);

			if(board.getAttachList()!=null) {
				for(AttachVO attach : board.getAttachList()) {
					String attachNo = boardAttachDAO.selectAttachNo();
					attach.setRefNo(eventNo);
					attach.setEno(board.getEno());
					attach.setAttachNo(attachNo);
					boardAttachDAO.insertAttach(attach);
				}
			}
		}
	}

	@Override
	public void modify(BoardVO board) throws SQLException {

		int eno = boardDAO.selectEno(board.getName());

		if(board.getAttachList()!=null) {
			for(AttachVO attach : board.getAttachList()) {
				String attachNo = boardAttachDAO.selectAttachNo();
				attach.setRefNo(board.getBoardNo());
				System.out.println(board.getEno());
				attach.setAttachNo(attachNo);
				attach.setEno(eno);
				boardAttachDAO.insertAttach(attach);
			}
		}
		boardDAO.updateBoard(board);
	}

	@Override
	public void remove(String boardNo) throws SQLException {
		boardReplyDAO.deleteAllReply(boardNo);
		boardAttachDAO.deleteAllAttach(boardNo);
		boardDAO.deleteBoard(boardNo);
	}

	@Override
	public AttachVO getAttachByAttachNo(String attachNo) throws SQLException {
		AttachVO attach = boardAttachDAO.selectAttachByAttachNo(attachNo);
		return attach;
	}

	@Override
	public void removeAttachByAttachNo(String attachNo) throws SQLException {
		boardAttachDAO.deleteAttach(attachNo);
	}

	//첨부파일
	private void addAttachList(BoardVO board) throws SQLException {
		System.out.println("file");

		if (board == null) return;

		String boardNo = board.getBoardNo();
		List<AttachVO> attachList = boardAttachDAO.selectAttachByBoardNo(boardNo);
		board.setAttachList(attachList);
	}

}
