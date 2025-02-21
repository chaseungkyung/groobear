<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/project/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/task.css" type="text/css">

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp" />

<main>
	<div class="mainInner">
    <div class="container">
        <div class="search-bar">
            <input type="text" placeholder="업무명 또는 업무번호를 검색하세요">
            <button>✨ AI 검색</button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>업무명</th>
                    <th style="width: 80px;">상태</th>
                    <th>담당자</th>
                    <th>시작일</th>
                    <th>마감일</th>
                    <th>등록일</th>
                    <th>업무번호</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" value="5555"></td>
                    <td><span class="status hold">보류</span></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>2025-02-21</td>
                    <td>15</td>
                </tr>
                <tr>
                    <td>4444</td>
                    <td><span class="status request">요청</span></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>2025-02-21</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>3333</td>
                    <td><span class="status feedback">피드백</span></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>2025-02-21</td>
                    <td>13</td>
                </tr>
                <tr>
                    <td>2222</td>
                    <td><span class="status progress">진행</span></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>2025-02-21</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>1111</td>
                    <td><span class="status complete">완료</span></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>2025-02-21</td>
                    <td>11</td>
                </tr>
            </tbody>
        </table>
        <div class="buttons">
            <button class="settings">설정</button>
            <button class="add-task">업무 추가</button>
        </div>
    </div>	
	</div>

</main>

</body>
</html>