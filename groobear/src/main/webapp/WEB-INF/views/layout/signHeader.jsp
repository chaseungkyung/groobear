<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="titleArea" style="width: 100%; margin-bottom: 10%; display: flex; justify-content: center;">
			<div class="tilte" style="width: 80%; box-sizing: border-box; padding: 7px 10px; display: flex; align-items: center; justify-content: center; border: 1px solid #efefef; border-radius: 5px;">전자 결재</div>
		</div>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
						문서 작성
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/sign/write">휴가신청서</a></li>
							<li><a href="${pageContext.request.contextPath}/">문서 양식2</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseOne">
						결재 상신함
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/">결재 진행함</a></li>
							<li><a href="${pageContext.request.contextPath}/">결재 완료함</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseTwo">
						결재 수신함
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/">결재 요청</a></li>
							<li><a href="${pageContext.request.contextPath}/">결재 내역</a></li>
							<li><a href="${pageContext.request.contextPath}/">수신 참조</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseTwo">
						결재 라인 설정
					</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/">결재 라인 설정</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>