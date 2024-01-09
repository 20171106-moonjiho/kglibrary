package com.kg.library.board;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired private BoardService service;
	@Autowired HttpSession session;
	
	@RequestMapping("list")
	public String getList(String pageNum, Model model) {
		service.getList(pageNum, model);
		return "board/list";
	}
	
	@RequestMapping("writeForm")
	public String writeForm(
			@RequestParam(value="num", required = false, defaultValue = "0")String num,
			@RequestParam(value="ref", required = false, defaultValue = "1")String ref,
			@RequestParam(value="step", required = false, defaultValue = "0")String step, 
			@RequestParam(value="depth", required = false, defaultValue = "0")String depth,
			Model model) {
		//  ↑ num,ref,step,depth의 값이 들어올때 없다면 default값으로 설정해 주겠다는 코드
		// 새글인지 답글인지 알기위해서 화면을 보여주는 writeForm에서 부터 num,ref,step,depth를 정의해서 writeForm으로
		// 전달해준다. writeForm에서도 writeProc으로 위 값들을 hidden 형식으로 전달해 준다.
		// num : 게시글 번호
		// ref : 게시글 및 댓글 그룹 번호
		// step : 같은 계층의 댓글의 순서 번호
		// depth : 댓글 대댓글 대대댓글 구분 번호
		
		model.addAttribute("num",num);
		model.addAttribute("ref",ref);
		model.addAttribute("step",step);
		model.addAttribute("depth",depth);
		
		return "board/writeForm";
	}
	@PostMapping("writeProc")
	public String writeProc(BoardDTO borad,HttpServletRequest req) {//HttpServletRequest req - IP떄문에 필요
		service.writeProc(borad, req);
		return "redirect:list";
	}
	
	@RequestMapping("content")
	public String content(
			@RequestParam(value = "num", required = false)String n,
			String pageNum, Model model) {
		BoardDTO board = service.content(n); 
		if(board==null) {
			return "redirect:list?pageNum="+pageNum;
		}
		
		model.addAttribute("sdf", new SimpleDateFormat("yyyy-MM-dd HH:mm"));
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/content";
	}
	
	@RequestMapping("deleteForm")//강사님이랑 다른코드
	public String deleteForm(
			@RequestParam(value = "num", required = false)String num,
			String pageNum, Model model) {
		BoardDTO board = service.deleteForm(num); 
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "board/deleteForm";
	}

	@PostMapping("deleteProc2")//강사님이랑 다른코드
	public String deleteProc(@RequestParam(value="num", required = false) String num,
			String pageNum, String pass) {
		String msg = service.deleteProc(num,pass);
		if(msg.equals("비밀번호가 틀립니다.")) {
			return "redirect:deleteForm?num="+num+"&pageNum="+pageNum;
		}
			return "redirect:list?pageNum="+pageNum;
	}

	@RequestMapping("updateForm")
	public String updateForm(
			@RequestParam(value = "num", required = false)String num,
			String pageNum, Model model) {
		
		BoardDTO board = service.updateForm(num); 
		
		if(board == null)
			return "redirect:list?pageNum="+pageNum;
		
		model.addAttribute("board", board );
		model.addAttribute("pageNum", pageNum);//페이지를 유지 하기 위해.
		
		return "board/updateForm";
	}
	
	@PostMapping("updateProc2")
	public String updateProc(BoardDTO board, String pageNum) {
		int check = service.updateProc(board);
		if(check==1) {
			return "redirect:list?pageNum="+pageNum;
		}else{
			return "redirect:updateForm?num="+board.getNum()+"&pageNum="+pageNum;
		}
	}

}
