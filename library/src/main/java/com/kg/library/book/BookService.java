package com.kg.library.book;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kg.library.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class BookService {

	private String filePath = "C:\\Users\\User\\git\\kglibrary\\library\\src\\main\\resources\\static\\img\\";
	@Autowired IBookMapper mapper;
	@Autowired 
	private HttpSession session;
	
	public void bookForm(String cp, Model model, String search, String select) { //책 검색 게시판
	
			int currentPage = 1;
			try{
				currentPage = Integer.parseInt(cp);
			}catch(Exception e){
				currentPage = 1;
			}
			
			int pageBlock = 10; // 한 페이지에 보일 데이터의 수 
			int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
			int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
			

			List<BookDTO> boards = mapper.bookForm(begin, end, select, search); //도서 리스트
			int totalCount = mapper.totalCount(select, search); //도서 리스트가 0인지 아닌지
			if(totalCount == 0) { // db에 리스트 정보가 없으면(0) 되돌아 감.
				return ;
			}
			
			String url = "bookForm?currentPage=";
			String result = PageService.printPage(url, totalCount, pageBlock, currentPage);
			

			model.addAttribute("count", totalCount);
			model.addAttribute("boards", boards);
			model.addAttribute("result", result);
		}

	public String bookRegistProc(MultipartHttpServletRequest multi) { // 책 등록
			
			
			String sessionId = (String) session.getAttribute("id");
			if (sessionId == null)
				return "redirect:login";
	
			
			LocalDateTime currentTime = LocalDateTime.now(); // 현재 시간 가져오기
			Timestamp borrowtime = Timestamp.valueOf(currentTime); //형변환
		
			int book_count = Integer.parseInt(multi.getParameter("book_count")); //책 갯수
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			
			String fullPath = "";
			
			MultipartFile file = multi.getFile("upfile");
			if(file.getSize() != 0) {	//클라이언트라 파일을 업로드 했다면
				// 파일 이름
				sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
				String fileTime = sdf.format(new Date());
				String fileName = file.getOriginalFilename();
				
				String suffix = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
				System.out.println("bookRegist-suffix : " + suffix);
				if(suffix.equalsIgnoreCase("jpg") == false)
					return "redirect:bookRegist";
				
				// 파일 저장 경로
				String fileSaveDirectory = filePath + sessionId;
				File f = new File(fileSaveDirectory);
				if(f.exists() == false) {// 파일이 없다면
					f.mkdirs(); //폴더 생성
				}
				System.out.println(fileSaveDirectory);
				//String suffix = fileName.substring(beginIndex)
							
				fullPath =fileSaveDirectory + "\\" + fileTime + fileName;
				System.out.println("이미지 경로 " + fullPath);
			 //	board.setImage(fullPath);
				
				f = new File(fullPath);
				try {
				file.transferTo(f); //파일 저장
				}catch(Exception e) {
					e.printStackTrace();
					fullPath = "";	//		board.setImage("");
				}
				/*
				 * file.transferTo(); 파일을 이동시키는 기능
				 * <input type="file" name= "upfile"을 사용하여 서버에 파일 데이터가 전달되면 웹서버가 
				 * 임시파일로 저장을 함. 임시파일로 저장된 파일을 개발자가 원하는 대로 이동 시킬 때 사용함.
				 * 
				 */
			}
			
			
			for(int i = 1; i <= book_count; i++) {
			BookDTO board = new BookDTO();
			
			/*
			 * String detail_link = multi.getParameter("detail_link"); if(detail_link ==
			 * null || detail_link.trim().isEmpty()) { // 상세주소 안받았을 시
			 * board.setDetail_link("자세한 사항 없음"); }else {
			 * board.setDetail_link(multi.getParameter("detail_link")); }
			 */
						
			board.setCategory(multi.getParameter("category")); // 카테고리
			board.setTitle_info(multi.getParameter("title_info")); // 제목
			board.setAuthor_info(multi.getParameter("author_info")); // 저작자
			
			String pub_info = multi.getParameter("pub_info");
			if(pub_info == null || pub_info.trim().isEmpty()) { //발행자가 없을 때 저작자와 동일
			board.setPub_info(multi.getParameter("author_info"));} 
			else { //발행자
			board.setPub_info(pub_info);}
			
			board.setPub_year_info(multi.getParameter("pub_year_info")); // 발행연도
			board.setReg_date(sdf.format(new Date())); //비치일(등록 시간)
			board.setDetail_link("자세한 사항 없음"); //상세 페이지 경로
			board.setImage(fullPath);
			board.setBorrowperson("대여 가능"); //빌린 사람
			board.setBook_count(i); // 동일한 책 번호(책 갯수)
			board.setBorrowdate(borrowtime);
			
			String donation = multi.getParameter("donation"); 
			if(donation == null || donation.trim().isEmpty()) { // 기증자가 없을 시
			board.setDonation("없음"); }
			else {
			board.setDonation(donation); }

			System.out.println(board.getCategory());	
			System.out.println(board.getTitle_info());	
			System.out.println(board.getAuthor_info());	
			System.out.println(board.getPub_info());	
			System.out.println(board.getPub_year_info());	
			System.out.println(board.getReg_date());	
			System.out.println(board.getDetail_link());	
			System.out.println(board.getImage());	
			System.out.println(board.getBorrowperson());	
			System.out.println(board.getBook_count());	
			System.out.println(board.getDonation());	

			mapper.bookRegistProc(board);
			}
			
			return "redirect:bookForm";
			//조회수랑 게시글 번호는 Insert 명령 시 입력.

			//bdto.setId((String)session.getAttribute("id"));
			//mapper.boardWriteProc(bdto);
			
			//String sessionNo = (String)session.getAttribute("no");

	}

	public BookDTO bookContent(String no, Model model) { // 책 상세정보
		
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
			return null;
		}
		
		BookDTO board = mapper.bookContent(n);
		if(board != null) {
			System.out.println("image name = " + board.getImage());
			
			if(board.getImage() != null) {
				String[] names = board.getImage().split("\\\\");
				
				for(String name : names)
					System.out.println("BoardService-boardContent name : "+ name);
				String[] fileNames = names[12].split("-", 2);
				for(String fileName : fileNames)
					System.out.println("BoardService-boardContent fileName : "+ fileName);
				
				board.setImage(names[12]);
			}
		}
		
		// 7일 후의 시간 계산
		LocalDateTime storedTime = board.getBorrowdate().toLocalDateTime(); //DB 값 형 변환
        LocalDateTime rentalday = storedTime.plus(Duration.ofDays(7)); //대여 종료 시점
        
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); //보이기용
		String rentaldate = rentalday.format(formatter);//보이기용 형변환

        model.addAttribute("rentaldate", rentaldate);
		return board;
	}

	public void rentalProc(String no,String sessionId) { // 대여
		
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
		}
		
		LocalDateTime currentTime = LocalDateTime.now(); //대여 시간, 현재 시간 가져오기 
		Timestamp borrowtime = Timestamp.valueOf(currentTime); //형변환
			
		mapper.rentalProc(n, sessionId, borrowtime);
		
	}

	public void returnProc(String no) { // 반납
		
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
		}
		
		String borrowperson = "대여 가능";
		
		mapper.returnProc(n, borrowperson);
		
	}

	public void bookDeleteProc(String no) {
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
		}
		
		mapper.bookDeleteProc(n);
	}
		
	
	
	
}
