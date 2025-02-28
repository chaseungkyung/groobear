package com.sp.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sp.app.model.Reservation;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.ReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/reservation/*")
public class ReservationController {
	private final ReservationService service;

	@GetMapping("main")
	public ModelAndView reservationMain(@RequestParam(name = "cabinet", defaultValue = "A")String cabinet,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("reservation/main");
		
		try {
			SessionInfo info =(SessionInfo)session.getAttribute("member");
			
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("empCode", info.getEmpCode());
			map.put("empName", info.getEmpName());

		} catch (Exception e) {
			log.info("reservation : ", e);
		}
		mav.addObject("cabinet", cabinet);
		return mav;
	}
	
	@GetMapping("write")
	public String writeForm(@ModelAttribute(value = "dto") Reservation dto,
			@RequestParam(name = "cabinet") String cabinet,
			HttpSession session,
			Model model) throws Exception {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("empCode", info.getEmpCode());
			map.put("empName", info.getEmpName());
			
			model.addAttribute("cabinet", cabinet);
		} catch (Exception e) {
			log.info("writeForm : ", e);
		}
		System.out.println("회의실 GET"+cabinet);
		return "reservation/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Reservation dto,
			HttpSession session) throws Exception {
		
		String cabinet = "A";
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			cabinet = dto.getCabinet();
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("empCode", info.getEmpCode());
			map.put("empName", info.getEmpName());
			map.put("reservDate", dto.getReservDate());
			
			dto.setEmpCode(info.getEmpCode());
			dto.setEmpName(info.getEmpName());
			dto.setReservDate(dto.getReservDate());
			
			service.insertReservation(dto);
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}

		return "redirect:/reservation/main?cabinet=" + cabinet;
	}
	
	@ResponseBody
	@GetMapping(value = "month")
	public Map<String, ?> month (
			@RequestParam(name = "start") String start,
			@RequestParam(name = "end") String end,
			@RequestParam(name = "cabinet")String cabinet,
			HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String,Object>();
			
			map.put("start", start);
			map.put("end", end);
			map.put("cabinet", cabinet);
			map.put("empCode", info.getEmpCode());
			map.put("empName", info.getEmpName());
			
			List<Reservation> list = service.listMonth(map);
			for(Reservation dto : list) {
		    	if(dto.getStartTime() != null && ! dto.getStartTime().isBlank()) {
		    		// 2021-10-10T10:10
		    		dto.setStart(dto.getReservDate() + "T" + dto.getStartTime());
		    	} else {
		    		dto.setStart(dto.getReservDate());
		    	}
	    	
		    	if(dto.getEndTime() != null && ! dto.getEndTime().isBlank()) {
		    		dto.setEnd(dto.getReservDate() + "T" + dto.getEndTime());
		    	} else {
		    		dto.setEnd(dto.getReservDate());
		    	}
		    	
			}
			model.put("list", list);
			
		} catch (Exception e) {
			log.info("month : ", e);
		}
		
		return model;
	}
	
	@ResponseBody
	@PostMapping("delete")
	public Map<String, ?> delete(@RequestParam(name="num") long num,
			HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "false";
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			Map<String, Object> map=new HashMap<>();
			map.put("empCode", info.getEmpCode());
			map.put("reservIdx", num);
			service.deleteReservation(map);
			
			state = "true";
		} catch (Exception e){
			log.info("delete : ", e );
		}	
		model.put("state", state);
		
		return model;
	}
	
	
	
}
