package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {

	@GetMapping("main")
	public String reservationMain() {
		return "reservation/main";
	}
	
}
