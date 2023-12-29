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

	public List<Integer> getReservations2(ReservationDTO dto) {
		return mapper.getReservations2(dto);
	}

	public void insert(ReservationDTO dto) {
		int iteration = dto.getDuration();
		for(int i = 0; i<iteration; i++) {
			mapper.insert(dto);
			dto.setDuration(dto.getDuration()-1);
			dto.setReservation_time(dto.getReservation_time()+1);
		}
		
	}
	
	
}
