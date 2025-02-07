<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/emp/add.css" type="text/css">
	<style type="text/css">
		main {width: 93vw;}
		main .mainInner {width: 83vw;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner">
			<form action="">
				<div class="empInfo">
	                <div class="photoArea">
	                    <div class="photo">
	                        <img src="https://placehold.co/225x300" alt="샘플이미지">
	                    </div>
	                    <div class="buttonArea">
	                        <button type="button">사진 추가하기</button>
	                    </div>
	                </div>
	                <div class="info">
	                    <table>
	                        <tr>
	                            <th>사원번호</th>
	                            <td><input type="text"></td>
	                            <th>입사년월</th>
	                            <td><input type="date" name="" id=""></td>
	                        </tr>
	                        <tr>
	                            <th>성명</th>
	                            <td><input type="text"></td>
	                            <th>퇴사년월일</th>
	                            <td><input type="date"></td>
	                        </tr>
	                        <tr>
	                            <th>부서</th>
	                            <td>
	                                <select name="" id="">
	                                    <option value="">[인사부] 인사1팀</option>
	                                    <option value="">[인사부] 인사2팀</option>
	                                    <option value="">[법무부] 법무1팀</option>
	                                    <option value="">[법무부] 법무2팀</option>
	                                    <option value="">[경영관리부] 경영1팀</option>
	                                    <option value="">[경영관리부] 경영2팀</option>
	                                    <option value="">[재무회계부] 재무팀</option>
	                                    <option value="">[재무회계부] 회계팀</option>
	                                    <option value="">[영업마케팅부] 영업팀</option>
	                                    <option value="">[영업마케팅부] 마케팅팀</option>
	                                    <option value="">[SW개발부] 솔루션아키텍처팀</option>
	                                    <option value="">[SW개발부] 데이터베이스팀</option>
	                                    <option value="">[SW개발부] QA팀</option>
	                                    <option value="">[SW개발부] UX/UI디자인팀</option>
	                                    <option value="">[SW개발부] 기술지원팀</option>
	                                 </select>
	                            </td>
	                            <th>내/외국인</th>
	                            <td class="nationalityStatus">
	                                <select name="" id="">
	                                    <option value="">내국인</option>
	                                    <option value="">외국인</option>
	                                </select>
	                                <select name="" id="">
	                                    <option value="" selected disabled>대한민국</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>직급</th>
	                            <td>
	                                <select name="" id="">
	                                    <option value="">사원</option>
	                                    <option value="">대리</option>
	                                    <option value="">과장</option>
	                                    <option value="">차장 </option>
	                                    <option value="">부장 </option>
	                                </select>                        
	                            </td>
	                            <th>주민등록번호</th>
	                            <td><input type="text" name="" id=""></td>
	                        </tr>
	                        <tr class="tel">
	                            <th>내선번호</th>
	                            <td><input type="tel" value="02" disabled> - <input type="tel" value="3495" disabled> - <input type="tel" name="" id=""></td>
	                            <th>휴대폰번호</th>
	                            <td><input type="tel" name="" id=""> - <input type="tel" name="" id=""> - <input type="tel" name="" id=""></td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td class="eMail"><input type="text" name="" id=""> @ <input value="groobear.co.kr" disabled></td>
	                            <th>주소</th>
	                            <td class="address">
	                                <input type="text" name="" id="" disabled><input type="button" value="주소검색">
	                                <input type="text" name="" id="">
	                            </td>
	                        </tr>
	                    </table>
	                    <br><br><br>
	                        <div class="insertBtn">
								<button type="reset" style="color:black; border:1px solid #2f5ea2; border-radius: 5px; padding: 4px;">다시 작성</button>
								&nbsp;&nbsp;
								<button type="button" class="" onclick="location.href='${pageContext.request.contextPath}/bbs/list';" style="color:black; border:1px solid #2f5ea2; border-radius: 5px; padding: 4px;">${mode=="update" ? "수정취소" : "등록취소"}</button>
								<button type="button" class="" onclick="insertEmp();" style="background-color:#2f5ea2; color:white;" >${mode=="update" ? "수정완료" : "등록완료"}</button>
	                   	 	</div>
	                </div>
	            </div>
            </form>
            <div class="empHistory">
                <div class="title">
                    <p>사원 이력</p>
                </div>
                <table>
                    <tr>
                        <th>기간</th>
                        <th>부서</th>
                        <th>팀</th>
                        <th>직급</th>
                        <th>비고</th>
                    </tr>
                    <c:if test="">
	                    <c:forEach var="dto" items="${list}">
		                    <tr>
		                        <td>${dto.hireDate}</td>
		                        <td>${dto.deptIdx}</td>
		                        <td>${dto.tempIdx}</td>
		                        <td>${dto.empRank}</td>
		                        <td>${dto.empStatus}</td>
		                    </tr>
	                    </c:forEach>
					</c:if>
                </table>
            </div>
            <div class="back">
            	<a href="${pageContext.request.contextPath}/emp/list">뒤로가기</a>
            </div>
		</div>
	</main>
	
<script type="text/javascript">
function insertEmp() {
	
}

</script>
</body>
</html>