package com.kg.library.donate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class DonateController {
@Autowired private DonateService service;
@Autowired private HttpSession session;	
	
	// 도서 기증 목록보기--------------------------------
	@RequestMapping("/donateForm")
	public String donateForm(String search, Model model, 
			@RequestParam(value="currentPage", required = false)String cp) {
		String select = "select";
		if(search == null || search.trim().isEmpty()) {
			search = "";
			select = "all";
		}
		
		service.donateForm(cp, model, search, select);
		return "/donate/donateForm";
	}
	
	// 도서 기증--------------------------------
	@GetMapping("/donateWrite")
	public String donateWrite() {	
		String msg = "";
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null) {
			msg="로그인 후 가능합니다.";
			return "redirect:login";
		}
		return "donate/donateWrite";
	}
	
	// 도서 기증 신청하기--------------------------------
	@PostMapping("/donateWriteProc")
	public String donateWriteProc(DonateDTO donate, Model model) {
		String msg = "";
		if(donate.getContent()==""||donate.getContent().trim().isEmpty()) {
			msg="내용을 입력하세요.";
			model.addAttribute("msg",msg);
			model.addAttribute("donate", donate);
			return "donate/donateWrite";
		}
		int res = service.donateWriteProc(donate);
		return "redirect:donateForm";
	}
}