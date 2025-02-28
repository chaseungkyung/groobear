package com.sp.app.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.ReservationMapper;
import com.sp.app.model.Reservation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReservationServiceImpl implements ReservationService {
	private final ReservationMapper mapper;

	@Override
	public void insertReservation(Reservation dto) throws SQLException {
		try {
			mapper.insertReservation(dto);			
		} catch (Exception e) {
			log.info("insertReservation : ", e);
			
			throw e;
		}
		
	}

	@Override
	public void deleteReservation(Map<String, Object> map) throws SQLException {
		try {
			mapper.deleteReservation(map);
		} catch (Exception e) {
			log.info("deleteReservation : ", e);
		}
		
	}

	@Override
	public List<Reservation> listMonth(Map<String, Object> map) {
		List<Reservation> list = null;
		
		try {
			list = mapper.listMonth(map);
		} catch (Exception e) {
			log.info("listMonth : ", e);
		}
		return list;
	}

	@Override
	public Reservation findById(long num) {
		Reservation dto = null;
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			log.info("findById : ", e);
		}
		return dto;
	}

}
