<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<style>
.collapsed:hover {
  background: #AACCEB;
  color: white;
}
.collapsed.active {
  background: #2860A6;
  color: white;
}
.collapsed:visited {
  background: #2860A6;
  color: white;
}
.collapsed {
  border: 0;
}
</style>
<script type="text/javascript">
function change_btn(e) {
	  var btns = document.querySelectorAll(".collapsed");
	  btns.forEach(function (btn, i) {
	    if (e.currentTarget == btn) {
	      btn.classList.add("active");
	    } else {
	      btn.classList.remove("active");
	    }
	  });
	}
</script>
<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<a href="${pageContext.request.contextPath}/schedule/write"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">일정 추가</a>
		</div>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<a href="${pageContext.request.contextPath}/schedule/${mode}"></a>
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne" onclick="change_btn(event)" onclick="${pageContext.request.contextPath}/schedule/companyScedule">
						회사 일정
					</button>
				</h2>
				
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header">
					<a href="${pageContext.request.contextPath}/schedule/${mode}">팀일정</a>
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo" onclick="change_btn(event)" onclick="${pageContext.request.contextPath}/schedule/deptScedule">
						팀 일정
					</button>
				</h2>
				
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header">
					<a href="${pageContext.request.contextPath}/schedule/${mode}">개인일정</a>
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree" onclick="change_btn(event)" onclick="${pageContext.request.contextPath}/schedule/myScedule" >
						개인 일정
					</button>
				</h2>
				
			</div>
		</div>
	</div>
</div>

