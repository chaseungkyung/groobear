<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="reply-info">
	<span class="reply-count">댓글 ${replyCount} 개</span>
	<span>[목록, ${postPage}/${total_page} 페이지] </span>
</div>

<table class="table table-borderless">
	<c:forEach var="dto" items="${listReply}">
		<tr class="border table-light">
			<td width="50%">
				<div class="row reply-writer">
					<div class="col-1"><i class="bi bi-person-circle text-muted icon"></i></div>
					<div class="col-auto align-self-center">
						<div class="name">${dto.empName}</div>
						<div class="date">${dto.regDate}</div>
					</div>
				</div>
			</td>
			<td width="50%" align="right" class="align-middle">
				<span class="reply-dropdown"><i class="bi bi-three-dots-vertical"></i></span>
				<div class="reply-menu">
					<c:choose>
						<c:when test="${sessionScope.member.empIdx==dto.empIdx}">
							<div class="deleteReply reply-menu-item" data-cmtIdx="${dto.cmtIdx}" data-postPage="${postPage}">삭제</div>
							<div class="hideReply reply-menu-item">숨김</div>
						</c:when>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" valign="top" class="text-primary text-opacity-30">${dto.content}</td>
		</tr>
	</c:forEach>
</table>

<div class="page-navigation">
	${paging}
</div>