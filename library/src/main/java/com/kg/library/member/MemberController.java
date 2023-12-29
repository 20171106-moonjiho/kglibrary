package com.kg.library.member;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kg.library.member.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired private MemberService service ;
	@Autowired private HttpSession session;	
	
	@RequestMapping("agree")
	public String agree() {
		return "member/agree";
	}
	
	@PostMapping("agreeProc")
	public String agreeProc(MemberDTO member, String postcode, String detailAddress, Model model, RedirectAttributes ra) {
		if(member.getAddress() != null && member.getAddress().trim().isEmpty() == false)
			member.setAddress( postcode + "," + member.getAddress() + "," + detailAddress);
		
		String msg = service.agreeProc(member);
		
		if(msg.equals("회원 등록 완료")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/agree";
	}
	
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

	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
//		if(session.getAttribute("kakao") != null) {
//			kakaoService.unlink();
//		}
		session.invalidate();
		ra.addFlashAttribute("msg", "로그 아웃");
		return "redirect:index";
	}
	
//	@RequestMapping("kakaoLogin")
//	public String kakaoLogin(String code) {
//		System.out.println("code : " + code);
//		kakaoService.getAccessToken(code);
//		kakaoService.getUserInfo();
//		
//		return "redirect:index";
//	}
//	@Autowired private KakaoService kakaoService;
	
//	@RequestMapping("mobileCheck")
//	@ResponseBody	
//	public String sendSMS(String mobile) { // 휴대폰 문자보내기
//		Random rand  = new Random(); //랜덤숫자 생성하기 !!
//        String numStr = "";
//        for(int i=0; i<4; i++) {
//            String ran = Integer.toString(rand.nextInt(10));
//            numStr+=ran;
//        }
//             
//    	service.certifiedPhoneNumber(mobile, numStr); //휴대폰 api 쪽으로 가기 !!
//    	// // 밑에 자세한 설명나옴
//     
//        return numStr;
//    }
	
	@RequestMapping("userInfo")
	public String userInfo(Model model,  RedirectAttributes ra) {
		String msg = service.userInfo(model);
		if(msg.equals("회원 검색 완료"))
			return "member/userInfo";
		
		ra.addFlashAttribute("msg", msg);
		return "redirect:index";
	}
	
	@RequestMapping("update")
	public String update() {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		return "member/update";
	}
	
	@PostMapping("updateProc")
	public String updateProc(MemberDTO member, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg = service.updateProc(member);
		if(msg.equals("회원 수정 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/update";
	}
	
	@RequestMapping("delete")
	public String delete() {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		return "member/delete";
	}
	
	@PostMapping("deleteProc")
	public String deleteProc(MemberDTO member, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg = service.deleteProc(member);
		if(msg.equals("회원 삭제 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/delete";
	}
	
	@RequestMapping("userHeader")
    public String userHeader() {
    	return "member/userHeader";
    }
    
    @RequestMapping("userFooter")
   	public String userFooter() {
   		return "member/userFooter";
  	}
}
