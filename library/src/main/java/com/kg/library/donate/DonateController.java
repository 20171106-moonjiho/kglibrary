package com.kg.library.donate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonateController {
@Autowired private DonateService service;
	
	// 도서 기증 목록보기--------------------------------
	@RequestMapping("/donateForm")
	public String donateForm(Model model) {
		service.donateForm(model);
		return "/donate/donateForm";
	}
	
	// 도서 기증--------------------------------
	@GetMapping("/donateWrite")
	public String donateWrite() {
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