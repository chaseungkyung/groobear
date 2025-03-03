package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectStage extends ProjectTeam {
    private long stageIdx;

    private String stageName;
    private String createdAt;
    private String startDate;
    private String endDate;

    private String content;
    private int status;

    private int progressRate;

    /* 아래의 내용을 포함하고 있음.
    private long projIdx;
    private Long projTeamIdx;
    private String projTeamName;
    */
}
