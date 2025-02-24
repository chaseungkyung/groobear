package com.sp.app.exception.project;

/**
 * When? 팀 편성하기 에서...
 * 팀이 지정되지 않은 프로젝트 참여자가 있을 때 발생시킬 사용자 정의 예외
 * 몇 명이 지정되지 않았는지, 혹은 누구누구가 지정되지 않았는지 등의 정보를 담으려면 필드 추가 필요.
 */
public class UnassignedProjMemberException extends RuntimeException {
    public UnassignedProjMemberException() {
        super("팀이 지정되지 않은 프로젝트 참여자가 있습니다.");
    }

    public UnassignedProjMemberException(String message) {
        super(message);
    }
}
