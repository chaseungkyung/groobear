<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<style type="text/css">
		.btnArea {margin-bottom: 20px; margin-left: auto; width: 10%;}
		.btnArea button {width: 100%;}
		
		.textArea {width: 100%;}
		.textArea tr {height: 2.3vw; display: flex; align-items: center;}
		.textArea tr th {width: 10%; vertical-align: middle;}
		.textArea tr td {width: 90%;}
		
		.textArea tr:last-child th {vertical-align: top;}
		
		.textArea tr input {width: 100%; padding-left: 1%; height: 25px;}
		
		.textArea tr .addressArea {display: flex; justify-content: space-between;}
		.textArea tr .addressArea input {width: 89%;}
		.textArea tr .addressArea button {width: 10%;}
		
		.textArea .contentArea {align-items: flex-start;}
		.textArea tr td .contentArea {height: 60%; padding: 10px; box-sizing: border-box; line-height: 1.6;}
		
	</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp"/>
	
	<main>
	

	</main>

</body>
</html>