package kca.cbt.exam_subjects;

import java.util.List;
import java.util.Map;

public interface Exam_subjectService {
	
	// CRUE 기능의 메소드 구현
	List<Exam_subjectVO> getEList(Exam_subjectVO vo);
	
	public void updateE(Map<String, Exam_subjectVO> es);
}