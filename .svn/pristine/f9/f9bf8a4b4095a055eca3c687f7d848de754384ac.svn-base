package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.dao.TodoDAO;
import kr.or.warehouse.dto.TodoVO;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDAO todoDAO;

	@Override
	public List<TodoVO> getTodoList(int eno) throws SQLException {
		return todoDAO.selectTodoList(eno);
	}

	@Override
	public void addTodo(TodoVO todo) throws SQLException {
		todoDAO.insertTodo(todo);
	}

	@Override
	public TodoVO getTodoByTodoNo(int todoNo) throws SQLException {
		return todoDAO.selectTodoByTodoNo(todoNo);
	}

	@Override
	public void removeTodo(int todoNo) throws SQLException {
		todoDAO.deleteTodo(todoNo);
	}

	@Override
	public void modifyTodo(TodoVO todo) throws SQLException {
		todoDAO.updateTodo(todo);
	}

}
