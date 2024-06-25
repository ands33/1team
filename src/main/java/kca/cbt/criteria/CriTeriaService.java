package kca.cbt.criteria;

import java.util.List;

public interface CriteriaService {
    List<CriteriaVO> getAllCriteria();
    List<CriteriaVO> searchCriteria(String courseName);
}
