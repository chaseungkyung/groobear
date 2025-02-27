$(function () {
    // 모달 창 열기
    $('#teamModalBtn').click(function () {
        $('#teamModal').show();
    });

    // 모달 창 닫기
    $('#team-cancelBtn').click(function () {
        $('#teamModal').hide();
    });

    $('.team-close').click(function () {
        $('#teamModal').hide();
    });

    // 팀 추가 버튼 클릭 이벤트
    $('#addTeamBtn').click(function () {
        let teamAdd = '';

        teamAdd += '<div class="team-add-area">';
        teamAdd += '  <div class="team-header">';
        teamAdd += '    <input type="text" class="team-input" placeholder="팀 이름 입력">';
        teamAdd += '    <button class="delete-team-btn">X</button>';  // 삭제 버튼 추가
        teamAdd += '  </div>';
        teamAdd += '  <div class="team-box">';
        teamAdd += '    <div class="team-member">';
        teamAdd += '      <div class="member-img">';
        teamAdd += '        <img class="remove-member" src="${pageContext.request.contextPath}/dist/images/project/remove.png">';
        teamAdd += '      </div>';
        teamAdd += '      <span class="member-name">박민기</span>';
        teamAdd += '    </div>';
        teamAdd += '    <div class="team-member">';
        teamAdd += '      <div class="member-img">';
        teamAdd += '        <img class="remove-member" src="${pageContext.request.contextPath}/dist/images/project/remove.png">';
        teamAdd += '      </div>';
        teamAdd += '      <span class="member-name">김대희</span>';
        teamAdd += '    </div>';
        teamAdd += '    <div class="team-member">';
        teamAdd += '      <div class="member-img">';
        teamAdd += '        <img class="remove-member" src="${pageContext.request.contextPath}/dist/images/project/remove.png">';
        teamAdd += '      </div>';
        teamAdd += '      <span class="member-name">장민준</span>';
        teamAdd += '    </div>';
        teamAdd += '    <div class="team-member">';
        teamAdd += '      <div class="member-img">';
        teamAdd += '        <img class="remove-member" src="${pageContext.request.contextPath}/dist/images/project/remove.png">';
        teamAdd += '      </div>';
        teamAdd += '      <span class="member-name">송이현</span>';
        teamAdd += '    </div>';
        teamAdd += '    <div class="team-member">';
        teamAdd += '      <div class="member-img">';
        teamAdd += '        <img class="remove-member" src="${pageContext.request.contextPath}/dist/images/project/remove.png">';
        teamAdd += '      </div>';
        teamAdd += '      <span class="member-name">이민지</span>';
        teamAdd += '    </div>';
        teamAdd += '  </div>';
        teamAdd += '</div>';

        $('#teamContainer').append(teamAdd);
    });


    // 동적으로 생성된 삭제 버튼 이벤트 핸들러
    $(document).on("click", ".delete-team-btn", function () {
        $(this).closest(".team-add-area").remove();  // 해당 팀 삭제
    });

    $(document).on("click", ".remove-member", function () {
        $(this).closest(".team-member").remove();  // 해당 멤버 삭제
    });

});