package kca.cbt.exam_subjects;

import java.util.List;

public interface Exam_subjectService {
    // CRUE 기능의 메소드 구현
    List<Exam_subjectVO> getEList(String memberId);
}
