package com.kg.library.culture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpSession;

@Controller
public class CultureController {

	@Autowired
	private HttpSession session;
	@Autowired
	CultureService service;
	
	
	//공지사이드바 템플릿
		@RequestMapping("cultureheader")
		public String cultureheader() {
			return "culture/cultureheader";
		}
		
		@RequestMapping("culturefooter")
		public String culturefooter() {
			return "culture/culturefooter";
		}
		
	@RequestMapping("cultureboard")
	public String cultureboard(@RequestParam(value="currentPage", required = false)String cp, Model model,String search_select,String search) {
		service.cultureboard(search_select,search,cp,model);
		model.addAttribute("menu", "cultureboard");
		return "culture/cultureboard";
	}
	
	@RequestMapping("cultureWrite")
	public String cultureWrite(Model model) {
		model.addAttribute("menu", "cultureboard");
		String sessionID=(String)session.getAttribute("id");
		if(sessionID==null) {
			return "redirect:login";
		}
		return "culture/cultureWrite";
	}
	
	@RequestMapping("culture_writeProc")
	public String culture_writeProc(MultipartHttpServletRequest multi) {
		String path = service.culture_writeProc(multi);
		return path;
	}
	
	@RequestMapping("cultureContent")
	public String cultureContent(String no,Model model) {
		CultureDTO board = service.cultureContent(no);
		if(board == null) {
			return "redirect:cultureboard";
		}
		model.addAttribute("menu", "cultureboard");
		model.addAttribute("board", board);
		return "culture/cultureContent";
	}
	
	
}
