package com.sp.app.model.docBox;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OvertimeRequest {

	private Long otReqIdx;
	private Long aprIdx;
	private String overtime;
	private String workDetail;
	
}
