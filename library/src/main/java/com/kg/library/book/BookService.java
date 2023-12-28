package com.kg.library.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kg.library.PageService;

@Service
public class BookService {

	@Autowired IBookMapper mapper;
	
	public void bookform(String cp, Model model, String search, String select) {
	
			int currentPage = 1;
			try{
				currentPage = Integer.parseInt(cp);
			}catch(Exception e){
				currentPage = 1;
			}
			
			int pageBlock = 10; // 한 페이지에 보일 데이터의 수 
			int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
			int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
			

			List<BookBoardDTO> boards = mapper.bookform(begin, end, select, search); //도서 리스트
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

	public String bookRegistProc(MultipartHttpServletRequest multi) {
		// TODO Auto-generated method stub
		return null;
	}
		
	
	
	
}
