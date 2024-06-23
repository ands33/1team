package kca.cbt.view.criteria;

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

    private CriTeriaService criTeriaService;

    // Setter method for dependency injection
    @Autowired
    public void setCriTeriaService(CriTeriaService criTeriaService) {
        this.criTeriaService = criTeriaService;
    }

    @GetMapping("/list.do")
    public String getCriteriaList(@RequestParam(required = false) String subject,
                                  @RequestParam(required = false) String category,
                                  Model model) {
        List<CriTeriaVO> list;
        if (category == null || "전체".equals(category)) {
            list = criTeriaService.getAllCriteria();
        } else {
            list = criTeriaService.searchCriteria(subject, category);
        }
        model.addAttribute("criteriaList", list);
        return "/WEB-INF/criteriaListView"; // 반환하는 뷰 이름
    }
}
