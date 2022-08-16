package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.TodoVO;

@Repository
public class TodoDAOImpl implements TodoDAO{

	@Autowired
	private SqlSession session;

	@Override
	public List<TodoVO> selectTodoList(int eno) throws SQLException {
		return session.selectList("Todo-Mapper.selectTodoList", eno);
	}

	@Override
	public void insertTodo(TodoVO todo) throws SQLException {
		session.insert("Todo-Mapper.insertTodo", todo);
	}

	@Override
	public TodoVO selectTodoByTodoNo(int todoNo) throws SQLException {
		return session.selectOne("Todo-Mapper.selectTodoByTodoNo", todoNo);
	}

	@Override
	public void deleteTodo(int todoNo) throws SQLException {
		session.delete("Todo-Mapper.deleteTodo", todoNo);
	}

	@Override
	public void updateTodo(TodoVO todo) throws SQLException {
		session.update("Todo-Mapper.updateTodo", todo);
	}

}
