package com.sp.app.controller.board;

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

import com.sp.app.common.MyUtil;
import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.SessionInfo;
import com.sp.app.model.board.Board;
import com.sp.app.model.board.Reply;
import com.sp.app.service.BoardService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/dept/hrBoard/*")
public class HrBoardController {
	private final BoardService service;
	private final StorageService storageService;
	private final PaginateUtil paginateUtil;
	private final MyUtil myUtil;
	
	private String uploadPath;
	
	@PostConstruct
	public void init() {
		uploadPath = this.storageService.getRealPath("/uploads/dept/hrBoard");
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
			
			kwd = URLDecoder.decode(kwd,"utf-8");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			dataCount = service.dataCount(map);
			if(dataCount != 0) {
				total_page = paginateUtil.pageCount(dataCount, size);
			}
			
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Board> list = service.listBoard(map);
			
			String cp = req.getContextPath();
			String query = "";
			String listUrl = cp + "/dept/hrBoard/list";
			String articleUrl = cp + "/dept/hrBoard/article?page=" + current_page;
			if(! kwd.isBlank()) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
				
				listUrl += "?" + query;
				articleUrl += "&" + query;
			}
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
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
		
		return "dept/hrBoard/list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");
		
		return "dept/hrBoard/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Board dto, HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			dto.setEmpIdx(info.getEmpIdx());
			service.insertBoard(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/dept/hrBoard/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam(name = "postIdx") long postIdx,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd, Model model) throws Exception {
		
		String query = "page=" + page; 

		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			Board dto = Objects.requireNonNull(service.findById(postIdx));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			map.put("postIdx", postIdx);

			Board prevDto = service.findByPrev(map);
			Board nextDto = service.findByNext(map);
			
			List<Board> listFile = service.listFile(postIdx);
			
			model.addAttribute("dto", dto);
			model.addAttribute("prevDto", prevDto);
			model.addAttribute("nextDto", nextDto);
			model.addAttribute("listFile", listFile);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return "dept/hrBoard/article";
			
		} catch (NullPointerException e) {
			log.info("article : ", e);
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		return "redirect:/dept/hrBoard/list?" + query;
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam(name = "postIdx") long postIdx,
			@RequestParam(name = "page") String page,
			Model model, HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			Board dto = Objects.requireNonNull(service.findById(postIdx));
			if(info.getEmpIdx() != dto.getEmpIdx()) {
				return "redirect:/dept/hrBoard/list?page=" + page;
			}
			
			List<Board> listFile = service.listFile(postIdx);
			
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);
			
			return "dept/hrBoard/write";
			
		} catch (NullPointerException e) {
			log.info("updateForm : ", e);
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}

		return "redirect:/dept/hrBoard/list?page=" + page;
	}
	
	@PostMapping("update")
	public String updateSubmit(Board dto , @RequestParam(name = "page") String page,
			HttpSession session) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			dto.setEmpIdx(info.getEmpIdx());
			service.updateBoard(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("updateSubmit : ", e);
		}
		
		return "redirect:/dept/hrBoard/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String deleteBoard(@RequestParam(name = "postIdx") long postIdx,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}
			
			service.deleteBoard(postIdx, uploadPath);
			
		} catch (Exception e) {
			log.info("deleteBoard : ", e);
		}
		
		return "redirect:/dept/hrBoard/list?" + query;
	}
	
	//파일
	@GetMapping("download")
	public ResponseEntity<?> download(@RequestParam(name = "fileIdx") long fileIdx) throws Exception {
		
		try {
			Board dto = Objects.requireNonNull(service.findByFileId(fileIdx));
			
			return storageService.downloadFile(uploadPath, dto.getSaveFilename(), dto.getOriginalFilename());
			
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
	public ResponseEntity<?> zipdownload(@RequestParam(name = "fileIdx") long fileIdx) throws Exception {
		try {
			List<Board> listFile = service.listFile(fileIdx);
			if(listFile.size() > 0) {
				String[] sources = new String[listFile.size()];
				String[] originals = new String[listFile.size()];
				String fileName = listFile.get(0).getOriginalFilename();
				String zipFilename = fileName.substring(0, fileName.lastIndexOf(".")) + "_외.zip";
				
				for(int idx = 0; idx < listFile.size(); idx++) {
					sources[idx] = uploadPath + File.separator + listFile.get(idx).getSaveFilename();
					originals[idx] = File.separator + listFile.get(idx).getOriginalFilename();
				}

				return storageService.downloadZipFile(sources, originals, zipFilename);
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
			Board dto = Objects.requireNonNull(service.findByFileId(fileIdx));
			
			service.deleteUploadFile(uploadPath, dto.getSaveFilename());
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileIdx");
			map.put("postIdx", fileIdx);
			
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
	@PostMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(Board dto, HttpSession session) {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			dto.setEmpIdx(info.getEmpIdx());
			service.insertReply(null);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	
	@GetMapping("listReply")
	public String listReply(@RequestParam(name = "postIdx") long postIdx,
			@RequestParam(name = "pageNo", defaultValue = "1") int current_page,
			Model model, HttpServletResponse resp, HttpSession session) throws Exception {
	
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			int size = 0;
			int total_page = 0;
			int dataCount = 0;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postIdx", postIdx);
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
		
		return "dept/hrBoard/listReply";
	}
	
	
	public Map<String, ?> deleteReply(@RequestParam Map<String, Object> paramMap) {
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