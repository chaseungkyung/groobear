package com.sp.app.model.docBox;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class IncidentReport {

	private Long incRepIdx;
	private Long aprIdx;
	private String incDetail;
	private String incDate;
	
}
