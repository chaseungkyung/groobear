package com.sp.app.controller.project;

import java.net.URLDecoder;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.PaginateUtil;
import com.sp.app.service.project.ProjectService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/project/post/*")
public class ProjectPostController {
    private final ProjectService service;
    private final PaginateUtil paginateUtil;

    @GetMapping("list/{projIdx}")
    public String projectPostList(
            @PathVariable("projIdx") long projIdx,
            @RequestParam(name = "page", defaultValue = "1") String page,
            @RequestParam(name = "kwd", defaultValue = "") String kwd,
            Model model) throws Exception {

        String query = "page=" + page;

        try {
            kwd = URLDecoder.decode(kwd, "utf-8");

            if (!kwd.isBlank()) {
                query += "kwd=" + URLEncoder.encode(kwd, "utf-8");
            }

            model.addAttribute("projIdx", projIdx);
            model.addAttribute("page", page);
            model.addAttribute("query", query);

            return "project/projectPostList";

        } catch (Exception e) {
            log.info("projectPostList : ", e);
        }

        return "redirect:/project/projectList?" + query;
    }

    @GetMapping("write/{projIdx}")
    public String projectPostWriteForm(
            @PathVariable("projIdx") long projIdx,
            @RequestParam(name = "page", defaultValue = "1") String page,
            Model model) {

        String query = "page=" + page;

        try {

            model.addAttribute("projIdx", projIdx);
            model.addAttribute("page", page);

            return "project/projectPostWrite";
        } catch (Exception e) {
            log.info("projectPostWriteForm : ", e);
        }

        return "redirect:/project/projectList?" + query;
    }
}
