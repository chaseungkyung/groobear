<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<a href="${pageContext.request.contextPath}/contact/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">주소록 추가</a>
		</div>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
						부서 주소록
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
					        <li><input type="checkbox" checked> 전체</li>
					        <li>
						        <ul>
						            <li class="dept">
						                <input type="checkbox"> 인사부
						                <ul class="team">
						                    <li><input type="checkbox"> 인사 1팀</li>
						                    <li><input type="checkbox"> 인사 2팀</li>
						                </ul>
						            </li>
						            <li class="dept">
						                <input type="checkbox"> 법무부
						                <ul class="team">
						                    <li><input type="checkbox"> 법무 1팀</li>
						                    <li><input type="checkbox"> 법무 2팀</li>
						                </ul>
						            </li>
						            <li class="dept">
						                <input type="checkbox"> 경영관리부
						                <ul class="team">
						                    <li><input type="checkbox"> 경영 1팀</li>
						                    <li><input type="checkbox"> 경영 2팀</li>
						                </ul>
						            </li>
						            <li class="dept">
						                <input type="checkbox"> 재무회계부
						                <ul class="team">
						                    <li><input type="checkbox"> 재무팀</li>
						                    <li><input type="checkbox"> 회계팀</li>
						                </ul>
						            </li>
						            <li class="dept">
						                <input type="checkbox"> 영업마케팅부
						                <ul class="team">
						                    <li><input type="checkbox"> 영업팀</li>
						                    <li><input type="checkbox"> 마케팅팀</li>
						                </ul>
						            </li>
						            <li class="dept">
						                <input type="checkbox"> SW 개발부
						                <ul class="team">
						                    <li><input type="checkbox"> 솔루션아키텍처팀</li>
						                    <li><input type="checkbox"> 데이터베이스팀</li>
						                    <li><input type="checkbox"> QA팀</li>
						                    <li><input type="checkbox"> 인프라엔지니어링팀</li>
						                    <li><input type="checkbox"> 기술지원팀</li>
						                </ul>
						            </li>
						            <li class="dept">
						                <input type="checkbox"> 임원진
						                <ul class="team">
						                    <li><input type="checkbox"> 대표이사</li>
						                    <li><input type="checkbox"> 재무이사</li>
						                    <li><input type="checkbox"> 운영이사</li>
						                    <li><input type="checkbox"> 총괄사업부</li>
						                </ul>
						            </li>
						        </ul>
					        </li>
					    </ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						고객사 주소록
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li></li>
							<li>
								<ul>
									<li></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>