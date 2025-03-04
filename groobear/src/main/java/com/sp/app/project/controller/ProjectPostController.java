package com.sp.app.project.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.PaginateUtil;
import com.sp.app.common.StorageService;
import com.sp.app.model.SessionInfo;
import com.sp.app.project.model.ProjectPost;
import com.sp.app.project.service.ProjectPostService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
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
    		
    		List<ProjectPost> listFile = projectPostService.getPostFileList(postIdx);
    		
    		model.addAttribute("dto", dto);
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
    
    

    
}
