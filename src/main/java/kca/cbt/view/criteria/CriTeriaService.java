package kca.cbt.view.criteria;

import java.util.List;

public interface CriTeriaService {
    List<CriTeriaVO> getAllCriteria();
    List<CriTeriaVO> searchCriteria(String subject, String category);
}
