package kca.cbt.criteria;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/criteria")
public class CriTeriaController {

    @Autowired
    private CriTeriaDAO criTeriaDAO;

    @GetMapping("/list")
    public String getCriteriaList(@RequestParam(required = false) String subject,
                                  @RequestParam(required = false) String category,
                                  Model model) {
        List<CriTeriaVO> list;
        if (category == null || "전체".equals(category)) {
            list = criTeriaDAO.getAllCriteria();
        } else {
            list = criTeriaDAO.searchCriteria(subject, category);
        }
        model.addAttribute("criteriaList", list);
        return "criteriaListView";
    }
}
