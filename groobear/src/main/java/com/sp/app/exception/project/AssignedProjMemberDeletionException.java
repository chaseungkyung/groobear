package com.sp.app.exception.project;

/**
 * When? 팀 편성이나 참여자 관리에서 프로젝트 참여자 제거할 때...
 * 팀이 지정된 참여자를 프로젝트에서 제거하려 할 때 발생시킬 사용자 정의 예외
 */
public class AssignedProjMemberDeletionException extends RuntimeException {
    public AssignedProjMemberDeletionException() {
        super("팀이 지정된 참여자는 프로젝트에서 제거할 수 없습니다.");
    }

    public AssignedProjMemberDeletionException(String message) {
        super(message);
    }
}
