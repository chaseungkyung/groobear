package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Schedule;

@Mapper
public interface ScheduleMapper {
	public void insertSchedule(Schedule dto) throws SQLException;
	public void updateSchedule(Schedule dto) throws SQLException;
	public void deleteSchedule(Map<String, Object> map) throws SQLException;
	
	public List<Schedule> listMonth(Map<String, Object> map);
	public Schedule findById(long num);
}
