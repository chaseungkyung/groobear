<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectList.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">
	<style type="text/css">
		main .listArea {margin-bottom: 20px;}
		main .listArea ul:not(:nth-of-type(1)) li {border-bottom: 1px solid #eee; box-sizing: border-box;}
		main .listArea ul li a {display: block; width: 100%; white-space: nowrap; overflow: hidden; text-overflow : ellipsis;}
		main .listArea ul li a:hover {text-decoration: underline;}
		
		main .listArea ul li:nth-child(1) {width: 5%;}
		main .listArea ul li:nth-child(2) {width: 50%;}
		main .listArea ul li:nth-child(3) {width: 10%;}
		main .listArea ul li:nth-child(4) {width: 10%;}
		main .listArea ul li:nth-child(5) {width: 15%;}
		main .listArea ul li:nth-child(6) {width: 10%;}
		
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/project/projectHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="listArea">
				<ul>
					<li>No</li>
					<li>프로젝트</li>
					<li>시작일</li>
					<li>종료일</li>
					<li>프로젝트 매니저</li>
					<li>등록일</li>
				</ul>
				
				<c:forEach var="dto" items="${listProject}" varStatus="status">
					<ul>
						<li>${dataCount - (page - 1) * size - status.index}</li>
						<li class="project-name">
							<a href="${detailUrl}/${dto.projIdx}?${query}">${dto.projName}</a>							
			            <c:if test="${sessionScope.member.deptIdx == 'F' && sessionScope.member.positionCode == 5}">
			                <span class="project-actions">
								<button type="button" class="btn btn-sm btn-update" title="수정" onclick="updateProject(${dto.projIdx})">
								    <i class="bi bi-pencil"></i>
								</button>

			                    <button type="button" class="btn btn-sm btn-delete" title="삭제" onclick="deleteProject(${dto.projIdx})">
			                        <i class="bi bi-trash"></i>
			                    </button>
			                </span>
			            </c:if>							
						</li>
						<li>${dto.startDate}</li>
						<li>${dto.endDate}</li>
						<li>${dto.pmEmpName}</li>
						<li>${dto.createdAt}</li>
					</ul>
				</c:forEach>
			</div>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<div class="search-container">
				<form class="row" name="searchForm">
					<div class="col-auto p-1">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>						
					</div>
					<div class="col-auto p-1">
						<input type="text" name="kwd" value="${kwd}" class="form-control" placeholder="프로젝트 이름으로 검색하세요.">
					</div>
					<div class="col-auto p-1">
						<button type="button" class="btn btn-light" onclick="searchList()">
							<i class="bi bi-search"></i> 
						</button>
					</div>
				</form>		
			</div>		
				
		</div>
	</main>
	
<script type="text/javascript">
window.addEventListener('load', () => {
	const inputEL = document.querySelector('form input[name=kwd]'); 
	inputEL.addEventListener('keydown', function (evt) {
	    if(evt.key === 'Enter') {
	    	evt.preventDefault();
	    	
	    	searchList();
	    }
	});
});

function searchList() {
	const f = document.searchForm;
	if(! f.kwd.value.trim()) {
		return;
	}
	
	const formData = new FormData(f);
	let requestParams = new URLSearchParams(formData).toString();
	
	let url = '${pageContext.request.contextPath}/project/list';
	location.href = url + '?' + requestParams;
}


function updateProject(projIdx) {
    location.href = '${pageContext.request.contextPath}/project/update?projIdx=' + projIdx + '&page=' + "${page}";
}



function deleteProject(projIdx) {
    if (confirm("정말 이 프로젝트를 삭제하시겠습니까?")) {
        let url = '${pageContext.request.contextPath}/project/delete?projIdx=' + projIdx + '&' + "${query}";
        location.href = url;
    }
}


</script>

</body>
</html>