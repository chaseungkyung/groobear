package com.sp.app.project.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.SessionInfo;
import com.sp.app.model.board.Board;
import com.sp.app.project.model.ProjectPost;
import com.sp.app.project.model.ProjectPostCmt;
import com.sp.app.project.service.ProjectPostService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/project/post/*")
public class ProjectPostController {
    private final ProjectPostService projectPostService;
    private final StorageService storageService;
    private final PaginateUtil paginateUtil;
    
    private String uploadPath;
    
    @PostConstruct
    public void init() {
    	uploadPath = this.storageService.getRealPath("/uploads/project/post");
    }

    @GetMapping("list/{projIdx}")
    public String postList(
            @PathVariable("projIdx") long projIdx,
            @RequestParam(name = "page", defaultValue = "1") String page,
            @RequestParam(name = "postPage", defaultValue = "1") int postPage,
            @RequestParam(name = "schType", defaultValue = "all") String schType,
            @RequestParam(name = "keyword", defaultValue = "") String keyword,
            Model model, HttpServletRequest req) throws Exception {
    	
    	String query = "page=" + page;

        try {
        	int size = 10;
			int total_page = 0;
			int dataCount = 0;

			keyword = URLDecoder.decode(keyword, "utf-8");

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("keyword", keyword);
			
			dataCount = projectPostService.getProjectPostCount(map);
			if (dataCount != 0) {
				total_page = paginateUtil.pageCount(dataCount, size);
			}
			
			postPage = Math.min(postPage, total_page);
			
			int offset = (postPage - 1) * size;
			if (offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<ProjectPost> list = projectPostService.getProjectPostList(map);
			
			String cp = req.getContextPath();
			String postQuery = "";
			String listUrl = cp + "/project/post/list";
			String articleUrl = cp + "/project/post/article/" + projIdx  + "?postPage=" + postPage;

            if (!keyword.isBlank()) {
                postQuery = "schType=" + schType + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
            
                listUrl += "?" + postQuery;
                articleUrl += "&" + postQuery;
            }
            
            String paging = paginateUtil.paging(postPage, total_page, listUrl);
            
            model.addAttribute("projIdx", projIdx); 
            model.addAttribute("page", page);
            model.addAttribute("query", query);
            
            model.addAttribute("list", list);
            model.addAttribute("postPage", postPage);
            model.addAttribute("dataCount", dataCount);
            model.addAttribute("size", size);
            model.addAttribute("total_page", total_page);
            model.addAttribute("paging", paging);
            model.addAttribute("articleUrl", articleUrl);
            
            model.addAttribute("schType", schType);
            model.addAttribute("keyword", keyword);
            model.addAttribute("postQuery", postQuery);

        } catch (Exception e) {
            log.info("projectPostList : ", e);
        }

        return "project/projectPostList";
    }

    @GetMapping("write/{projIdx}")
    public String postWriteForm(
            @PathVariable("projIdx") long projIdx, Model model) {

        try {
        	model.addAttribute("mode", "write");      	
            model.addAttribute("projIdx", projIdx);
   
            
        } catch (Exception e) {
            log.info("projectPostWriteForm : ", e);
        }

        return "project/projectPostWrite";
    }
    
    @PostMapping("write/{projIdx}")
    public String postwriteSubmit(
    		@PathVariable("projIdx") long projIdx,
    		ProjectPost dto, HttpSession session) throws Exception {
    	  	
    	try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("projIdx", projIdx);
			paramMap.put("empIdx", info.getEmpIdx());
			
			long projMemberIdx = projectPostService.getProjectMemberIdx(paramMap);
			
			dto.setProjMemberIdx(projMemberIdx);			
			dto.setEmpIdx(info.getEmpIdx());
			
			projectPostService.insertProjectPost(dto, uploadPath);
    		
		} catch (Exception e) {
			log.info("postwriteSubmit : ", e);
		}
    	
    	
    	return "redirect:/project/post/list/{projIdx}";
    }
        
    
    @GetMapping("article/{projIdx}")
    public String article(
    		@PathVariable("projIdx") long projIdx,
    		@RequestParam("postIdx") long postIdx,
    		@RequestParam(name = "page", defaultValue = "1") String page,
    		@RequestParam(name = "postPage", defaultValue = "1") String postPage,
    		@RequestParam(name = "schType", defaultValue = "all") String schType,
    		@RequestParam(name = "keyword", defaultValue = "") String keyword,
    		Model model) throws Exception {
	
    	String query = "page=" + page;
    	model.addAttribute("query", query);
    	
    	try {
    		keyword = URLDecoder.decode(keyword, "utf-8");
    		
    		if(! keyword.isBlank()) {
    			query += "&schType=" + schType + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
    		}
    		
    		ProjectPost dto = Objects.requireNonNull(projectPostService.getProjectPostById(postIdx));
    		
    		Map<String, Object> map = new HashMap<>();
    		map.put("schType", schType);
    		map.put("keyword", keyword);
    		map.put("postIdx", postIdx);
    		
    		ProjectPost prevDto = projectPostService.getProjectPostByPrev(map);
    		ProjectPost nextDto = projectPostService.getProjectPostByNext(map);
    		
    		List<ProjectPost> listFile = projectPostService.getPostFileList(postIdx);
    		
    		model.addAttribute("dto", dto);
    		model.addAttribute("prevDto", prevDto);
    		model.addAttribute("nextDto", nextDto);
    		model.addAttribute("listFile", listFile);
    		model.addAttribute("projIdx", projIdx);
        	model.addAttribute("postPage", postPage);
        	
        	return "project/projectPostArticle";
    		
    	} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("article : ", e);
		}

    	return "redirect:/project/projectPostList?postPage=" + postPage;
    }
    
    @GetMapping("update/{projIdx}")
    public String updateForm(
    		@PathVariable("projIdx") long projIdx,
    		@RequestParam(name = "postPage") String postPage,
    		@RequestParam(name = "page", defaultValue = "1") String page,
    		Model model, HttpSession session) throws Exception {
    	
    	String query = "page=" + page;
    	model.addAttribute("query", query);
    	
    	try {
    		SessionInfo info = (SessionInfo)session.getAttribute("member");
    		
    		ProjectPost dto = Objects.requireNonNull(projectPostService.getProjectPostById(projIdx));
			
    		if(info.getEmpIdx() != dto.getEmpIdx()) {
				return "redirect:/project/post/list/{projIdx}?postPage=" + postPage;
			}
			
			List<ProjectPost> listFile = projectPostService.getPostFileList(projIdx);
			
			model.addAttribute("mode", "update");
			model.addAttribute("postPage", postPage);
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);
    		
			return "project/post/write";
			
    	} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}
    	
    	return "redirect:/project/projectPostList?postPage=" + postPage;
    }
    
    @PostMapping("update/{projIdx}")
    public String updateSubmit(
    		@PathVariable("projIdx") long projIdx, Model model,
    		@RequestParam(name = "page") String page,
    		@RequestParam(name = "postPage") String postPage,		
    		ProjectPost dto, HttpSession session) throws Exception {
    		
    	try {
    		String query = "page=" + page;
        	model.addAttribute("query", query);
        	
        	SessionInfo info = (SessionInfo)session.getAttribute("member");
        	
        	dto.setEmpIdx(info.getEmpIdx());
        	projectPostService.updateProjectPost(dto, uploadPath);
			
		} catch (Exception e) {
			log.info("updateSubmit : ", e);
		}
    	
    	
    	return "redirect:/project/projectPostList?postPage=" + postPage;
    }
    
    @GetMapping("delete/{projIdx}")
    public String deleteProjectPost(@PathVariable("projIdx") long projIdx,
    		@RequestParam(name = "page") String page,
    		@RequestParam(name = "postPage") String postPage,
    		@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "keyword", defaultValue = "") String keyword,
			HttpSession session, Model model) throws Exception {
    	
    	try {
    		String query = "page=" + page;
        	model.addAttribute("query", query);
        	
        	keyword = URLDecoder.decode(keyword, "utf-8");
        	if(! keyword.isBlank()) {
				query += "&schType=" + schType + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
			}
        	
        	projectPostService.deleteProjectPost(projIdx, uploadPath);
        	
        	
		} catch (Exception e) {
			log.info("deleteProjectPost : e", e);
		}
    	
    	return "redirect:/project/projectPostList?postPage=" + postPage;
    }
    
	@GetMapping("download")
	public ResponseEntity<?> download(@RequestParam(name = "fileIdx") long fileIdx) throws Exception {
		
		try {
			Board dto = Objects.requireNonNull(projectPostService.findByFileId(fileIdx));
			
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
	public ResponseEntity<?> zipdownload(@RequestParam(name = "postIdx") long postIdx) throws Exception {
		try {
			List<ProjectPost> listFile = projectPostService.getPostFileList(postIdx);
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
			Board dto = Objects.requireNonNull(projectPostService.findByFileId(fileIdx));
			
			projectPostService.deleteUploadFile(uploadPath, dto.getSaveFilename());
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileIdx");
			map.put("postIdx", fileIdx);
			
			projectPostService.deleteFile(map);
			
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
	public Map<String, Object> insertReply(ProjectPostCmt dto, HttpSession session) {
		Map<String, Object> model = new HashMap<>();
		
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			long projIdx = dto.getProjIdx();
			long projMemberIdx = projectPostService.getProjMemberIdx(projIdx, info.getEmpIdx());
			
			dto.setProjMemberIdx(projMemberIdx);
			
			projectPostService.insertReply(dto);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	

	@GetMapping("listReply")
	public String listReply(
			@RequestParam(name = "postIdx") long postIdx,
			@RequestParam(name = "postPage", defaultValue = "1") int postPage,
			Model model, HttpServletResponse resp, HttpSession session) throws Exception {
	
		try {
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			int size = 5;
			int total_page = 0;
			int dataCount = 0;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postIdx", postIdx);
			map.put("empIdx", info.getEmpIdx());
			
			dataCount = projectPostService.getPostReplyCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			postPage = Math.min(postPage, total_page);
			
			int offset = (postPage - 1) * size;
			if(offset < 0) offset= 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<ProjectPostCmt> listReply = projectPostService.getPostReplyList(map);
			
			String paging = paginateUtil.pagingMethod(postPage, total_page, "listPage");
			
			model.addAttribute("listReply", listReply);
			model.addAttribute("postPage", postPage);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);

		} catch (Exception e) {
			log.info("listReply : ", e);
			
			resp.sendError(406);
			throw e;
		}
		
		return "project/projectPostListReply";
	}
	
	
    
}
