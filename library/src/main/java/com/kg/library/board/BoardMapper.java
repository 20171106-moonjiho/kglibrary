package com.kg.library.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
public interface BoardMapper {

	int getCount();

	ArrayList<BoardDTO> getList(@Param("begin")int begin, @Param("end")int end);

	int writeProc(BoardDTO board);

	void updateStep(@Param("ref")int ref, @Param("step")int step);

	int maxNum();

	void write(BoardDTO board);

	BoardDTO getContent(int num);

	void updateReadCount(int num);

	Object deleteForm(String num);

	void boardDeleteProc(int n);

	BoardDTO pass(int n);

	String getPass(int num);

	void update(BoardDTO board);

	

}
