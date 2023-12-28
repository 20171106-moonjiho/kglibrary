package com.kg.library.donate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DonateService {
	@Autowired private DonateMapper mapper;
	
	public void donateForm(Model model) {
		List<DonateDTO> board = mapper.donateForm();
		model.addAttribute("board", board);
		
	}
}
