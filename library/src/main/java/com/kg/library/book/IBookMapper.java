package com.kg.library.book;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IBookMapper {

	List<BookDTO> bookForm(
			@Param("begin")int begin, @Param("end") int end,
			@Param("select")String select, @Param("search")String search);

	int totalCount(@Param("select")String select,@Param("search")String search);

	String test();

	void bookRegistProc(BookDTO board);

	BookDTO bookContent(int n);

	void rentalProc(@Param("n")int n, @Param("sessionId")String sessionId,@Param("borrowtime")Timestamp borrowtime);

	void returnProc(@Param("n")int n, @Param("borrowperson")String borrowperson);

	void bookDeleteProc(int n);

	void apiRegistProc(List<BookDTO> bookList);

}
