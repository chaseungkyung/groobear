package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Member;
import com.sp.app.model.approval.ApprovalLine;
import com.sp.app.model.approval.ApprovalRef;
import com.sp.app.model.approval.DocAppFile;
import com.sp.app.model.approval.DocApproval;
import com.sp.app.model.docBox.ApprovalReq;
import com.sp.app.model.docBox.IncidentReport;
import com.sp.app.model.docBox.LeaveRequest;
import com.sp.app.model.docBox.OvertimeRequest;

public interface SignService {
	
	public void insertDocApproval(DocApproval dto) throws Exception;
	public void insertApprovalLine(ApprovalLine dto) throws Exception;
	public void insertApprovalRef(ApprovalRef dto) throws Exception;
	public void insertDocAppFile(DocAppFile dto) throws Exception;
	
	public void insertLeaveRequest(LeaveRequest dto) throws Exception;
	public void insertOvertimeRequest(OvertimeRequest dto) throws Exception;
	public void insertIncidentReport(IncidentReport dto) throws Exception;
	public void insertApprovalReq(ApprovalReq dto) throws Exception;
	
	public List<Member> listMember(Map<String, Object> map);
	
}
