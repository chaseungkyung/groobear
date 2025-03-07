<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!-- Bootstrap Bundle (JS 포함) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="listArea">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/workList"><img alt="" src="${pageContext.request.contextPath}/dist/images/mypage/user.png">마이페이지</a></li>
			</ul>
		</div>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
						환경설정
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/pwd?mode=update">개인정보변경</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/alarmSetting">알람설정변경</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/pwd?mode=pwd">비밀번호변경</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>