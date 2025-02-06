package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	@GetMapping("schedule")
	public String schedule() {
		return "/schedule/schedule";
	}
	
	@GetMapping("write")
	public String writeForm() {
		return "/schedule/write";
	}
	
}
