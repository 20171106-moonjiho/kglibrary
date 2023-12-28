package com.kg.library.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservationController {
	@Autowired ReservationService service;
	
	@GetMapping("reservation")
	public void index() {
		
	}
	
	@PostMapping("reservation")
	public void reservation(Model model, ReservationDTO dto) {
		List<String> list = service.getReservations(dto);
		model.addAttribute("dto", dto);
		model.addAttribute("reservations", list);
	}
	
	@PostMapping("reservation2")
	public void reservation2(Model model) {
		List<ReservationDTO> list = service.getReservations2();
	}
}
