<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

  <!-- 프로젝트 만들기 버튼 -->
  <div>
    <button
      id="createProjectBtn"
      class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition"
    >
      프로젝트 만들기
    </button>
  </div>

  <!-- 프로젝트 생성 폼 (숨김 처리) -->
  <div
    id="projectForm"
    class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden"
  >
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
      <h2 class="text-xl font-bold mb-4">프로젝트 생성</h2>
      <form id="projectFormElement">
        <!-- 프로젝트 이름 -->
        <div class="mb-4">
          <label for="projectName" class="block font-medium mb-2">프로젝트 이름</label>
          <input
            type="text"
            id="projectName"
            class="w-full px-3 py-2 border rounded"
            placeholder="프로젝트 이름을 입력하세요"
            required
          />
        </div>

        <!-- 시작일 -->
        <div class="mb-4">
          <label for="startDate" class="block font-medium mb-2">시작일</label>
          <input
            type="date"
            id="startDate"
            class="w-full px-3 py-2 border rounded"
            required
          />
        </div>

        <!-- 종료일 -->
        <div class="mb-4">
          <label for="endDate" class="block font-medium mb-2">종료일</label>
          <input
            type="date"
            id="endDate"
            class="w-full px-3 py-2 border rounded"
            required
          />
        </div>

        <!-- 프로젝트 참여자 -->
        <div class="mb-4">
          <label for="participants" class="block font-medium mb-2">프로젝트 참여자</label>
          <input
            type="text"
            id="participants"
            class="w-full px-3 py-2 border rounded"
            placeholder="참여자 이름을 입력하세요 (쉼표로 구분)"
            required
          />
        </div>

        <!-- 버튼 -->
        <div class="flex justify-end space-x-2">
          <button
            type="button"
            id="cancelBtn"
            class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition"
          >
            취소
          </button>
          <button
            type="submit"
            class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition"
          >
            생성
          </button>
        </div>
      </form>
    </div>
  </div>

  <script>
    const createProjectBtn = document.getElementById("createProjectBtn");
    const projectForm = document.getElementById("projectForm");
    const cancelBtn = document.getElementById("cancelBtn");

    // 오늘 날짜 이전은 선택할 수 없도록 설정
    const today = new Date().toISOString().split("T")[0];
    document.getElementById("startDate").setAttribute("min", today);
    document.getElementById("endDate").setAttribute("min", today);

    // 폼 열기
    createProjectBtn.addEventListener("click", () => {
      projectForm.classList.remove("hidden");
    });

    // 폼 닫기
    cancelBtn.addEventListener("click", () => {
      projectForm.classList.add("hidden");
    });

    // 폼 제출 이벤트
    document
      .getElementById("projectFormElement")
      .addEventListener("submit", (event) => {
        event.preventDefault(); // 기본 동작 방지

        // 입력 값 가져오기
        const projectName = document.getElementById("projectName").value;
        const startDate = document.getElementById("startDate").value;
        const endDate = document.getElementById("endDate").value;
        const participants = document.getElementById("participants").value;

        // 확인 메시지
        alert(`프로젝트 "${projectName}"가 생성되었습니다!`);
        console.log({
          프로젝트명: projectName,
          시작일: startDate,
          종료일: endDate,
          참여자: participants.split(",").map((p) => p.trim()),
        });

        // 폼 닫기
        projectForm.classList.add("hidden");

        // 폼 초기화
        event.target.reset();
      });
  </script>
</body>
</html>