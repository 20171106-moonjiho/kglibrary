
package com.kg.library;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kg.library.notice.NoticeBoardService;

@Controller
public class HomeController {
	@Autowired
	private NoticeBoardService notice_service;
	@RequestMapping("index")
	public void index() {}
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}	
	@RequestMapping("main")
	public String main(Model model) {
		notice_service.main_board(model);
		return "default/main";
	}
	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}

}
