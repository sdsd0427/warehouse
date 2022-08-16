package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.TodoVO;

public interface TodoDAO {

	public List<TodoVO> selectTodoList(int eno) throws SQLException;
	public void insertTodo(TodoVO todo) throws SQLException;
	public TodoVO selectTodoByTodoNo(int todoNo) throws SQLException;
	public void deleteTodo(int todoNo) throws SQLException;
	public void updateTodo(TodoVO todo) throws SQLException;
}
