package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Schedule;

public interface ScheduleService {
	public void insertSchedule(Schedule dto) throws Exception;
	public void updateSchedule(Schedule dto) throws Exception;
	public void deleteSchedule(Map<String, Object> map) throws Exception;
	
	public Schedule findById(long num);
	public List<Schedule> listMonth(Map<String, Object> map);
	public List<Schedule> todaySchedule();  
}
