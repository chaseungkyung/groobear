<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/postList.css" type="text/css">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp"/>

<main>
	
	<div class="mainInner">
		<div id="app" class="container">
        <div class="search-bar">
            <input type="text" placeholder="파일명을 입력해주세요.">
        </div>
        <table>
            <thead>
                <tr>
                    <th>파일명</th>                  
                    <th>등록자</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="file-row">
                        <img alt="" src="">
                        파일 이름
                    </td>                
                    <td>이자바</td>
                    <td>2025-02-10</td>
                </tr>
            </tbody>
        </table>
    </div>
	
	
	</div>

</main>

</body>
</html>