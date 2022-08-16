package kr.or.warehouse.controller.view;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/common")
public class LoginController {

	@RequestMapping("/loginForm")
	public String loginForm(@RequestParam(defaultValue = "") String error, HttpServletResponse response) {
		String url="common/loginForm";

		if (error.equals("-1")) {
			response.setStatus(302);
		}
		return url;
	}

	@RequestMapping("/profileRegistForm")
	public String profileRegistForm()throws Exception {
		String url="common/profileRegist";
		return url;
	}

	@RequestMapping("/security/accessDenied")
	public String accessDenied() throws Exception {
		String url = "security/accessDenied";
		return url;
	}

	@RequestMapping("/loginTimeOut")
	public String loginTimeOut(Model model)throws Exception{
		String url = "security/sessionOut";

		model.addAttribute("message", "세션이 만료되었습니다.\\n다시 로그인하세요.");
		return url;
	}
}
