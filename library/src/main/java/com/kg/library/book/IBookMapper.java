package com.kg.library.book;

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

}
