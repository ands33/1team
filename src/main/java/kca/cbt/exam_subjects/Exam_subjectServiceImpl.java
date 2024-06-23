package kca.cbt.exam_subjects;

import java.util.List;

public class Exam_subjectServiceImpl implements Exam_subjectService {
    private Exam_subjectDAO exam_subjectDAO;
    
    public void setExam_subjectDAO(Exam_subjectDAO exam_subjectDAO) {
        this.exam_subjectDAO = exam_subjectDAO;
    }
    
    public List<Exam_subjectVO> getEList(String memberId) {
        return exam_subjectDAO.getEList(memberId);
    }
}
