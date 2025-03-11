package com.sp.app.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.Club;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.ClubService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/club/*")
public class ClubController {
	private final ClubService service;
	private final @Qualifier("paginateUtil") PaginateUtil paginateUtil;
	private final StorageService storageService;
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = this.storageService.getRealPath("/uploads/photo");		
	}
	
	@GetMapping("list")
	public String list(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req) throws Exception {

		try {
			int size = 8;
			int total_page;
			int dataCount;

			kwd = URLDecoder.decode(kwd, "utf-8");

			// 전체 페이지 수
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			dataCount = service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);

			current_page = Math.min(current_page, total_page);

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Club> list = service.listClub(map);

			String cp = req.getContextPath();
			String query = "";
			String listUrl = cp + "/club/list";
			String articleUrl = cp + "/club/article?page=" + current_page;
			if (! kwd.isBlank()) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
				
				listUrl += "?" + query;
				articleUrl += "&" + query;
			}

			String paging = paginateUtil.paging(current_page, total_page, listUrl);

			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);

			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			
		} catch (Exception e) {
			log.info("list : ", e);
		}

		return "club/list";
	}

	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return "club/write";
	}

	@PostMapping("write")
	public String writeSubmit(Club dto, HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			dto.setEmpCode(info.getEmpCode());
			dto.setEmpName(info.getEmpName());
			
			service.insertClub(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}

		return "redirect:/club/list";
	}

	@GetMapping("article")
	public String article(@RequestParam(name = "num") long num,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpSession session) throws Exception {

		String query = "page=" + page;
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if (! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}

			Club dto = Objects.requireNonNull(service.findById(num));

			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

			// 이전 글, 다음 글
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("num", num);
			
			map.put("userLevel", info.getPositionCode());

			Club prevDto = service.findByPrev(map);
			Club nextDto = service.findByNext(map);

			model.addAttribute("dto", dto);
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);

			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return "club/article";
			
		} catch (NullPointerException e) {
			log.info("article : ", e);
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		return "redirect:/club/list?" + query;
	}

	@GetMapping("update")
	public String updateForm(@RequestParam(name = "num") long num,
			@RequestParam(name = "page") String page,
			Model model,
			HttpSession session) throws Exception {

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");

			Club dto = Objects.requireNonNull(service.findById(num));
			if (! info.getEmpCode().equals(dto.getEmpCode())) {
				return "redirect:/club/list?page=" + page;
			}

			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("mode", "update");
			
			return "club/write";
			
		} catch (NullPointerException e) {
			log.info("updateForm : ", e);
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}
		
		return "redirect:/club/list?page=" + page;
	}

	@PostMapping("update")
	public String updateSubmit(Club dto,
			@RequestParam(name = "page") String page) throws Exception {
		
		try {
			service.updateClub(dto, uploadPath);
		} catch (Exception e) {
			log.info("updateSubmit : ", e);
		}

		return "redirect:/club/article?num=" + dto.getNum() + "&page=" + page;
	}

	@GetMapping("delete")
	public String delete(@RequestParam(name = "num") long num,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "imageFilename") String imageFilename,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd) throws Exception {

		String query = "page=" + page;
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if (! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}

			service.deleteClub(num, uploadPath, imageFilename);
			
		} catch (Exception e) {
			log.info("delete : ", e);
		}

		return "redirect:/club/list?" + query;
	}
}
