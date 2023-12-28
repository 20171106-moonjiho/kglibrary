package com.kg.library.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired private MemberService service ;
//	@Autowired private SeatService s_service;
//	@Autowired private AirplaneDataService a_service;
	@Autowired private HttpSession session;
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("loginProc")
	public String loginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/login";
	}

//	@RequestMapping("logout")
//	public String logout(RedirectAttributes ra) {
//		if(session.getAttribute("kakao") != null) {
//			kakaoService.unlink();
//		}
//		session.invalidate();
//		ra.addFlashAttribute("msg", "로그 아웃");
//		return "redirect:index";
//	}
}
