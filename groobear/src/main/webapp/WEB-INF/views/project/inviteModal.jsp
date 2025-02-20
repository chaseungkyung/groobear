<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

    <!-- 모달 -->
    <div id="inviteModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>참여자 초대</h2>
                <span class="close">&times;</span>
            </div>

            <!-- 컨텐츠 영역 -->
            <div class="modal-body">
                <!-- 왼쪽 영역 (검색 + 리스트) -->
                <div class="left-section">
                    <!-- 검색 영역 -->
                    <div class="search-box">
                        <input type="text" id="searchInput" placeholder="이름, 소속, 전화번호 검색">
                        <button id="searchBtn"><i class="bi bi-search"></i></button>
                    </div>

                    <!-- 사용자 리스트 -->
                    <div class="user-list">
                        <ul id="userList">
                            <li class="user-item">
                                <input type="checkbox" class="select-user">
                                <span class="user-avatar">설</span>
                                <div class="user-info">
                                    <p class="user-name">설탕</p>
                                    <p class="user-role">test</p>
                                </div>
                            </li>
                            <li class="user-item">
                                <input type="checkbox" class="select-user">
                                <span class="user-avatar">홍</span>
                                <div class="user-info">
                                    <p class="user-name">홍길동</p>
                                    <p class="user-role">developer</p>
                                </div>
                            </li>
                            <li class="user-item">
                                <input type="checkbox" class="select-user">
                                <span class="user-avatar">이</span>
                                <div class="user-info">
                                    <p class="user-name">이순신</p>
                                    <p class="user-role">manager</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- 오른쪽 영역 (대상 선택 정보) -->
                <div class="right-section">
                    <p class="default-text">대상을 선택해주세요.</p>
                    <div class="selected-users" style="display: none;">
                        <div class="header">
                            <span class="count">0건 선택</span>
                            <button class="remove-all">전체 삭제</button>
                        </div>
                        <div id="selectedUserList"></div>
                    </div>
                </div>
            </div>

            <!-- 버튼 영역 -->
            <div class="modal-footer">
                <button id="cancelBtn" class="modal-cancel-button">취소</button>
                <button id="inviteBtn" class="modal-invite-button">초대하기</button>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            // 모달 열기
            $("#openModalBtn").click(function(){
                $("#inviteModal").show();
            });

            // 모달 닫기
            $(".close, #cancelBtn").click(function(){
                $("#inviteModal").hide();
            });

            // 검색 기능
            $("#searchBtn").click(function(){
                var searchValue = $("#searchInput").val().toLowerCase();
                $(".user-item").each(function(){
                    var userText = $(this).text().toLowerCase();
                    $(this).toggle(userText.includes(searchValue));
                });
            });

         // 체크박스 선택 시 업데이트 실행
            $(".select-user").change(function(){
                updateSelectedUsers();
            });

            // 전체 삭제 버튼 클릭 시
            $(".remove-all").click(function(){
                $(".select-user").prop("checked", false); // 모든 체크 해제
                updateSelectedUsers();
            });

         // 선택된 사용자 목록 업데이트 함수
            function updateSelectedUsers() {
                var selectedUsersHtml = "";
                var selectedCount = 0;

                $(".select-user:checked").each(function(){
                    var name = $(this).siblings(".user-info").find(".user-name").text();
                    var avatar = $(this).siblings(".user-avatar").text();

                    selectedUsersHtml += '<div class="selected-user">';
                    selectedUsersHtml += '    <div class="avatar-container">';
                    selectedUsersHtml += '        <span class="user-avatar">' + avatar + '</span>';
                    selectedUsersHtml += '    </div>';
                    selectedUsersHtml += '    <div class="user-info-container">';
                    selectedUsersHtml += '        <span class="selected-user-name">' + name + '</span>';
                    selectedUsersHtml += '        <button class="remove-user">✖</button>';
                    selectedUsersHtml += '    </div>';
                    selectedUsersHtml += '</div>';

                    selectedCount++;
                });

                // 선택된 사용자 목록 업데이트
                if (selectedCount > 0) {
                    $(".default-text").hide();
                    $(".selected-users").show();
                    $("#selectedUserList").html(selectedUsersHtml);
                    $(".count").text(selectedCount + "건 선택");
                } else {
                    $(".default-text").show();
                    $(".selected-users").hide();
                }
            }

            // 개별 삭제 버튼 클릭 시
            $(document).on("click", ".remove-user", function(){
                var name = $(this).siblings(".selected-user-name").text().trim();
                
                // 체크박스에서 해당 사용자 체크 해제
                $(".user-item").each(function(){
                    if ($(this).find(".user-name").text() === name) {
                        $(this).find(".select-user").prop("checked", false);
                    }
                });

                updateSelectedUsers();
            });
        });
    </script>



