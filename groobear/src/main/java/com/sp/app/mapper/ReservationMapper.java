package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Reservation;

@Mapper
public interface ReservationMapper {
	public void insertReservation(Reservation dto) throws SQLException;
	public void deleteReservation(Map<String, Object> map) throws SQLException;
	
	public List<Reservation> listMonth(Map<String,Object> map);
	public Reservation findById(long num);
}
