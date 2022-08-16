package kr.or.warehouse.controller.advisor;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.or.warehouse.dto.EmployeeVO;

@ControllerAdvice(basePackages = "kr.or.warehouse.controller.view")
public class ExceptionControllerAdvisor {
	
	@ExceptionHandler(SQLException.class)
	public String sqlExceptionPage(Exception e,Model model,
									HttpSession session){
		String url="error/sqlException";
		
		//logger.error(e.toString());
		e.printStackTrace();
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		model.addAttribute("exception",e);
		model.addAttribute("user",loginUser!=null ? loginUser.getName()+"님":"");
		
		return url;		
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String nullPointerExceptionPage(Exception e,Model model, HttpSession session){
		String url="error/500";
		
		//logger.error(e.toString());
		e.printStackTrace();
		
		model.addAttribute("exception",e);		
		
		return url;		
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionPage(Exception e, Model model, HttpSession session){
		String url="error/500";
		
		//logger.error(e.toString());
		e.printStackTrace();
		
		return url;		
	}
}
