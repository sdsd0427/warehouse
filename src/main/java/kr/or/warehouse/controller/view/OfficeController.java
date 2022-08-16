package kr.or.warehouse.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/office")
public class OfficeController {

	@RequestMapping("/wordRegistForm")
	public String word() throws Exception{
		String url = "office/word";

		return url;
	}

	@RequestMapping("/excelRegistForm")
	public String excel() throws Exception{
		String url = "office/excel";

		return url;
	}

}
