package kca.cbt.examDoc;

import java.util.List;

public interface examDocServie {

	void getExamDoc(examDocVO vo);
	
	List<examDocVO> getExamDocList(examDocVO vo);
	
}
