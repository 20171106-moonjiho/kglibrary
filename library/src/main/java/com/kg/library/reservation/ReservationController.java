package com.kg.library.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	@Autowired ReservationService service;
	
	@GetMapping("reservation")
	public String index() {
		return "/reservation/reservation";
	}
	
	@PostMapping("reservation")
	public String reservation(Model model, ReservationDTO dto) {
		List<String> list = service.getReservations(dto);
		model.addAttribute("dto", dto);
		model.addAttribute("reservations", list);
		return "/reservation/reservation";
	}
	
	@RequestMapping("reservation2")
	public String reservation2(Model model, ReservationDTO dto) {
		List<Integer> list = service.getReservations2(dto);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		return "/reservation/reservation2";
	}
	
	@PostMapping("result")
	public String result(Model model, ReservationDTO dto) {
		dto.setMember("");
		List<Integer> list = service.getReservations2(dto);
		for(int i = 0; i<dto.getDuration(); i++) {
			if(list.contains(dto.getReservation_time()+i) || dto.getReservation_time()+i > 20 ) {
				model.addAttribute("list", list);
				model.addAttribute("dto", dto);
				return "/reservation/reservation2";
			}
		}
		service.insert(dto);
		return "index";
	}
}
