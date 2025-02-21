<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/approvalLine/list.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="left">
				<ul>
					<li><input type="checkbox"></li>
					<li>결재 라인 이름</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li>기본<li>
				</ul>
			</div>
			<div class="right">
				<div class="addNshow">
					<ul>
						<li>결재 순서</li>
						<li>부서</li>
						<li>소속</li>
						<li>이름</li>
						<li>직급</li>
					</ul>
					<ul>
						<li>1</li>
						<li>${sessionScope.member.deptName}</li>
						<li>${sessionScope.member.teamName}</li>
						<li>${sessionScope.member.empName}</li>
						<li>${sessionScope.member.positionName}</li>
					</ul>
					<ul>
						<li>2</li>
						<li>
							<select>
								<option>부서</option>
							</select>
						</li>
						<li>
							<select>
								<option>소속</option>
							</select>
						</li>
						<li>
							<select>
								<option>이름</option>
							</select>
						</li>
						<li>
							<select>
								<option>직급</option>
							</select>
						</li>
					</ul>
					<ul>
						<li>3</li>
						<li>
							<select>
								<option>부서</option>
							</select>
						</li>
						<li>
							<select>
								<option>소속</option>
							</select>
						</li>
						<li>
							<select>
								<option>이름</option>
							</select>
						</li>
						<li></li>
					</ul>
					<ul>
						<li>4</li>
						<li>
							<select>
								<option>부서</option>
							</select>
						</li>
						<li>
							<select>
								<option>소속</option>
							</select>
						</li>
						<li>
							<select>
								<option>이름</option>
							</select>
						</li>
						<li></li>
					</ul>
				</div>
				<div class="btnArea">
					<button>추가하기</button>
					<button>수정하기</button>
				</div>
			</div>
		</div>
	</main>

</body>
</html>