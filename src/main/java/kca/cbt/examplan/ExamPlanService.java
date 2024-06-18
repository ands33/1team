package kca.cbt.examplan;

import java.util.List;

public interface ExamPlanService {

	List<ExamPlanVO> getExamPlanList(ExamPlanVO vo);
	
	void updateStatus(ExamPlanVO vo);
	
}
