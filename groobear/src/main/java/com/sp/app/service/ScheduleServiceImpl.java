package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.ScheduleMapper;
import com.sp.app.model.Schedule;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ScheduleServiceImpl implements ScheduleService {
	private final ScheduleMapper mapper;
	
	@Override
	public void insertSchedule(Schedule dto) throws Exception {
		try {
			if(dto.getAll_day() != null) {
				dto.setStartTime("");
				dto.setEndTime("");
			}
			
			if(dto.getStartTime().isEmpty() && dto.getEndTime().isEmpty() && dto.getStartDate().equals(dto.getEndDate())) {
				dto.setEndDate("");
			}
			
			if(dto.getRepeat_cycle() != 0) {
				dto.setEndDate("");
				dto.setStartTime("");
				dto.setEndTime("");
			}
			
			mapper.insertSchedule(dto);
		} catch (Exception e) {
			log.info("insertSchedule : ", e);
			
			throw e;
		}
	}

	@Override
	public void updateSchedule(Schedule dto) throws Exception{
		try {
			if(dto.getAll_day() != null) {
				dto.setStartTime("");
				dto.setEndTime("");
			}
			
			if(dto.getStartTime().isEmpty() && dto.getEndTime().isEmpty() && dto.getStartDate().equals(dto.getEndDate())) {
				dto.setEndDate("");
			}
			
			if(dto.getRepeat_cycle() != 0) {
				dto.setEndDate("");
				dto.setStartTime("");
				dto.setEndTime("");
			}
			
			mapper.updateSchedule(dto);
		} catch (Exception e) {
			log.info("updateSchedule : ", e);
			
			throw e;
		}

	}
	
	@Override
	public List<Schedule> listMonth(Map<String, Object> map) {
		List<Schedule> list = null;
		
		try {
			list = mapper.listMonth(map);
		} catch (Exception e) {
			log.info("listMonth : ", e);
		}
		
		return list;
	}

	@Override
	public Schedule findById(long num) {
		Schedule dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			log.info("findById : ", e);
		}
		
		return dto;
	}

	@Override
	public void deleteSchedule(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteSchedule(map);
		} catch (Exception e) {
			log.info("deleteSchedule" , e);
			
			throw e;
		}
	}
	
}
