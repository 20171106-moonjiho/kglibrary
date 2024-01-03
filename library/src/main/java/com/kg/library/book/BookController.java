package com.kg.library.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookController {

	@Autowired
	private BookService service;
	@Autowired 
	private HttpSession session;
	
	@RequestMapping("bookForm") // 도서 검색 url
	public String bookForm(String search,Model model,
			@RequestParam(value="currentPage", required = false)String cp) {
			String select = "select";	//검색 시 select 값으로 검색 확인.
			if(search == null || search.trim().isEmpty()) {
				search = ""; select = "all"; 
			}

			service.bookForm(cp, model, search, select); //DB 검색 및 정렬

		return "book/bookForm";
	}
	
	@RequestMapping("bookRegist") //도서 등록 url
	public String bookRegist() {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId != "admin" || sessionId.trim().isEmpty()) 
			return "redirect:bookform";
	//관리자가 아니면 등록 불가, 회원이 url을 직접적으로 치고 들어올 경우 반환하기 위하여 설정. 회원가입 확인 되면 주석 풀것
		return "book/bookRegist";
	}
	
	@RequestMapping("bookRegistProc")
	public String bookRegistProc(MultipartHttpServletRequest multi, RedirectAttributes ra) {

		String path = service.bookRegistProc(multi);
		return path;
	}
	
	@RequestMapping("bookContent")
	public String bookContent(String no,Model model) {
		
		BookDTO board = service.bookContent(no);
		if(board == null) {
			return "redirect:bookForm";
		}
		
		model.addAttribute("board", board);
		return "book/bookContent";
	}
	
}
