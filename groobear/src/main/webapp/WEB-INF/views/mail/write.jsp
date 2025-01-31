<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/mailMenu.css" type="text/css">
	<style type="text/css">
		main {width: 83%;}
		main .mainInner {width: 78vw}
		
		.btnArea {margin-bottom: 20px; margin-left: auto; width: 10%;}
		.btnArea button {width: 100%;}
		
		table {width: 100%;}
		table tr {height: 2.3vw; display: flex; align-items: center;}
		table tr th {width: 10%; vertical-align: middle;}
		table tr td {width: 90%;}
		
		table tr:last-child th {vertical-align: top;}
		
		table tr input {width: 100%; padding-left: 1%; height: 25px;}
		
		table tr .addressArea {display: flex; justify-content: space-between;}
		table tr .addressArea input {width: 89%;}
		table tr .addressArea button {width: 10%;}
		
		table .textArea {align-items: flex-start;}
		table tr td textarea {height: 25vw; padding: 10px; box-sizing: border-box; line-height: 1.6;}
		
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="btnArea">
				<button type="submit">보내기</button>
			</div>
			<div class="write">
				<table>
					<tr>
						<th>받는사람</th>
						<td class="addressArea">
							<input type="text">
							<button type="button">주소록</button>
						</td>
					</tr>
					<tr>
						<th>참조</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td><input type="file" multiple="multiple"></td>
					</tr>
					<tr class="textArea">
						<th>내용</th>
						<td><textarea></textarea></td>
					</tr>
				</table>
			</div>
		</div>
	</main>

</body>
</html>