package kr.or.warehouse.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.warehouse.dto.MenuVO;
import kr.or.warehouse.service.MenuService;

@Component
public class McodeMaintainInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private MenuService menuService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String mCode = request.getParameter("mCode");
		if(mCode != null) {
			MenuVO menu = menuService.getMenuByMcode(mCode);
			modelAndView.addObject("menu", menu);
		}
	}


}
