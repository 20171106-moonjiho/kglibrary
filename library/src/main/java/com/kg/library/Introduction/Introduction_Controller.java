package com.kg.library.Introduction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import jakarta.servlet.http.HttpSession;

@Controller
public class Introduction_Controller {

	//공지사이드바 템플릿
	@RequestMapping("Introductionheader")
	public String Introductionheader() {
		return "Introduction/Introductionheader";
	}
	
	@RequestMapping("Introductionfooter")
	public String Introductionfooter() {
		return "Introduction/Introductionfooter";
	}
	@RequestMapping("introduction")
	public String introduction(Model model) {
		model.addAttribute("menu","introduction");
		return "Introduction/introduction";
	}
	@RequestMapping("map")
	public String map(Model model) {
		model.addAttribute("menu","map");
		return "Introduction/map";
	}
	
}
