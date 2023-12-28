package com.kg.library.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

	List<String> getReservations(ReservationDTO dto);

}
