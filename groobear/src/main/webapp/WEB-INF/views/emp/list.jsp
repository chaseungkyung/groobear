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
	                    <input type="text" name="kwd" id="${kwd}">
	                    <button onclick="searchList()"><img src="${pageContext.request.contextPath}/dist/images/common/search.png"></button>
	                </div>
	            </form>
                <div class="selectAdd">
                    <select id="empStatusSelect">
                        <option value="0">재직</option>
                        <option value="1">휴직</option>
                        <option value="2">퇴사</option>
                    </select>
                    <div class="addEmp">
                        <a href="${pageContext.request.contextPath}/emp/add"><img alt="" src="${pageContext.request.contextPath}/dist/images/emp/addEmp.png">사원추가</a>
                    </div>
                    <div class="print">
                        <button type="button" class="btn" onclick="printEmp();">🖨️ 인쇄</button>
                    </div>
                </div>
            </div>
            <form action="">
	            <div class="listArea">
	                <ul>
	                    <li>사원번호</li>
	                    <li>이름</li>
	                    <li>부서</li>
	                    <li>팀</li>
	                    <li>직급</li>
	                    <li>입사년월일</li>
	                    <li>전화번호</li>
	                    <li>내선번호</li>
	                    <li>재직상태</li>
	                    <li></li>
	                </ul>
	                <c:forEach var="vo" items="${list}" varStatus="status">
		                <ul>
		                    <li><a href="javascript:;"></a>${vo.empCode}</li>
			                <li>${vo.empName}</li>
		                    <li>${vo.deptName}</li>
		                    <li>${vo.teamName == null ? '-' : vo.teamName}</li>
		                    <li>${vo.positionName == null ? '-' : vo.positionName}</li>
		                    <li>${vo.hireDate}</li>
		                    <li>${vo.tel}</li>
		                    <li>${vo.empTel}</li>
		                    <li>${vo.empStatus}</li>
		                    <li><button type="button" name="update" class="updatebtn" onclick="location.href='${pageContext.request.contextPath}/emp/update?empIdx=${vo.empIdx}';">수정</button>
		                </ul>
	                </c:forEach>
	            </div>
            </form>
            
             <div class="page-navigation">
				${dataCount == 0 ? "등록된 사원이 없습니다." : paging}
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

function searchList(){
	const f = document.searchForm;
	if(! f.kwd.value.trim()) {
		return;
	}
	
	const formData = new FormData(f);
	let requestParam = new URLSearchParams(formData).toString();
	
	let url = '${pageContext.request.contextPath}/emp/list';
	location.href = url + '?' + requestParams;
};

document.getElementById("empStatusSelect").addEventListener("change", function() {
    var selectedStatus = this.value;
    var url = new URL(window.location.href);
    url.searchParams.set("empStatus", selectedStatus);
    window.location.href = url.toString();
});

function printEmp() {
	let url = '${pageContext.request.contextPath}/emp/print';
	window.open(url, 'emp', 'width=800, height=800, left=600, top=100');
};


</script>
</body>
</html>