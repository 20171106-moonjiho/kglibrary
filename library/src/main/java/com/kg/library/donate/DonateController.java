package com.kg.library.donate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonateController {
@Autowired private DonateService service;

	@RequestMapping("/donateForm")
	public String donateForm(Model model) {
		service.donateForm(model);
		return "/donate/donateForm";
	}
}