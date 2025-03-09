<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GrooBear</title>

<!-- 크롬 파비콘 아이콘 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/dist/images/common/logo.ico">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/core.css" type="text/css"> --%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/groobear/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/groobear/common.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/menu.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/jquery/js/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/util-jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/menu.js"></script>

<script type="text/javascript">
	
	document.addEventListener("DOMContentLoaded", function () {
	    var menuContainer = document.querySelector(".iconHeader-right-inner ul"); // 특정 컨테이너 내의 ul 선택
	
	    // 저장된 active 상태를 적용하는 함수
	    function setActiveMenu() {
	        var savedActiveHref = localStorage.getItem("activeMenu");
	        if (savedActiveHref) {
	            document.querySelectorAll(".iconHeader-right-inner ul li").forEach(function (el) {
	                el.classList.remove("active"); // 기존 active 제거
	            });
	
	            var activeItem = document.querySelector(".iconHeader-right-inner ul li a[href='" + savedActiveHref + "']");
	            if (activeItem) {
	                activeItem.parentElement.classList.add("active"); // 부모 <li>에 active 추가
	            }
	        }
	    }
	
	    setActiveMenu(); // 페이지 로드 시 active 적용
	
	    // 이벤트 위임: <ul> 내부의 <a> 태그 클릭 시 실행
	    menuContainer.addEventListener("click", function (event) {
	        var target = event.target.closest("a"); // 클릭된 요소가 <a>인지 확인
	        if (!target) return;
	
	        // 모든 <li>에서 active 클래스 제거
	        document.querySelectorAll(".iconHeader-right-inner ul li").forEach(function (el) {
	            el.classList.remove("active");
	        });
	
	        // 클릭된 메뉴의 부모 <li>에 active 클래스 추가
	        target.parentElement.classList.add("active");
	
	        // active된 메뉴의 href 값을 localStorage에 저장
	        localStorage.setItem("activeMenu", target.getAttribute("href"));
	
	        // 🔹 기본 페이지 이동 허용 (AJAX 방식이 아니라면 필요)
	        // AJAX 방식이 아니라면, 아래 줄을 추가하여 페이지 이동을 허용
	        window.location.href = target.getAttribute("href");
	    });
	});

</script>