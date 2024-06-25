package kca.cbt.criteria;

import java.util.List;

public class CriteriaServiceImpl implements CriteriaService {
    private CriteriaDAO criteriaDAO;
    
    public void setCriteriaDAO(CriteriaDAO criteriaDAO) {
        this.criteriaDAO = criteriaDAO;
    }

    @Override
    public List<CriteriaVO> getAllCriteria() {
        return criteriaDAO.getAllCriteria();
    }

    @Override
    public List<CriteriaVO> searchCriteria(String name) {
        return criteriaDAO.searchCriteria(name);
    }
}
