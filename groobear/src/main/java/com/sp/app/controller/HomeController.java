package com.sp.app.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.Schedule;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.ScheduleService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/")
public class HomeController {
	private final ScheduleService service;
	
	@GetMapping("main")
	public String handleHome(Schedule scheduleDto, Model model, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			List<Schedule> list = service.todaySchedule();
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			model.addAttribute("empCode", info.getEmpCode());
			model.addAttribute("deptIdx", info.getDeptIdx());
			
			// 스케쥴Dto에서 메인으로 뽑아오는 리스트입니다.
			model.addAttribute("list", list);
			model.addAttribute("startDate", scheduleDto.getStartDate());
			model.addAttribute("scheduleIdx", scheduleDto.getScheduleIdx());
			model.addAttribute("title", scheduleDto.getTitle());
			
		} catch (Exception e) {
			log.info("handleHome : ", e);
		}
		
		return "main/home";
	}
}
