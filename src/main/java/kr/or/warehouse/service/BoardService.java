package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.BoardVO;

public interface BoardService {
	// 게시판 목록조회
	Map<String,Object> getBoardList(Criteria cri, String temp, String temp2)throws SQLException;

	// 게시글 상세보기
	BoardVO getBoard(String boardNo)throws SQLException;

	// 게시글 등록
	void regist(BoardVO board)throws SQLException;

	// 게시글 수정
	void modify(BoardVO board)throws SQLException;

	// 게시글 삭제
	void remove(String boardNo)throws SQLException;

	// 첨부파일 조회
	AttachVO getAttachByAttachNo(String attachNo)throws SQLException;

	// 첨부파일 삭제
	void removeAttachByAttachNo(String attachNo)throws SQLException;
}
