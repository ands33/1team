package kca.cbt.view.criteria;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CriTeriaServiceImpl implements CriTeriaService {

    private CriTeriaDAO criTeriaDAO;

    @Autowired
    public void setCriTeriaDAO(CriTeriaDAO criTeriaDAO) {
        this.criTeriaDAO = criTeriaDAO;
    }

    @Override
    public List<CriTeriaVO> getAllCriteria() {
        return criTeriaDAO.getAllCriteria();
    }

    @Override
    public List<CriTeriaVO> searchCriteria(String subject, String category) {
        return criTeriaDAO.searchCriteria(subject, category);
    }
}
