package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectStage {
    private long stageIdx;
    private long projIdx;

    private String stageName;
    private String createdAt;
    private String startDate;
    private String endDate;

    private long projTeamIdx;
    private String projTeamName;

    private String content;
    private int status;
}
