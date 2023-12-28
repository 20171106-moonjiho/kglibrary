package com.kg.library.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {
	@Autowired ReservationMapper mapper;

	public List<String> getReservations(ReservationDTO dto) {
		return mapper.getReservations(dto);
		
	}

	public List<ReservationDTO> getReservations2() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
