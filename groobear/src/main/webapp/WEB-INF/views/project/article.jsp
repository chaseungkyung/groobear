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
	
	<!-- member 등록 및 수정 대화상자 -->
	<div class="modal fade" id="myDialogModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myDialogModalLabel">????</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-2">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 카테고리 대화상자 -->
	<div class="modal fade" id="faqCategoryDialogModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="faqCategoryDialogModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="faqCategoryDialogModalLabel">1</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pt-1">
				
					<form name="memberForm" method="post">
						<table class="table table-bordered" >
							<thead class="table-light">
								<tr align="center">
									<th width="170">mem1</th>
									<th width="120">mem2</th>
									<th width="80">mem3</th>
									<th>변경</th>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
									<td> <input type="text" name="member" class="form-control"> </td>
									<td>
										<select name="enabled" class="form-select">
											<option value="1">활성</option>
											<option value="0">비활성</option>
										</select>
									</td>						
									<td> <button type="button" class="btn btn-light btnMemberAddOk">등록</button> </td>
								</tr>
							</tbody>
							<tfoot class="member-list"></tfoot>
						</table>
					</form>
				
				</div>
			</div>
		</div>
	</div>

</body>
</html>