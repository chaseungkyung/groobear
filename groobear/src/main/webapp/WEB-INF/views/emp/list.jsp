<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/emp/list.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner">
			<div class="searchArea">
                <div class="search">
                    <input type="text" name="" id="">
                    <button><img alt="" src="${pageContext.request.contextPath}/dist/images/common/search.png"></button>
                </div>
                <div class="selectAdd">
                    <select name="" id="">
                        <option value="" selected>재직</option>
                        <option value="">퇴사</option>
                        <option value="">휴직</option>
                    </select>
                    <div class="addEmp">
                        <a href="${pageContext.request.contextPath}/emp/add"><img alt="" src="${pageContext.request.contextPath}/dist/images/emp/addEmp.png">사원추가</a>
                    </div>
                </div>
            </div>
            <form action="">
	            <div class="listArea">
	                <ul>
						<li><input type="checkbox" name="" id=""></li>
	                    <li>사원번호</li>
	                    <li>이름</li>
	                    <li>부서</li>
	                    <li>팀</li>
	                    <li>직급</li>
	                    <li>입사년월일</li>
	                    <li>전화번호</li>
	                    <li>이메일</li>
	                    <li>내선번호</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>인사부</li>
	                    <li>인사1팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>인사부</li>
	                    <li>인사2팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>법무부</li>
	                    <li>법무1팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>법무부</li>
	                    <li>법무2팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>경영관리부</li>
	                    <li>경영1팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>경영관리부</li>
	                    <li>경영2팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>재무회계부</li>
	                    <li>재무부</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>재무회계부</li>
	                    <li>회계부</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>영업마케팅부</li>
	                    <li>영업팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><a href="javascript:;">2024010001</a></li>
	                    <li>홍길동</li>
	                    <li>영업마케팅부</li>
	                    <li>마케팅팀</li>
	                    <li>대리</li>
	                    <li>2024-01-02</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	            </div>
            </form>
            <div class="page-navigation">
                1 2 3
            </div>
		</div>
	</main>
</body>
</html>