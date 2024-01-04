package com.kg.library.notice;

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
public class NoticeBoardController {
	@Autowired NoticeBoardService service;
	@Autowired
	private HttpSession session;
	
	//공지사항 메인
	@RequestMapping("noticeBoard")
	public String noticeBoard(@RequestParam(value="currentPage", required = false)String cp, Model model,String search_select,String search) {
		service.noticeBoard(search_select,search,cp,model);
		return "notice/noticeboard";
	}
	@RequestMapping("noticeBoard2")
	public String noticeBoard2(@RequestParam(value="currentPage", required = false)String cp, Model model,String search_select,String search) {
		service.noticeBoard(search_select,search,cp,model);
		return "notice/noticeboard2";
	}
	@RequestMapping("noticeboard_cal")
	public String noticeboard_cal() {
		
		return "notice/noticeboard_cal";
	}
	//공지사항 글쓰기
	@RequestMapping("noticeboard_write")
	public String noticeboard_write(){
//		String sessionID=(String)session.getAttribute("id");
//		if(sessionID==null) {
//			return "redirect:login";
//		}
		return "notice/noticeboard_write";
	}
	
	@PostMapping("noticeboard_writeProc")
	public String noticeboard_writeProc(MultipartHttpServletRequest multi) {
		String path = service.noticeboard_writeProc(multi);
		return path;
	}
	//공지사항 내용
	@RequestMapping("noticeboard_Content")
	public String noticeboard_Content(String no, Model model) {
		NoticeBoardDTO board = service.noticeboard_Content(no);
		if(board == null) {
			return "redirect:noticeboard";
		}
		model.addAttribute("board",board);
		return "notice/noticeboard_Content";
	}
	//공지사항 삭제
	@RequestMapping("ContentDeleteProc3")
	public String ContentDeleteProc3(String no) {
//		String sessionId = (String) session.getAttribute("id");
//		if(sessionId == null)
//			return "redirect:login";
//		
		String msg = service.ContentDeleteProc3(no);
//		if(msg.equals("작성자만 삭제 할 수 있습니다."))
//			return "redirect:noticeboard?no="+no;
//		
		return "redirect:noticeBoard";
	}
	//공지사항 수정
	@RequestMapping("noticeboard_Modify")
	public String noticeboard_Modify(String no, Model model) {
//		String sessionId = (String) session.getAttribute("id");
//		if(sessionId == null)
//			return "redirect:login";
		String path = service.noticeboard_Modify(no, model);
		return path;
	}
	
	@PostMapping("noticeboard_ModifyProc")
	public String noticeboard_ModifyProc(NoticeBoardDTO board, RedirectAttributes ra, MultipartHttpServletRequest multi) {
//		String sessionId = (String) session.getAttribute("id");
//		if(sessionId == null)
//			return "redirect:login";
		String msg = service.noticeboard_ModifyProc(board,multi);
		ra.addFlashAttribute("msg", msg);
		 
		if(msg.equals("게시글 수정 성공"))
			return "redirect:noticeboard_Content?no="+board.getNo();
		
		return "redirect:noticeboard_Modify?no="+board.getNo();
	}
}
