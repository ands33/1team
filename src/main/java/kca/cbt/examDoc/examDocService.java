package kca.cbt.examDoc;

import java.util.List;

public interface examDocService {
	
	List<examDocVO> getExamDocSub(examDocVO vo);
	
	List<examDocVO> getExamDocSubGroup(examDocVO vo);
	
}