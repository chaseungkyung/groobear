package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.SignMapper;
import com.sp.app.model.Member;
import com.sp.app.model.approval.ApprovalLine;
import com.sp.app.model.approval.ApprovalRef;
import com.sp.app.model.approval.DocAppFile;
import com.sp.app.model.approval.DocApproval;
import com.sp.app.model.docBox.ApprovalReq;
import com.sp.app.model.docBox.IncidentReport;
import com.sp.app.model.docBox.LeaveRequest;
import com.sp.app.model.docBox.OvertimeRequest;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class SignServiceImpl implements SignService {
	
	private final SignMapper mapper;

	@Override
	public void insertDocApproval(DocApproval dto) throws Exception {
		
	}

	@Override
	public void insertApprovalLine(ApprovalLine dto) throws Exception {
		
	}

	@Override
	public void insertApprovalRef(ApprovalRef dto) throws Exception {
		
	}

	@Override
	public void insertDocAppFile(DocAppFile dto) throws Exception {
		
	}

	@Override
	public void insertLeaveRequest(LeaveRequest dto) throws Exception {
		
	}

	@Override
	public void insertOvertimeRequest(OvertimeRequest dto) throws Exception {
		
	}

	@Override
	public void insertIncidentReport(IncidentReport dto) throws Exception {
		
	}

	@Override
	public void insertApprovalReq(ApprovalReq dto) throws Exception {
		
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		
		List<Member> list = null;
		
		try {
			
			list = mapper.listMember(map);
			
		} catch (Exception e) {
			log.info("listMember : ", e);
		}
		
		return list;
	}

}
