package com.sp.app.model.core;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
/*
 * 부서, 팀, 직급에 대한 기본적인 Core 정보를 담고 있는 DTO 클래스 입니다.
 * @Builder는 상속을 지원하지 않으므로, @SuperBuilder를 사용하여 부모 클래스의 필드를 포함한 builder 패턴을 지원합니다.
 */
public class OrgUnit {
    private String deptIdx;
    private String deptName;
    private String teamIdx;
    private String teamName;
    private long positionCode;
    private String positionName;
}
