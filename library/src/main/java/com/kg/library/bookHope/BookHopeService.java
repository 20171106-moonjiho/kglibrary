package com.kg.library.bookHope;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.kg.library.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class BookHopeService {

	private String filePath = "C:\\Users\\User\\git\\kglibrary\\library\\src\\main\\resources\\static\\img\\";
	@Autowired IBookHopeMapper mapper;
	@Autowired 
	private HttpSession session;
	
	public void bookHopeForm(String cp, Model model, String search, String select) { //책 검색 게시판
	
			int currentPage = 1;
			try{
				currentPage = Integer.parseInt(cp);
			}catch(Exception e){
				currentPage = 1;
			}
			
			int pageBlock = 10; // 한 페이지에 보일 데이터의 수 
			int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
			int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
			

			List<BookHopeDTO> boards = mapper.bookHopeForm(begin, end, select, search); //도서 리스트
			int totalCount = mapper.totalCount(select, search); //희망 도서 리스트가 0인지 아닌지
			if(totalCount == 0) { // db에 리스트 정보가 없으면(0) 되돌아 감.
				return ;
				
			}
			
			String url = "bookHopeForm?currentPage=";
			String result = PageService.printPage(url, totalCount, pageBlock, currentPage);
			

			model.addAttribute("count", totalCount);
			model.addAttribute("boards", boards);
			model.addAttribute("result", result);
		}

	public String bookHopeRegistProc(MultipartHttpServletRequest multi) { // 책 등록
			
			
			String sessionId = (String) session.getAttribute("id");
			if (sessionId == null)
				return "redirect:login";
	
			
			LocalDateTime currentTime = LocalDateTime.now(); // 현재 시간 가져오기
			Timestamp borrowtime = Timestamp.valueOf(currentTime); //형변환
		
			int book_count = Integer.parseInt(multi.getParameter("book_count")); //책 갯수
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			
			String fullPath = "";
			
			if(multi.getParameter("category").equals("API")) //API에서 받아온 이미지 라면
			{
				fullPath = multi.getParameter("image");
			}
			else { //사용자가 직접 올린 이미지라면
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
			}
			sdf = new SimpleDateFormat("yyyy-MM-dd"); 
			
			for(int i = 1; i <= book_count; i++) {
				BookHopeDTO board = new BookHopeDTO();
			
			board.setBoard_title("board_title"); //제목		
			board.setHope_user("hope_user"); //신청자
			board.setCategory(multi.getParameter("category")); // 카테고리
			board.setTitle_info(multi.getParameter("title_info")); //도서 제목
			board.setAuthor_info(multi.getParameter("author_info")); // 저작자
			
			String pub_info = multi.getParameter("pub_info");
			if(pub_info == null || pub_info.trim().isEmpty()) { //발행자가 없을 때 비움
			board.setPub_info(multi.getParameter(" "));} 
			else { //발행자
			board.setPub_info(pub_info);}
			
			board.setPub_year_info(multi.getParameter("pub_year_info")); // 발행연도

			System.out.println(board.getCategory());	
			System.out.println(board.getTitle_info());	
			System.out.println(board.getAuthor_info());	
			System.out.println(board.getPub_info());	
			System.out.println(board.getPub_year_info());	
	
			mapper.bookRegistProc(board);
			}
			
			return "redirect:bookHopeForm";
			//조회수랑 게시글 번호는 Insert 명령 시 입력.

			//bdto.setId((String)session.getAttribute("id"));
			//mapper.boardWriteProc(bdto);
			
			//String sessionNo = (String)session.getAttribute("no");

	}
/*
	public BookHopeDTO bookHopeContent(String no, Model model) { // 책 상세정보
		
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
			return null;
		}
		
		BookHopeDTO board = mapper.bookHopeContent(n);

		if(board != null) {
			System.out.println("image name = " + board.getImage());
			
			if(board.getImage() != null && !board.getCategory().equals("API")) { //API에서 받은 이미지가 아니면
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


	public void bookHopeDeleteProc(String no) {
		int n = 1;
		try{
			n = Integer.parseInt(no);
		}catch(Exception e){
		}
		
		mapper.bookHopeDeleteProc(n);
	}
		


	*/
	
	
	
}
