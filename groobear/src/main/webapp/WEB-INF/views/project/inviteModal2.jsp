<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- 참여자 모달 -->
<div id="inviteModal" class="modal" style="display: none;">
    <div class="invite-content">
        <span class="close">&times;</span>
        <h2>참여자 초대</h2>
        <label class="input-label">참여자</label>
        <input type="text" class="input-field" placeholder="참여자 입력">
        <label class="input-label">팀</label>
        <input type="text" class="input-field" placeholder="팀 입력">
        <label class="input-label">역할</label>
        <input type="text" class="input-field" placeholder="역할 입력">
        <div class="button-group">
            <button type="button" class="cancel-btn">취소</button>
            <button type="button" class="submit-btn">초대</button>
        </div>
    </div>
</div>


<script type="text/javascript">
/* 초대하기 클릭 */

$(function() {
    var modal = $("#inviteModal");
    var btn = $(".invite-button");
    var closeBtn = $("#inviteModal .close");
    var cancelBtn = $("#inviteModal .cancel-btn");
	
    modal.hide();
    
    btn.click(function() {
    	modal.fadeIn(300);
    });

    closeBtn.click(function() {
        modal.fadeOut(300);
    });

    cancelBtn.click(function() {
        modal.fadeOut(300);
    });
});
</script>





