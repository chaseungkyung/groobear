package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectTask {
	private long projIdx;
	private Long stageIdx;
    private long taskIdx;

    private String taskName;
    private String stageName;

    private String createdAt;
    private String startDate;
    private String endDate;

    private String content;
    private int status;
}
