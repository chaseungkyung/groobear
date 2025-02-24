package com.sp.app.exception.project;

/**
 * When? 프로젝트 단계 삭제할 때...
 * 업무가 존재하는 단계를 삭제하려 할 때 발생시킬 사용자 정의 예외
 * ORA-02292: integrity constraint violated. child record found
 * ORA-00292: 무결성 제약 조건이 위반되었습니다. 자식 레코드가 발견되었습니다.
 * ORA-02292 중에서도 Task가 존재하는 Stage를 삭제하려 할 때 발생
 */
public class StageWithTaskDeletionException extends RuntimeException {
    public StageWithTaskDeletionException() {
        super("업무가 존재하는 단계는 삭제할 수 없습니다.");
    }

    public StageWithTaskDeletionException(String message) {
        super(message);
    }

}
