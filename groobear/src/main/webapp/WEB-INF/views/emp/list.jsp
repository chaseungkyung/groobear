<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/emp/list.css" type="text/css">
	<style type="text/css">
		main {width: 93vw;}
		main .mainInner {width: 83vw;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner">
			<div class="searchArea">
				<form name="searchForm">
	                <div class="search">
	                    <input type="text" name="" id="">
	                    <button onclick="searchList()"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/search.png"></button>
	                </div>
	            </form>
                <div class="selectAdd">
                    <select name="" id="">
                        <option value="0" selected>재직</option>
                        <option value="1">휴직</option>
                        <option value="2">퇴사</option>
                    </select>
                    <div class="addEmp">
                        <a href="${pageContext.request.contextPath}/emp/add"><img alt="" src="${pageContext.request.contextPath}/dist/images/emp/addEmp.png">사원추가</a>
                    </div>
                    <div>
                        <button type="button" class="btn" onclick="printEmp();">🖨️</button>
                    </div>
                </div>
            </div>
            <form action="">
	            <div class="listArea">
	                <ul>
	                	<li></li>
	                    <li>사원번호</li>
	                    <li>이름</li>
	                    <li>부서</li>
	                    <li>팀</li>
	                    <li>직급</li>
	                    <li>입사년월일</li>
	                    <li>전화번호</li>
	                    <li>내선번호</li>
	                    <li hidden>재직상태</li>
	                </ul>
	                <c:forEach var="vo" items="${list}">
		                <ul>
		                    <li><input type="button" name="update" id="" value="수정"></li>
		                    <li><a href="javascript:;"></a>${vo.empCode}</li>
			                <li>${vo.empName}</li>
		                    <li>${vo.deptName}</li>
		                    <li>${vo.teamName}</li>
		                    <li>${vo.positionName}</li>
		                    <li>${vo.hireDate}</li>
		                    <li>${vo.tel}</li>
		                    <li>${vo.empTel}</li>
		                    <li hidden>${vo.empStatus}</li>
		                </ul>
	                </c:forEach>
	            </div>
            </form>
             <div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
               <c:if test="${page > 1}">
                    <a href="${pageContext.request.contextPath}/emp/list?page=${page - 1}&schType=${schType}&kwd=${kwd}">&laquo; 이전</a>
                </c:if>
                
                <c:forEach begin="1" end="${total_page}" var="pageNum">
                    <c:choose>
                        <c:when test="${pageNum == page}">
                           ${pageNum}
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/emp/list?page=${pageNum}&schType=${schType}&kwd=${kwd}">${pageNum}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:if test="${page < total_page}">
                    <a href="${pageContext.request.contextPath}/emp/list?page=${page + 1}&schType=${schType}&kwd=${kwd}">다음 &raquo;</a>
                </c:if>

            </div>
		</div>
	</main>
	
<script type="text/javascript">

function printEmp() {
	let url = '${pageContext.request.contextPath}/emp/print';
	window.open(url, 'emp', 'width=800, height=800, left=600, top=100');
};


function searchList(){
	const f = document.searchForm;
	if(! f.kwd.value.trim()) {
		return;
	}
	
	const formData = new FormData(f);
	let requestParam = new URLSearchParams(formData).toString();
	
	let url = '${pageContext.request.contextPath}/emp/list';
	location.href = url + '?' + requestParams;
}

</script>
</body>
</html>