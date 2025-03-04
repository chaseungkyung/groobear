package com.sp.app.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.SessionInfo;
import com.sp.app.model.notice.Notice;
import com.sp.app.model.notice.Reply;
import com.sp.app.service.NoticeService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/notice/*")
public class NoticeController {
	private final NoticeService service;
	private final StorageService stroageService;
	private final PaginateUtil paginateUtil;
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = this.stroageService.getRealPath("/uploads/notice");
	}
	
	@GetMapping("list")
	public String list(@RequestParam(name= "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model, HttpServletRequest req) throws Exception {
		
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);

			dataCount = service.dataCount(map);
			if(dataCount != 0) {
				total_page = paginateUtil.pageCount(dataCount, size);
			}
			
			current_page = Math.min(current_page, total_page);
			
			List<Notice> noticeList = null;
			if(current_page == 1) {
				noticeList = service.listNoticeTop();
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<Notice> list = service.listNotice(map);
			
			String cp = req.getContextPath();
			String query = "";
			String listUrl = cp + "/notice/list";
			String articleUrl = cp + "/notice/article?page=" + current_page;
			if (! kwd.isBlank()) { 
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
				
				listUrl += "?" + query;
				articleUrl += "&" + query;
			}

			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("list", list);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			model.addAttribute("articleUrl", articleUrl);

			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			
		} catch (Exception e) {
			log.info("list : ", e);
		}
		
		return "notice/list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");
		
		return "notice/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Notice dto, HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setEmpIdx(info.getEmpIdx());
			service.insertNotice(dto, uploadPath);
				
		} catch (Exception e) {
			log.info("writeSubmit : ", e);		
		}
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam(name = "noticeIdx") long noticeIdx,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd, Model model) throws Exception {
		
		String query = "page=" + page; 
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			Notice dto = Objects.requireNonNull(service.findById(noticeIdx));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("noticeIdx", noticeIdx);
			
			Notice prevDto = service.findByPrev(map);
			Notice nextDto = service.findByNext(map);
			
			List<Notice> listFile = service.listFile(noticeIdx);
			
			model.addAttribute("dto", dto);
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);
			model.addAttribute("listFile", listFile);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return "notice/article";
			
		} catch (NullPointerException e) {
			log.info("article : ", e);	
		} catch (Exception e) {
			log.info("article : ", e);		
		}
		
		return "redirect:/notice/list?" + query;
	}
			
	@GetMapping("update")
	public String updateForm(@RequestParam(name = "noticeIdx") long noticeIdx,
			@RequestParam(name = "page") String page,
			Model model, HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
		
			Notice dto = Objects.requireNonNull(service.findById(noticeIdx));
			if(info.getEmpIdx() != dto.getEmpIdx()) {
				return "redirect:/notice/list?page=" + page;
			}
			
			List<Notice> listFile = service.listFile(noticeIdx);
			
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);
		
			return "notice/write";
			
		} catch (NullPointerException e) {
			log.info("updateForm : ", e);
		} catch (Exception e) {
			log.info("updateForm : ", e);	
		}
		
		return "redirect:/notice/list?page=" + page;
	}
	
	@PostMapping("update")
	public String updateSubmit(Notice dto,
			@RequestParam(name = "page") String page,
			Model model, HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setEmpIdx(info.getEmpIdx());
			service.updatdeNotice(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("updateSubmit : ", e);	
		}
		
		return "redirect:/notice/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String deleteNotice(@RequestParam(name = "noticeIdx") long noticeIdx,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if (! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}
			
			service.deleteNotice(noticeIdx, uploadPath);

		} catch (Exception e) {
			log.info("deleteNotice : ", e);
		}
		
		return "redirect:/notice/list?" + query;
	}
	
	//파일
	
	@GetMapping("download")
	public ResponseEntity<?> download(@RequestParam(name = "fileIdx") long fileIdx) throws Exception {
		
		try {
			Notice dto = Objects.requireNonNull(service.findByFileId(fileIdx));
			
			return stroageService.downloadFile(uploadPath, dto.getSaveFilename(), dto.getOriginalFilename());
			
		} catch (NullPointerException e) {
			log.info("download : ", e);
		} catch (Exception e) {
			log.info("download : ", e);
		}
		
		String errorMessage = "<script>alert('파일 다운로드가 불가능합니다.');history.back();</script>";
		
		return ResponseEntity.status(HttpStatus.NOT_FOUND)
				.contentType(MediaType.valueOf("text/html;charset=UTF-8"))
				.body(errorMessage);
	}
	
	@GetMapping("zipdownload")
	public ResponseEntity<?> zipdownload(@RequestParam(name = "noticeIdx") long noticeIdx) throws Exception {
		
		try {
			List<Notice> listFile = service.listFile(noticeIdx);
			if(listFile.size() > 0) {
				String[] sources = new String[listFile.size()];
				String[] originals = new String[listFile.size()];
				String fileName = listFile.get(0).getOriginalFilename();
				String zipFilename = fileName.substring(0, fileName.lastIndexOf(".")) + "_외.zip";
			
				for(int idx = 0; idx < listFile.size(); idx++) {
					sources[idx] = uploadPath + File.separator + listFile.get(idx).getSaveFilename();
					originals[idx] = File.separator + listFile.get(idx).getOriginalFilename();
				}
				
				return stroageService.downloadZipFile(sources, originals, zipFilename);
			}
			
		} catch (Exception e) {
			log.info("zipdownload : ", e);
		}
		
		String errorMessage = "<script>alert('파일 다운로드가 불가능합니다.');history.back();</script>";
		
		return ResponseEntity.status(HttpStatus.NOT_FOUND)
				.contentType(MediaType.valueOf("text/html;charset=UTF-8"))
				.body(errorMessage);
	}
	
	@ResponseBody
	@PostMapping("deleteFile")
	public Map<String, ?> deleteFile(@RequestParam(name = "fileIdx") long fileIdx,
			HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String state = "false";
		try {
			Notice dto = Objects.requireNonNull(service.findByFileId(fileIdx));
			
			service.deleteUploadFile(uploadPath, dto.getSaveFilename());

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileIdx");
			map.put("noticeIdx", fileIdx);
			
			service.deleteFile(map);
			
			state = "true";
			
		} catch (NullPointerException e) {
			log.info("deleteFile : ", e);
		} catch (Exception e) {
			log.info("deleteFile : ", e);
		}
		
		model.put("state", state);
		return model;
	}
	
	//댓글
	
	@ResponseBody
	@PostMapping("insertReply")
	public Map<String, Object> insertReply(Reply dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setEmpIdx(info.getEmpIdx());
			service.insertReply(dto);
		
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	
	@GetMapping("listReply")
	public String listReply(@RequestParam(name = "noticeIdx") long noticeIdx,
			@RequestParam(name = "pageNo", defaultValue = "1") int current_page,
			Model model, HttpServletResponse resp, HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			int size = 5;
			int total_page = 0;
			int dataCount = 0;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("noticeIdx", noticeIdx);
			map.put("empIdx", info.getEmpIdx());
			
			dataCount = service.replyCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset= 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Reply> listReply = service.listReply(map);
			
			String paging = paginateUtil.pagingMethod(current_page, total_page, "listPage");
			
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);

		} catch (Exception e) {
			log.info("listReply : ", e);
			
			resp.sendError(406);
			throw e;
		}
		
		return "notice/listReply";
	}
	
	@ResponseBody
	@PostMapping("deleteReply")
	public Map<String, ?> deleteReply(@RequestParam Map<String, Object> paramMap) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		model.put("state", state);
		return model;
	}
	
}