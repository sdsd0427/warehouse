package kr.or.warehouse.controller.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.warehouse.dto.MenuVO;
import kr.or.warehouse.service.MenuService;

@Controller
public class MainController {
	@Autowired
	private MenuService menuService;

	@RequestMapping("/index")
	public String indexPage(@RequestParam(defaultValue = "M000000") String mCode, Model model) throws Exception{
		String url = "common/indexPage";
		List<MenuVO> mainMenuList = menuService.getMainMenuList();
		MenuVO menu = menuService.getMenuByMcode(mCode);

		model.addAttribute("mainMenuList", mainMenuList);
		model.addAttribute("menu",menu);

		return url;
	}
}
