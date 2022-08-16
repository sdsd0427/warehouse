package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.warehouse.dto.TodoVO;

public interface TodoService {

	public List<TodoVO> getTodoList(int eno) throws SQLException;
	public void addTodo(TodoVO todo) throws SQLException;
	public TodoVO getTodoByTodoNo(int todoNo) throws SQLException;
	public void removeTodo(int todoNo) throws SQLException;
	public void modifyTodo(TodoVO todo) throws SQLException;
}
