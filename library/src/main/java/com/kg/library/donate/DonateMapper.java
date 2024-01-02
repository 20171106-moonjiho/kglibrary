package com.kg.library.donate;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DonateMapper {

	List<DonateDTO> donateForm();

	int donateWriteProc(DonateDTO dto);

}