package com.sp.app.controller.project;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.sp.app.model.project.ProjectPost;
import com.sp.app.service.project.ProjectService;

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
    private final ProjectService service;
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
            @RequestParam(name = "postPage", defaultValue = "1") int postPage,
            @RequestParam(name = "schType", defaultValue = "all") String schType,
            @RequestParam(name = "keyword", defaultValue = "") String keyword,
            Model model, HttpServletRequest req) throws Exception {


        try {
        	int size = 10;
			int total_page = 0;
			int dataCount = 0;

			keyword = URLDecoder.decode(keyword, "utf-8");

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("keyword", keyword);
			
			dataCount = service.getProjectPostCount(map);
			if (dataCount != 0) {
				total_page = paginateUtil.pageCount(dataCount, size);
			}
			
			postPage = Math.min(postPage, total_page);
			
			int offset = (postPage - 1) * size;
			if (offset < 0)
				offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<ProjectPost> list = service.getProjectPostList(map);
			
			String cp = req.getContextPath();
			String postQuery = "postPage=" + postPage;
			String listUrl = cp + "/project/post/list";
			String articleUrl = cp + "/project/post/article?postPage=" + postPage;

            if (!keyword.isBlank()) {
                postQuery = "schType=" + schType + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
            
                listUrl += "?" + postQuery;
                articleUrl += "&" + postQuery;
            }
            
            String paging = paginateUtil.paging(postPage, total_page, listUrl);
            
            model.addAttribute("projIdx", projIdx); 
            
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
			
			long projMemberIdx = service.getProjectMemberIdx(paramMap);
			
			dto.setProjMemberIdx(projMemberIdx);			
			dto.setEmpIdx(info.getEmpIdx());
			
			service.insertProjectPost(dto, uploadPath);
    		
		} catch (Exception e) {
			log.info("postwriteSubmit : ", e);
		}
    	
    	
    	return "redirect:/project/post/list/{projIdx}";
    }
        
    /*
    @GetMapping("article")
    public String article(
    		@PathVariable("projIdx") long projIdx,
    		@PathVariable("postIdx") long postIdx,
    		@RequestParam(name = "page", defaultValue = "1") String page,
    		@RequestParam(name = "postPage", defaultValue = "1") String postPage,
    		@RequestParam(name = "sType", defaultValue = "all") String sType,
    		@RequestParam(name = "postKwd", defaultValue = "") String postKwd,
    		HttpSession session) throws Exception {
    	
    	return "project/projectPostArticle";
    }
    */
    
    @GetMapping("article")
    public String article() {
    	
    	return "project/projectPostArticle";
    }
    
}
