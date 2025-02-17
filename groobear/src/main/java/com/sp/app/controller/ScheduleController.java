package com.sp.app.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sp.app.model.Schedule;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.ScheduleService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/schedule/*")
public class ScheduleController {
	private final ScheduleService service;
	
	@GetMapping("schedule")
	public ModelAndView main(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("schedule/schedule");
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("empCode", info.getEmpCode());
			
		} catch (Exception e) {
			log.info("schedule : ", e);
		}
		
		return mav;
	}
	
	@GetMapping("write")
	public String writeForm(@ModelAttribute(value = "dto") Schedule dto,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("empCode", info.getEmpCode());
			
			model.addAttribute("mode", "write");
			
		} catch (Exception e) {
			log.info("writeForm : ", e);
		}
		
		return "schedule/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Schedule dto,
			HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			if(dto.getCategoryIdx() == 0) {
				dto.setCategoryIdx(0);
			}
			
			dto.setEmpCode(info.getEmpCode());
			
			service.insertSchedule(dto);
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/schedule/schedule";
	}
	
	// 월별 일정 - AJAX : JSON 
	@ResponseBody
	@GetMapping(value="month")
	public Map<String, ?> month (
			@RequestParam(name = "start") String start,
			@RequestParam(name = "end") String end,
			@RequestParam(name = "categorys", required = false) List<Long> categorys,
			HttpSession session) throws Exception {
		Map<String, Object> model=new HashMap<>();

		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			String[] ss = start.split("-");
			int y = Integer.parseInt(ss[0]);
			int m = Integer.parseInt(ss[1]);
			int d = Integer.parseInt(ss[2]);
			String repeatStart = start;
			String repeatEnd = end;
			if(m == 12 && d != 1) {
				repeatStart = String.format("%04d-01-01", y + 1);
			}
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("categoryList", categorys);
			map.put("start", start);
			map.put("end", end);
			map.put("repeatStart", repeatStart);
			map.put("repeatEnd", repeatEnd);
			map.put("empCode", info.getEmpCode());
			
			List<Schedule> list = service.listMonth(map);
			
			for(Schedule dto : list) {
		    	if(dto.getStartTime() != null && ! dto.getStartTime().isBlank()) {
		    		// 2021-10-10T10:10
		    		dto.setStart(dto.getStartDate() + "T" + dto.getStartTime());
		    	} else {
		    		dto.setStart(dto.getStartDate());
		    	}
	    	
		    	if(dto.getEndTime() != null && ! dto.getEndTime().isBlank()) {
		    		dto.setEnd(dto.getEndDate() + "T" + dto.getEndTime());
		    	} else {
		    		dto.setEnd(dto.getEndDate());
		    	}
		    	
		    	if(dto.getRepeat() != 0) { // 반복 일정인 경우
		    		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		    		
		    		LocalDate local = LocalDate.parse(dto.getStart(), formatter);
		    		LocalDate slocal = LocalDate.parse(start, formatter);
		    		LocalDate elocal = LocalDate.parse(end, formatter);
		    		
		    		if (local.isBefore(slocal) || local.isAfter(elocal)) {
		    			String s = start.substring(0,4) + dto.getStart().substring(4);
		    			LocalDate tdate = LocalDate.parse(s, formatter);
		    			if(tdate.isBefore(slocal) || tdate.isAfter(elocal)) {
		    				s = end.substring(0,4) + dto.getStart().substring(4);
		    			}
		    			
		    			dto.setStart(s);
		    		}
		    	}
			}
			
			model.put("list", list);
			
		} catch (Exception e) {
			log.info("month : ", e);
		}
		
		return model;
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam(name = "num") long num,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Schedule dto = Objects.requireNonNull(service.findById(num));
			
			if(dto.getStartTime() == null) {
				dto.setAll_day("1");

				if(dto.getEndDate() != null) {
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDate local = LocalDate.parse(dto.getEndDate(), formatter);
				        
					// 날짜에 하루를 뺀 이전 날짜
					LocalDate prevDate = local.minusDays(1);
					
					dto.setEndDate(prevDate.format(formatter));
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("empCode", info.getEmpCode());
			
			model.addAttribute("mode", "update");
			model.addAttribute("dto", dto);
			
			return "schedule/write";
			
		} catch (NullPointerException e) {
			log.info("updateForm : ", e);
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}
		
		return "redirect:/schedule/schedule";
		
	}
	
	@PostMapping("update")
	public String updateSubmit(Schedule dto,
			HttpSession session) throws Exception {
		
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			if(dto.getCategoryIdx() == 0) {
				dto.setCategoryIdx(0);
			}
			
			dto.setEmpCode(info.getEmpCode());
			service.updateSchedule(dto);
		} catch (Exception e) {
			log.info("updateSubmit : ", e);
		}
		
		return "redirect:/schedule/schedule";
	}

	// 일정을 드래그 한 경우 수정 완료 - AJAX : JSON
	@ResponseBody
	@PostMapping("updateDrag")
	public Map<String, ?> updateDragSubmit(Schedule dto, HttpSession session) {
		Map<String, Object> model = new HashMap<>();

		String state = "false";
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			dto.setEmpCode(info.getEmpCode());
			if(dto.getCategoryIdx() == 0) {
				dto.setCategoryIdx(0);
			}
			
			// 반복 일정은 종료 날짜등이 수정되지 않도록 설정
			if(dto.getRepeat() == 1 && dto.getRepeat_cycle() != 0) {
				dto.setEndDate("");
				dto.setStartTime("");
				dto.setEndTime("");
			}
			
			service.updateSchedule(dto);
			
			state = "true";
		} catch (Exception e) {
		}

		model.put("state", state);
		return model;
	}
	
	// 일정 삭제 - AJAX : JSON
	@PostMapping("delete")
	@ResponseBody
	public Map<String, ?> delete(@RequestParam(name = "num") long num,
			HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();

		String state = "false";
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map=new HashMap<>();
			map.put("empCode", info.getEmpCode());
			map.put("scheduleIdx", num);
			service.deleteSchedule(map);
			
			state = "true";
		}catch (Exception e) {
			
		}
		
		model.put("state", state);
		
		return model;
	}
	
	
}
