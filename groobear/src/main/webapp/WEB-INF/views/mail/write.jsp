<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/mail/mailWrite.css" type="text/css">
	<script type="text/javascript">
		function sendOk() {
		    const f = document.mailForm;
			let str;
		    
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
	<script type="text/javascript">
	
	
	</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="write">
				<form name = "mailForm" method = "post" enctype = "multipart/form-data">
					<table class="writeForm">
						<tr>
							<th>받는 사람</th>
							<td class="addressArea">
								<input type="hidden" name="senderName" value="그룹웨어">
								<input type="hidden" name="senderEmail" value="anwkdrla0925@gmail.com">
								<input type="text" name="receiverEmail" class="btn btn-light btnReceiverDialog" style="width: 100%; border-radius: unset;">
								<!-- <input type="text" name = "receiverEmail" class="btn btn-light btnReceiverDialog"> -->
							</td>
						</tr>
						<tr>
							<th>참조</th>  
							<td><input type="text" name ="realbird"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name = "subject"></td>
						</tr>
						<tr>
							<th>파일 첨부</th>
							<td><input type="file" name="selectFile" multiple="multiple"></td>
						</tr>
						<tr class="contentArea" id = "contentBox">
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
	<div class="modal fade" id="myDialogModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="myDialogModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myDialogModalLabel">받는 사람</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-auto p-1">
							<select name="schType" id="searchType" class="form-select">
								<option value="userName">이름</option>
								<option value="userId">아이디</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" id="searchValue" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light btnReceiverFind"> <i class="bi bi-search"></i> </button>
						</div>				
					</div>
					<div class="row p-1">
						<div class="border p-1 dialog-receiver-list">
							<ul></ul>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btnAdd">추가</button>
					<button type="button" class="btn btn-secondary btnClose">닫기</button>
				</div>			
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){
			$('.btnReceiverDialog').click(function(){
				$('#searchType').val('userName');
				$('#searchValue').val('');
				$('.dialog-receiver-list ul').empty();
				
				$('#myDialogModal').modal('show');
			});
			
			// 대화상자 - 받는사람 검색 버튼
			$('.btnReceiverFind').click(function(){
				let schType = $('#searchType').val();
				let kwd = $('#searchValue').val();
				if(! kwd) {
					$('#searchValue').focus();
					return false;
				}
				
				let url = '${pageContext.request.contextPath}/note/listMember'; 
				let formData = 'schType=' + schType + '&kwd=' + encodeURIComponent(kwd);
				
				const fn = function(data){
					if(data.state === 'false') {
						return false;
					}
					
					$('.dialog-receiver-list ul').empty();
					searchListMember(data);
				};
				
				ajaxRequest(url, 'get', formData, 'json', fn);
			});
			
			function searchListMember(data) {
				let s;
				for(let i=0; i<data.listMember.length; i++) {
					let memberIdx = data.listMember[i].memberIdx;
					let userId = data.listMember[i].userId;
					let userName = data.listMember[i].userName;
					
					s = '<li><input type="checkbox" class="form-check-input" data-memberIdx="' + memberIdx + '" title="' + userId + '"> <span>' + userName + '</span></li>';
					$('.dialog-receiver-list ul').append(s);
				}
			}
			
			// 대화상자-받는 사람 추가 버튼
			$('.btnAdd').click(function(){
				let len1 = $('.dialog-receiver-list ul input[type=checkbox]:checked').length;
				let len2 = $('#forms-receiver-list input[name=receivers]').length;
				
				if(len1 === 0) {
					alert('추가할 사람을 먼저 선택하세요.');
					return false;			
				}
				
				if(len1 + len2 >= 5) {
					alert('받는사람은 최대 5명까지만 가능합니다.');
					return false;
				}
				
				$('.dialog-receiver-list ul input[type=checkbox]:checked').each(function(){
					let b = false;
					let memberIdx = $(this).attr('data-memberIdx');
					let userName = $(this).next('span').text();
					let s;
					
					$('#forms-receiver-list input[name=receivers]').each(function(){
						if($(this).val() === memberIdx) {
							b = true;
							return false;
						}
					});
					
					if(! b) {
						s = '<span class="receiver-user btn border px-1">' + userName + ' <i class="bi bi-trash" data-memberIdx="' + memberIdx + '"></i></span>';
						$('.forms-receiver-name').append(s);
						
						s = '<input type="hidden" name="receivers" value="' + memberIdx + '">';
						$('#forms-receiver-list').append(s);
					}
				});
				
				$('#myDialogModal').modal('hide');
			});
			
			$('.btnClose').click(function(){
				$('#myDialogModal').modal('hide');
			});
			
			$('.forms-receiver-name').on('click', '.bi-trash', function(){
				let memberIdx = $(this).attr('data-memberIdx');
				
				$(this).parent().remove();
				$('#forms-receiver-list input[name=receivers]').each(function(){
					let receiver = $(this).val();
					if(memberIdx === receiver) {
						$(this).remove();
						return false;
					}
				});
			});
		});
	</script>

</body>
</html>