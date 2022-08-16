package kr.or.warehouse.controller.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.MenuVO;
import kr.or.warehouse.dto.TodoVO;
import kr.or.warehouse.service.HrService;
import kr.or.warehouse.service.MenuService;
import kr.or.warehouse.service.TodoService;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private HrService hrService;

	@Autowired
	private TodoService todoService;

	@RequestMapping("/main")
	public String home(Model model, HttpSession session) throws Exception{
		String url = "common/home";

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		int eno = loginUser.getEno();

		EmployeeVO employee = hrService.getEmp(eno);
		List<TodoVO> todoList = todoService.getTodoList(eno);

		model.addAttribute("loginUser", loginUser);
		model.addAttribute("employee", employee);
		model.addAttribute("todoList", todoList);
		return url;
	}

	
}
