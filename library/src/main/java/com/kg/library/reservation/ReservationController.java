package com.kg.library.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired private ReservationService service;
	@Autowired private HttpSession session;
	
	
	@GetMapping("reservation")
	public String newindex(Model model) {
		model.addAttribute("menu", "reservation");
		return "/reservation/new_reservation";
	}
	
	@ResponseBody
	@PostMapping(value="day", produces = "application/json; charset=utf-8")
	public String ex1Post(@RequestBody AjaxDTO allData) {
		String result;
		if(allData.getType().equals("date")) {
			result = "<div class=\"date_month\">\r\n"
					+ "<a href=\"#none\" class=\"month_prev\" onclick=\"get_cal('2023','12')\"><i\r\n"
					+ "class=\"fas fa-chevron-circle-left\"></i></a>\r\n"
					+ "<p>\r\n"
					+ "<span class=\"c_year\">2024년</span><span class=\"c_month\">01월</span>\r\n"
					+ "</p>\r\n"
					+ "<a href=\"#none\" class=\"month_next\" onclick=\"get_cal('2024','02')\"><i\r\n"
					+ "class=\"fas fa-chevron-circle-right\"></i></a>\r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "<div class=\"select_list\">\r\n"
					+ "<ul class=\"step_date_ul\">\r\n"
					+ "<li><a href=\"#none\" class=\" none xx  none xx \" rel=\"01\">01(월)\r\n"
					+ "- 대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"02\">02(화) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"03\">03(수) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"04\">04(목) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"05\">05(금) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"06\">06(토) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"07\">07(일) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"08\">08(월) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"09\">09(화) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"10\">10(수) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"11\">11(목) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"12\">12(금) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"13\">13(토) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"14\">14(일) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"15\">15(월) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"16\">16(화) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"17\">17(수) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"18\">18(목) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"19\">19(금) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"20\">20(토) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"21\">21(일) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"22\">22(월) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"23\">23(화) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"24\">24(수) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"25\">25(목) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"26\">26(금) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"27\">27(토) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\" none xx \" rel=\"28\">28(일) -\r\n"
					+ "대여불가</a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"29\">29(월) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"30\">30(화) </a></li>\r\n"
					+ "<li><a href=\"#none\" class=\"\" rel=\"31\">31(수) </a></li>\r\n"
					+ "</ul>\r\n"
					+ "</div>";
		}else {
			result = "<li><a href=\"#none\" rel=\"9\" title=\"0\" class=\"\">09:00-10:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"10\" title=\"1\" class=\"\">10:00-11:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"11\" title=\"2\" class=\"\">11:00-12:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"12\" title=\"3\" class=\"\">12:00-13:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"13\" title=\"4\" class=\"\">13:00-14:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"14\" title=\"5\" class=\"\">14:00-15:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"15\" title=\"6\" class=\"\">15:00-16:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"16\" title=\"7\" class=\"\">16:00-17:00</a></li>\r\n"
					+ "<li><a href=\"#none\" rel=\"17\" title=\"8\" class=\"\">17:00-18:00</a></li>";
		}
		return result;
	}
	
	@PostMapping("new_result")
	public String new_result(Model model, String room, String year_t, String month_t, String day_t, String time_t) {
		ReservationDTO dto = new ReservationDTO();
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		dto.setMember(sessionId);
		dto.setReservation_date(year_t+"-"+month_t+"-"+day_t);
		dto.setRoom_num(room);
		String[] time = time_t.split("##");
		dto.setReservation_time(Integer.parseInt(time[0]));
		dto.setDuration(time.length);
		int res = service.insert(dto);
		if(res!=0) {
			List<Integer> list = service.getReservations2(dto);
			model.addAttribute("list", list);
			model.addAttribute("dto", dto);
			return "myReservation";
		}
		return "index";
	}
	
	@RequestMapping("reservationheader")
	public String reservationheader() {
		return "reservation/reservationheader";
	}
	
	@RequestMapping("reservationfooter")
	public String reservationfooter() {
		return "reservation/reservationfooter";
	}	
}
