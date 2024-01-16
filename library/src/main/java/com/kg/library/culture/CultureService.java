package com.kg.library.culture;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kg.library.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class CultureService {

	@Autowired
	private CultureMapper mapper;
	@Autowired
	private HttpSession session;
	private String filePath = "C:\\Users\\user1\\git\\kglibrary\\library\\src\\main\\resources\\static\\img\\";
	
	
	public void cultureboard(String search_select, String search, String cp, Model model) {

		//페이지 번호
		int currentPage = 1;// 현재 페이지

		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}
		
		if (search_select == null) {
			search_select = "";
		}
		
		int pageBlock = 10;// 한 페이지에 보일 데이터의 수.
		int end = pageBlock * currentPage;// 테이블에서 가져올 마지막 행 번호.
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행 번호.
		
		ArrayList<CultureDTO> boards = mapper.cultureboard(begin,end,search_select,search);
		
//		if(boards != null) {
//			for(CultureDTO b : boards) {
//				if(b.getImage()!=null) {
//					String[] names= b.getImage().split("/");
//					for(String name : names) {
//					System.out.println("name: " +name);
//					}
//					String[] fileNames = names[1].split("-",2);
//					for(String fileName : fileNames) {
//						System.out.println("fileName: " +fileName);
//						}
//					b.setImage(names[1]);
//					}
//			}
//		}
		int totalCount = mapper.totalCount(search_select, search); // 테이블의 행의 갯수 를 구해 오기위함
		if (totalCount == 0) {
			return;
		}
		
		String url = "cultureboard?search_select=" + search_select + "&search=" + search + "&currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);
		model.addAttribute("count", totalCount);
		model.addAttribute("boards", boards);
		model.addAttribute("result", result);
		model.addAttribute("search_select", search_select);
		model.addAttribute("search", search);
		
	}


	public String culture_writeProc(MultipartHttpServletRequest multi) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		String title = multi.getParameter("title");
		String class_period_start = multi.getParameter("class_period_start");
		String class_period_end = multi.getParameter("class_period_end");
		String reservation_period_start = multi.getParameter("reservation_period_start");
		String reservation_period_end = multi.getParameter("reservation_period_end");
		String target = multi.getParameter("target");
		String event_area = multi.getParameter("event_area");
		String reception_area = multi.getParameter("reception_area");
		String people = multi.getParameter("people");
		String teacher = multi.getParameter("teacher");
		String money = multi.getParameter("money");
		String contents = multi.getParameter("contents");
		contents = contents.replace("\r\n","<br>");
		if (title == null || title.trim().isEmpty()) {
			return "redirect:cultureboard";
		}
		
		CultureDTO board = new CultureDTO();
		board.setTitle(title);
		board.setClass_period_start(class_period_start);
		board.setClass_period_end(class_period_end);
		board.setReservation_period_start(reservation_period_start);
		board.setReservation_period_end(reservation_period_end);
		board.setTarget(target);
		board.setId(sessionId);
		board.setEvent_area(event_area);
		board.setReception_area(reception_area);
		board.setPeople(people);
		board.setMoney(money);
		board.setTeacher(teacher);
		board.setContents(contents);
		board.setImage("");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		MultipartFile file = multi.getFile("upfile");

		if (file.getSize() != 0) {
			// 파일이름
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime = sdf.format(new Date());
			String fileName = file.getOriginalFilename();

			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
			System.out.println("BoardService-boardWriteProc-suffix : " + suffix);
			if (suffix.equalsIgnoreCase("jpg") == false && suffix.equalsIgnoreCase("png") == false
					&& suffix.equalsIgnoreCase("jpeg") == false) {
				System.out.print("파일명이 다릅니다.");
				return "redirect:cultureboard";
			}

			// 파일의 저장 경로
			String fileSaveDirectory = filePath + sessionId;
			File f = new File(fileSaveDirectory);// 파일 객체 생성 으로 sessionId위치에 폴더가 있는지 없는지 확인 하기
			if (f.exists() == false) {
				// 저장경로가 없을 경우
				// f.mkdir();
				f.mkdirs();// 자동으로 만들어 줄 수 있게 한다.
			}
			// \\(역슬러시)를 /(슬러시로)
			String fullPath = fileSaveDirectory + "/" + fileTime + fileName;
			board.setImage(fullPath);
			f = new File(fullPath); // 파일 객체에 저장경로에 대한 정보 넣어주기.
			try {
				file.transferTo(f);// 파일 저장.
			} catch (IOException e) {
				e.printStackTrace();
				board.setImage("");// 예외가 발생하면 빈문자열을 넣어줄때.
			}
		}
		
		mapper.culture_writeProc(board);
		return "redirect:cultureboard";
	}


	public CultureDTO cultureContent(String no) {
		int n = 1;
		try {
			n = Integer.parseInt(no);
		}catch (Exception e) {
			return null;
		}
		CultureDTO board = mapper.cultureContent(n);
		
		if(board != null) {
			
			if(board.getImage()!=null) {
			String[] names=board.getImage().split("/");
			for(String name : names) {
			System.out.println("컨텐츠 name: " +name);
			}
			String[] fileNames = names[1].split("-",2);
			for(String fileName : fileNames) {
				System.out.println("fileName: " +fileName);
				}
			board.setImage(names[1]);
			}
		}
		
		return board;
	}

}
