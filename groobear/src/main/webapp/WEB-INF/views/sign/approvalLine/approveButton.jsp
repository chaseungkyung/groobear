<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<div class="approvalLine">
	<div class="lineBtn">
		<div class="btnWrap">
			<a href="javascript:history.back();">뒤로가기</a>
		</div>
	</div>
	<table>
		<tr>
			<th>${approvalLine.writerDeptName} ${approvalLine.writerTeamName} ${approvalLine.writerName} ${approvalLine.writerPositionName}</th>
			<th>${approvalLine.apr1DeptName} ${approvalLine.apr1TeamName} ${approvalLine.apr1Name} ${approvalLine.apr1PositionName}</th>
			<th>${approvalLine.apr2DeptName} ${approvalLine.apr2TeamName} ${approvalLine.apr2Name} ${approvalLine.apr2PositionName}</th>
			<th>${approvalLine.apr3DeptName} ${approvalLine.apr3TeamName} ${approvalLine.apr3Name} ${approvalLine.apr3PositionName}</th>
		</tr>
		<tr class="approvalCell">
			<td>${approvalLine.writerName}</td>
			<td class="apr1Result">
				<c:if test="${approvalLine.apr1Info eq sessionScope.member.empCode}">
					<button type="button" class="approvalAction" value="2" data-aprresult="apr1Result" data-apremp="apr1Emp" data-at="apr1At">반려</button>
					<button type="button" class="approvalAction" value="1" data-aprresult="apr1Result" data-apremp="apr1Emp" data-at="apr1At">결재하기</button>
				</c:if>
			</td>
			<td>
				<c:if test="${approvalLine.apr2Info eq sessionScope.member.empCode}">
					<button type="button" class="approvalAction" value="2" data-aprresult="apr2Result" data-apremp="apr2Emp" data-at="apr2At">반려</button>
					<button type="button" class="approvalAction" value="1" data-aprresult="apr2Result" data-apremp="apr2Emp" data-at="apr2At">결재하기</button>
				</c:if>
			</td>
			<td>
				<c:if test="${approvalLine.apr3Info eq sessionScope.member.empCode}">
					<button type="button" class="approvalAction" value="2" data-aprresult="apr3Result" data-apremp="apr3Emp" data-at="apr3At">반려</button>
					<button type="button" class="approvalAction" value="1" data-aprresult="apr3Result" data-apremp="apr3Emp" data-at="apr3At">결재하기</button>
				</c:if>
			</td>
		</tr>
		<tr class="signDate">
			<td>${docApproval.regDate}</td>
			<td>${approvalLine.apr1At}</td>
			<td>${approvalLine.apr2At}</td>
			<td>${approvalLine.apr3At}</td>
			</tr>
		</table>
		<table>
			<tr>
				<th>참조자</th>
				<td></td>
			</tr>
		</table>
	</div>