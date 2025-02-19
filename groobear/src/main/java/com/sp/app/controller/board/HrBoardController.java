package com.sp.app.controller.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.board.Board;
import com.sp.app.service.borad.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("")
public class HrBoardController {
	private final BoardService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	private final MyUtil myUtil;
	
	private String uploadPath;
	
	public void init() {
		
	}
	
	public String list() {
		
		return "hrBoard/list";
	}
	
	public String writeForm() throws Exception {
		
		return "hrBoard/write";
	}
	
	public String writeSubmit() throws Exception {
		
		return "redirect:/hrBoard/list";
	}
	
	public String article() throws Exception {
		
		return "hrBoard/write";
	}
	
	public String updateForm() throws Exception {
		
		return "hrBoard/write";
	}
	
	public String updateSubmit() throws Exception {
		
		return "redirect:/hrBoard/list?page="; //+ page;
	}
	
	public String deleteBoard() {
		
		return "redirect:/hrBoard/list?"; // + query;
	}
	
	public String downloadFailed() {
		return "error/downloadFailure";
	}
	
	public Map<String, Object> insertReply(Board dto, HttpSession session) {
		Map<String, Object> model = new HashMap<>();
		
		return model;
	}
	
	public String listReply() throws Exception {
	
		return "hrBoard/listReply";
	}
	
	public String listReplyAnswer() throws Exception {
		
		return "hrBoard/listReplyAnswer";
	}
	
	public Map<String, ?> countReplyAnswer() {
		Map<String, Object> model = new HashMap<>();
	
		return model;
	}
	
	public Map<String, ?> deleteReply() {
		Map<String, Object> model = new HashMap<>();
	
		return model;
	}
	
}
