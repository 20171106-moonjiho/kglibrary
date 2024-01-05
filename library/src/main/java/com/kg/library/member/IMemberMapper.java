package com.kg.library.member;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kg.library.book.BookDTO;

@Mapper
public interface IMemberMapper {

	int joinProc(MemberDTO member);

	MemberDTO login(String id);

	ArrayList<MemberDTO> memberInfo(@Param("begin")int begin, @Param("end")int end,
			@Param("select")String select, @Param("search")String search);

	int totalCount(@Param("select")String select, @Param("search")String search);

	int updateProc(MemberDTO member);

	int deleteProc(String id);
	
}