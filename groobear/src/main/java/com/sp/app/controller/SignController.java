package com.sp.app.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.SessionInfo;
import com.sp.app.model.approval.ApprovalLine;
import com.sp.app.model.approval.ApprovalRef;
import com.sp.app.model.approval.DocAppFile;
import com.sp.app.model.approval.DocApproval;
import com.sp.app.model.docBox.ApprovalReq;
import com.sp.app.model.docBox.IncidentReport;
import com.sp.app.model.docBox.LeaveRequest;
import com.sp.app.service.SignService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/sign/*")
public class SignController {

	private final SignService service;
	private final PaginateUtil paginateUtil;
	
	@GetMapping("signMain")
	public String list() {
		return "sign/signMain";
	}
	
	// 결재 진행함, 완료함, 요청함, 내역, 참조
	@GetMapping({"inProgress", "completed", "request", "history", "reference"})
	public String allList (
			@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model, HttpServletRequest req,
			HttpSession session
			) {
		
		String requestUri = req.getRequestURI();
		
		String mode = "";
		
		if (requestUri.contains("inProgress")) mode = "inProgress";
		else if (requestUri.contains("completed")) mode = "completed";
		else if (requestUri.contains("request")) mode = "request";
		else if (requestUri.contains("history")) mode = "history";
		else if (requestUri.contains("reference")) mode = "reference";
		
		model.addAttribute("mode", mode);
			
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("schTyp", schType);
			map.put("kwd", kwd);
			map.put("empCode", info.getEmpCode());
			map.put("empIdx", info.getEmpIdx());
			
			if("inProgress".equals(mode)) {
				map.put("status", "inprogress");
			} else if("completed".equals(mode)) {
				map.put("status", "completed");
			} else if("history".equals(mode)) {
				map.put("status", "history");
			}
			
			dataCount =  service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<DocApproval> inProgressList = service.inProgressList(map);
			List<ApprovalLine> approvalLineList = service.approvalList(map);
			
			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "/sign/list";
			String articleUrl = cp + "/sign/";
			
//			DocApproval doc = null;
//			
//			String docType = doc.getDocType();
//			
//			if("결재 요청서".equals(docType)) {
//				
//				articleUrl += "approvalRequestArticle";
//				
//			} else if ("휴가 신청서".equals(docType)) {
//				
//				articleUrl += "leaveRequestArticle";
//				
//			} else if ("시말서".equals(docType)) {
//				
//				articleUrl += "incidentReportArticle";
//				
//			}
			
			if(! kwd.isBlank()) {
				String qs = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
				
				listUrl += "?" + qs;
				query += "&" + qs;
			}
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("docApprovalList", inProgressList);
			model.addAttribute("approvalLineList", approvalLineList);
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
 			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);
			
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			model.addAttribute("query", query);
			
		} catch (Exception e) {
			log.info("singAllList : ", e);
		}
		
		return "sign/list";
	}
	
	@GetMapping("leaveRequest")
	public String leaveRequestForm(Model model) {
		return "sign/leaveRequest";
	}
	
	@PostMapping("leaveRequest")
	public String leaveRequestSubmit(
			DocApproval docApproval, // 결재서류 보관함
			DocAppFile docAppFile, // 결재 서류 첨부파일
			ApprovalLine approvalLine, // 결재 라인 d
			ApprovalRef approvalRef, // 결재 참조
			LeaveRequest leaveRequest, // 휴가 신청서
			Model model, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			model.addAttribute("teamName", info.getTeamName());
			model.addAttribute("positionName", info.getPositionName());
			
			docApproval.setEmpIdx(info.getEmpIdx()); // 작성 사원
			docApproval.setDeptIdx(info.getDeptIdx()); // 작성 사원 부서
			docApproval.setTeamIdx(info.getTeamIdx()); // 작성 사원 팀
			docApproval.setPositionCode(info.getPositionCode()); // 작성 사원 직급
			
			approvalLine.setWriterEmp(info.getEmpIdx());
			approvalLine.setWriterInfo(info.getEmpCode());
			
			service.insertDocApproval(docApproval);
			
			approvalLine.setAprIdx(docApproval.getAprIdx());
			
			service.insertApprovalLine(approvalLine);
			
			leaveRequest.setAprIdx(docApproval.getAprIdx());
			
			service.insertLeaveRequest(leaveRequest);
			
			// 만약 참조가 있으면
			// service.insertApprovalReq(approvalRef);
			
			// 만약 파일이 있으면
			// service.insertDocAppFile(docAppFile);
			
			
		} catch (Exception e) {
			log.info("handleHome : ", e);
			throw e;
		}
		
		return "redirect:/sign/list";
	}
	
	@GetMapping({"approvalRequestArticle/{aprIdx}", "incidentReportArticle/{aprIdx}", "leaveRequestArticle/{aprIdx}"})
	public String article(
			@PathVariable("aprIdx") long aprIdx,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model, HttpSession session, HttpServletRequest request
			) {
		
		String query = "page=" + page;
		
		try {
			
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			if(! kwd.isBlank()) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			DocApproval docApproval = service.docApprovalAprIdx(aprIdx);
			ApprovalLine approvalLine = service.approvalLineAprIdx(aprIdx);
			ApprovalRef approvalRef = service.approvalRefAprIdx(aprIdx);
			DocAppFile docAppFile = service.docAppFileAprIdx(aprIdx);
			
			LeaveRequest leaveRequest = service.leaveRequestAprIdx(aprIdx);
			ApprovalReq approvalReq = service.approvalReqAprIdx(aprIdx);
			IncidentReport incidentReport = service.incidentReportAprIdx(aprIdx);
			
			model.addAttribute("docApproval", docApproval);
			model.addAttribute("approvalLine", approvalLine);
			model.addAttribute("approvalRef", approvalRef);
			model.addAttribute("docAppFile", docAppFile);
			
			model.addAttribute("leaveRequest", leaveRequest);
			model.addAttribute("approvalReq", approvalReq);
			model.addAttribute("incidentReport", incidentReport);
			
			model.addAttribute("query", query);
			model.addAttribute("page", page);
			
			String uri = request.getRequestURI();
			
			if(uri.contains("/approvalRequestArticle/")) {
				
				return "sign/approvalRequestArticle";
				
			} else if (uri.contains("/incidentReportArticle/")) {
				
				return "sign/incidentReportArticle";
				
			} else if (uri.contains("/leaveRequestArticle/")) {
				
				return "sign/leaveRequestArticle";
				
			}
			
		} catch (Exception e) {
			log.info("article : ", e);
		}
		
		return "redirect:/sign/list?" + query;
	}
	
	@ResponseBody
	@PostMapping("updateResult")
	public Map<String, ?> updateResult (
			@RequestParam(name = "aprIdx") long aprIdx,
			@RequestParam(name = "aprPerson") String aprPerson,
			@RequestParam(name = "aprEmp") String aprEmp,
			@RequestParam(name = "aprAt") String aprAt,
			@RequestParam(name = "result") int result,
			HttpSession session, DocApproval dto
			) {
		
		Map<String, Object> model = new HashMap<>();
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("aprIdx", aprIdx);
			map.put("aprPerson", aprPerson);
			map.put("aprEmp", aprEmp);
			map.put("aprAt", aprAt);
			map.put("result", result);
			map.put("empIdx", info.getEmpIdx());
			
			service.updateResult(map);
			
			String paymentStage = dto.getPaymentStage();
			int status = dto.getStatus();
			
			if((Integer.parseInt(paymentStage) - 1) != status) {
				
				if(aprEmp.equals("apr1Emp") && result == 1) map.put("status", 1);
				else if(aprEmp.equals("apr1Emp") && result == 2) map.put("status", 11);
				else if (aprEmp.equals("apr2Emp") && result == 1) map.put("status", 2);
				else if (aprEmp.equals("apr2Emp") && result == 2) map.put("status", 12);
				else if (aprEmp.equals("apr3Emp") && result == 1) map.put("status", 3);
				else if (aprEmp.equals("apr3Emp") && result == 2) map.put("status", 13);
				
			} else if((Integer.parseInt(paymentStage) - 1) == status && result == 1) {
				map.put("status", 99);
			}
			
			service.updatedocApprovalStatus(map);
			
		} catch (Exception e) {
			log.info("updateResult : ", e);
		}
		
		return model;
	}
	
	@GetMapping("approvalRequest")
	public String approvalRequestForm(Model model) {
		return "sign/approvalRequest";
	}
	
	@PostMapping("approvalRequest")
	public String approvalRequestSubmit(
			DocApproval docApproval, // 결재서류 보관함
			DocAppFile docAppFile, // 결재 서류 첨부파일
			ApprovalLine approvalLine, // 결재 라인
			ApprovalRef approvalRef, // 결재 참조
			ApprovalReq approvalReq, // 결재 요청서
			Model model, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			model.addAttribute("teamName", info.getTeamName());
			model.addAttribute("positionName", info.getPositionName());
			
			docApproval.setEmpIdx(info.getEmpIdx()); // 작성 사원
			docApproval.setDeptIdx(info.getDeptIdx()); // 작성 사원 부서
			docApproval.setTeamIdx(info.getTeamIdx()); // 작성 사원 팀
			docApproval.setPositionCode(info.getPositionCode()); // 작성 사원 직급
			
			approvalLine.setWriterEmp(info.getEmpIdx());
			approvalLine.setWriterInfo(info.getEmpCode());
			
			service.insertDocApproval(docApproval);
			
			approvalLine.setAprIdx(docApproval.getAprIdx());
			
			service.insertApprovalLine(approvalLine);
			
			approvalReq.setAprIdx(docApproval.getAprIdx());
			
			service.insertApprovalReq(approvalReq);
			
		} catch (Exception e) {
			log.info("approvalRequest", e);
			throw e;
		}
		
		return "redirect:/sign/list";
	}
	
	@GetMapping("incidentReport")
	public String incidentReportForm(Model model) {
		return "sign/incidentReport";
	}
	
	@PostMapping("incidentReport")
	public String incidentReportSubmit(
			DocApproval docApproval, // 결재서류 보관함
			DocAppFile docAppFile, // 결재 서류 첨부파일
			ApprovalLine approvalLine, // 결재 라인
			ApprovalRef approvalRef, // 결재 참조
			IncidentReport incidentReport, // 시말서
			Model model, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			model.addAttribute("teamName", info.getTeamName());
			model.addAttribute("positionName", info.getPositionName());
			
			docApproval.setEmpIdx(info.getEmpIdx()); // 작성 사원
			docApproval.setDeptIdx(info.getDeptIdx()); // 작성 사원 부서
			docApproval.setTeamIdx(info.getTeamIdx()); // 작성 사원 팀
			docApproval.setPositionCode(info.getPositionCode()); // 작성 사원 직급
			
			approvalLine.setWriterEmp(info.getEmpIdx());
			approvalLine.setWriterInfo(info.getEmpCode());
			
			service.insertDocApproval(docApproval);
			
			approvalLine.setAprIdx(docApproval.getAprIdx());
			
			service.insertApprovalLine(approvalLine);
			
			incidentReport.setAprIdx(docApproval.getAprIdx());
			
			service.insertIncidentReport(incidentReport);
			
		} catch (Exception e) {
			log.info("incidentReportSubmit : ", e);
			throw e;
		}
		
		return "redirect:/sign/list";
	}
	
}
