package com.kg.library.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeBoardController {
	@Autowired NoticeBoardService service;
	
	@RequestMapping("NoticeBoard")
	public String NoticeBoard() {
		return "notice/noticeboard";
	}
}
