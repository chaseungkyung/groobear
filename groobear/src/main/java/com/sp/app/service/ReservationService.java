package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Reservation;

public interface ReservationService {
	public void insertReservation(Reservation dto) throws Exception;
	public void deleteReservation(Map<String, Object> map) throws Exception;
	
	public List<Reservation> listMonth(Map<String,Object> map);
	public Reservation findById(long num);
}
