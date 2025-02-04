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
		table tr td .textarea {height: 60%; padding: 10px; box-sizing: border-box; line-height: 1.6;}
		
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
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="write">
				<form name = "mailForm" method = "post" enctype = "multipart/form-data">
					<table>
						<tr>
							<th>받는사람</th>
							<td class="addressArea">
								<input type="text" name = "receiverEmail">
								<button type="button">주소록</button>
							</td>
						</tr>
						<tr>
							<th>참조</th>
							<td><input type="text" name ="senderEmail"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name = "subject"></td>
						</tr>
						<tr>
							<th>파일 첨부</th>
							<td><input type="file" name="selectFile" multiple="multiple"></td>
						</tr>
						<tr class="textArea">
							<th>내용</th>
							<td><textarea name = "content"></textarea></td>
						</tr>
					</table>
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">메일 전송&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/';">전송 취소&nbsp;<i class="bi bi-x"></i></button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>

</body>
</html>