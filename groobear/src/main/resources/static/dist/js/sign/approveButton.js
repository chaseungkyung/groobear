$('.approvalAction').on('click', function(){
		
	let aprIdx = $("#aprIdx").val();
	let paymentStage = $("#paymentStage").val();
	let status = $("#status").val();
	let result = $(this).val();
	let aprPerson = $(this).data('aprresult');
	let aprEmp = $(this).data('apremp');
	let aprAt = $(this).data('at');
	
	console.log(result);
	
	let url = '${pageContext.request.contextPath}/sign/updateResult';
	
	const fn = function(data) {
		
		$('.approvalAction').hide();
		
		$('.' + aprPerson).append('${sessionScope.member.empName}');
	};
	
	ajaxRequest(
			url
			, 'post'
			, {
				aprIdx : aprIdx
				, paymentStage : paymentStage
				, status : status
				, aprPerson : aprPerson
				, result : result
				, aprEmp : aprEmp
				, aprAt : aprAt
			}
			, 'json'
			, fn
		);
	
});