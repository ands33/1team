package kca.cbt.exam_subjects;

import java.util.List;
import java.util.Map;



public class Exam_subjectServiceImpl implements Exam_subjectService{
	private Exam_subjectDAO exam_subjectDAO;
	
	public void setExam_subjectDAO(Exam_subjectDAO exam_subjectDAO) {
		this.exam_subjectDAO = exam_subjectDAO;
	}
	
	public List<Exam_subjectVO> getEList(Exam_subjectVO vo){
		return exam_subjectDAO.getEList(vo);
	}
	
	public void updateE(Map<String, Exam_subjectVO> es) {
		exam_subjectDAO.updateE(es);
	}
}
