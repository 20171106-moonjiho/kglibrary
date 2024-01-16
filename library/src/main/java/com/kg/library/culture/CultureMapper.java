package com.kg.library.culture;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CultureMapper {

	ArrayList<CultureDTO> cultureboard(int begin, int end, String search_select, String search);

	int totalCount(String search_select, String search);

	void culture_writeProc(CultureDTO board);

	CultureDTO cultureContent(int n);

}
