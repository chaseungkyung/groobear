package com.sp.app.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.Member;
import com.sp.app.model.Schedule;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;
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
	private final MemberService memberService;
	
	@GetMapping("main")
	public String handleHome(Schedule scheduleDto,
			Member memberdto, Model model, HttpSession session
			) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			List<Schedule> list = service.todaySchedule();
			
			Long empIdx = info.getEmpIdx();
			Member dto = Objects.requireNonNull(memberService.findByEmpIdx(empIdx));
			
			String saveProfile = memberService.findByProfile(empIdx).getSaveProfile();
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			model.addAttribute("empCode", info.getEmpCode());
			model.addAttribute("deptIdx", info.getDeptIdx());
			
			if (saveProfile != null && !saveProfile.isEmpty()) {
                dto.setSaveProfile("/uploads/emp/" + saveProfile); // 경로 추가
            } else {
                
            }
			// 프로필 사진

			model.addAttribute("dto", dto);
			
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
