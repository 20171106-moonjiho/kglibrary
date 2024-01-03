package com.kg.library.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeBoardController {
	@Autowired NoticeBoardService service;
	@Autowired
	private HttpSession session;
	
	//공지사항 메인
	@RequestMapping("NoticeBoard")
	public String NoticeBoard() {
		return "notice/noticeboard";
	}
	
	//공지사항 글쓰기
	
	//공지사항 내용
	
	//공지사항 삭제
	
	//공지사항 수정
	
}
