package com.kg.library.donate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DonateService {
	@Autowired private DonateMapper mapper;
	
	public void donateForm(Model model) {
		List<DonateDTO> board = mapper.donateForm();
		model.addAttribute("donate", board);
		
	}

	public int donateWriteProc(DonateDTO dto) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setReg_date(sdf.format(new Date()));
		int res = mapper.donateWriteProc(dto);
		return res;
	}
}
