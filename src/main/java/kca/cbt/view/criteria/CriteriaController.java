package kca.cbt.view.criteria;

import java.util.List;
import kca.cbt.criteria.CriteriaService;
import kca.cbt.criteria.CriteriaVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/criteria")
public class CriteriaController {
    private CriteriaService criteriaService;

    public void setCriteriaService(CriteriaService criteriaService) {
        this.criteriaService = criteriaService;
    }

    @GetMapping("/list")
    public String getCriteriaList(@RequestParam(required = false) String name, Model model) {
        List<CriteriaVO> list;
        if (name == null || name.isEmpty()) {
            list = criteriaService.getAllCriteria();
        } else {
            list = criteriaService.searchCriteria(name);
        }
        model.addAttribute("criteriaList", list);
        return "/criteria.jsp"; // JSP 파일의 위치를 직접 지정
    }
}
