package com.sp.app.model.core;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
/*
 * OrgUnit을 상속받아 사원에 대한 기본적인 Core 정보를 담고 있는 DTO 클래스 입니다.
 * SessionInfo와 정확히 같은 필드를 갖고 있습니다.
 * @Builder는 상속을 지원하지 않으므로, @SuperBuilder를 사용하여 부모 클래스의 필드를 포함한 builder 패턴을 지원합니다.
 */
public class Member extends OrgUnit {
    private long empIdx;
    private String empCode;
    private String empName;
    
    private String orgUnitName; // teamName|| ' ' ||positionName

    /* 아래의 내용을 포함하고 있음.
    private long deptIdx;
    private String deptName;
    private long teamIdx;
    private String teamName;
    private long positionCode;
    private String positionName;
     */
}
