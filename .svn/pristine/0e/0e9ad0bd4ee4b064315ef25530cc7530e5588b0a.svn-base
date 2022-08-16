package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<BoardVO> selectSearchBoardList(Map<String, String> paramMap,RowBounds rowBounds) throws SQLException {
		System.out.println("dao");
		return session.selectList("Board-Mapper.selectSearchBoardList", paramMap, rowBounds);
	}

	@Override
	public int selectSearchBoardListCount(Map<String, String> paramMap) throws SQLException {
		return session.selectOne("Board-Mapper.selectSearchBoardListCount",paramMap);
	}

	@Override
	public BoardVO selectBoardByBoardNo(String boardNo) throws SQLException {
		System.out.println("detaildao");
		return session.selectOne("Board-Mapper.selectBoardByBoardNo",boardNo);
	}

	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		System.out.println("insertdao");
		session.insert("Board-Mapper.insertBoard",board);
	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		System.out.println("filemodidao");
		session.update("Board-Mapper.updateBoard",board);
	}

	@Override
	public void deleteBoard(String boardNo) throws SQLException {
		session.delete("Board-Mapper.deleteBoard",boardNo);
	}

	@Override
	public void increaseViewCnt(String boardNo) throws SQLException {
		session.selectOne("Board-Mapper.increaseViewCnt",boardNo);
	}

	@Override
	public String selectNoticeNo() throws SQLException {
		return session.selectOne("Board-Mapper.selectNoticeNo");
	}

	@Override
	public String selectFreeNo() throws SQLException {
		return session.selectOne("Board-Mapper.selectFreeNo");
	}

	@Override
	public String selectEventNo() throws SQLException {
		return session.selectOne("Board-Mapper.selectEventNo");
	}

	@Override
	public String selectName(String boardNo) throws SQLException {
		return session.selectOne("Board-Mapper.selectName", boardNo);
	}
	@Override
	public int selectEno(String boardNo) throws SQLException {
		return session.selectOne("Board-Mapper.selectEno", boardNo);
	}

	@Override
	public String selectPhoto(int eno) throws SQLException {
		return session.selectOne("Board-Mapper.selectPhoto", eno);
	}

	@Override
	public List<BoardVO> selectFixBoardList(String temp) throws SQLException {
		return session.selectList("Board-Mapper.selectFixBoardList", temp);
	}


}
