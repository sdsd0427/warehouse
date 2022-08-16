package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.BoardVO;

public interface BoardDAO {
	// 게시판 목록조회
	List<BoardVO> selectSearchBoardList(Map<String, String> paramMap,RowBounds rowBounds) throws SQLException;
	//상단고정
	List<BoardVO> selectFixBoardList(String temp) throws SQLException;
	int selectSearchBoardListCount(Map<String, String> paramMap) throws SQLException;

	// 게시글 상세보기
	BoardVO selectBoardByBoardNo(String boardNo) throws SQLException;
	String selectName(String boardNo) throws SQLException;
	String selectPhoto(int eno) throws SQLException;

	//BoardVO selectBoardByImage (String imageFile) throws SQLException;

	// 게시글 등록
	void insertBoard(BoardVO board) throws SQLException;
	int selectEno(String boardNo) throws SQLException;

	//게시글 수정
	void updateBoard(BoardVO board) throws SQLException;

	// 게시글 삭제
	void deleteBoard(String boardNo) throws SQLException;

	// 조회수 증가
	void increaseViewCnt(String boardNo) throws SQLException;

	// 게시판번호 증가
	String selectNoticeNo() throws SQLException;
	String selectFreeNo() throws SQLException;
	String selectEventNo() throws SQLException;
}
