<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/projectMenu.css" type="text/css">
	<style type="text/css">
		main {width: 83%;}
		main .mainInner {width: 78vw}
		
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
	<script type="text/javascript">
		function sendOk() {
		    const f = document.mailForm;
			let str;
		    
			if(!f.senderEmail.value.trim()) {
		        alert('E-Mail을 입력하세요. ');
		        f.senderEmail.focus();  
		        return;
			}
		    
			if(!f.receiverEmail.value.trim()) {
		        alert("정상적인 E-Mail을 입력하세요. ");
		        f.receiverEmail.focus();
		        return;
			}
		    
			str = f.subject.value.trim();
		    if(!str) {
		        alert('제목을 입력하세요. ');
		        f.subject.focus();
		        return;
		    }
		
			str = f.content.value.trim();
		    if(!str) {
		        alert('내용을 입력하세요. ');
		        f.content.focus();
		        return;
		    }
		
			f.action = '${pageContext.request.contextPath}/mail/write';
			f.submit();
		}
	</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="write">
				<form name = "projectForm" method = "post" enctype = "multipart/form-data">
					<table class="textArea">
						<tr>
							<th>프로젝트 이름</th>
							<td><input type="text" name ="000" readonly></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="text" name ="000" readonly></td>
						</tr>
						<tr>
							<th>종료일</th>
							<td><input type="text" name ="senderEmail"></td>
						</tr>
						<tr>
					</table>
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">프로젝트 만들기&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/list';">취소&nbsp;<i class="bi bi-x"></i></button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>

</body>
</html>