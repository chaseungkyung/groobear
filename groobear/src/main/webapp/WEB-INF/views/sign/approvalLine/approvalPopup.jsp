<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="backGround"></div>

<!-- 결재 등록하기 버튼 눌렀을 때 나오는 팝업 -->
<div class="lineSelectPopUp">
	<div class="popUpInner">
		<div class="close">X</div>
		<div class="select">
			<select name="deptIdx" id="deptIdx">
				<option value="" readOnly>부서</option>
			</select>
			<select name="teamIdx" id="teamIdx">
				<option value="" readOnly>소속</option>
			</select>
			<select name="positionCode" id="positionCode">
				<option value="" readOnly>직급</option>
			</select>
			<button type="button" class="reset"><i class="bi bi-arrow-clockwise"></i></button>
		</div>
		<div class="listTable">
			<table>
				<thead>
				<tr>
					<th>부서</th>
					<th>팀</th>
					<th>이름</th>
					<th>직급</th>
					<th></th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>