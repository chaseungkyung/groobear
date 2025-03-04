package com.sp.app.project.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectTeam {
    private long projIdx;

    // 프로젝트 팀 정보
    private Long projTeamIdx;
    private String projTeamName;
}
