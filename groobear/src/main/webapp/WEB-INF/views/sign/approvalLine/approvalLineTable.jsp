<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<div class="btnArea">
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/sign/list'" class="cancel">작성 취소</button>
	<button type="button" onclick="submit();">상신하기</button>
</div>
<div class="approvalLine">
	<div class="getApprovalLine">
		<p>결재라인 불러오기</p>
	</div>
	<table>
		<tr>
			<th>${sessionScope.member.deptName} ${sessionScope.member.empName} ${sessionScope.member.positionName}</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<tr class="approvalCell">
			<td>${sessionScope.member.empName}</td>
			<td>
				<button type="button" class="approvalAdd">등록하기</button>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr class="signDate">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>참조자</th>
			<td></td>
		</tr>
	</table>
</div>