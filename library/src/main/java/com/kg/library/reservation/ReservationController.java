package com.kg.library.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired private ReservationService service;
	@Autowired private HttpSession session;
	
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
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		dto.setMember(sessionId);
		int res = service.insert(dto);
		if(res!=0) {
			List<Integer> list = service.getReservations2(dto);
			model.addAttribute("list", list);
			model.addAttribute("dto", dto);
			return "myReservation";
		}
		return "index";
	}
}
