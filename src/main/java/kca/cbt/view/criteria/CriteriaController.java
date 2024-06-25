package kca.cbt.view.criteria;

import java.util.List;
import kca.cbt.criteria.CriteriaService;
import kca.cbt.criteria.CriteriaVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/criteria")
public class CriteriaController {
    private CriteriaService criteriaService;

    public void setCriteriaService(CriteriaService criteriaService) {
        this.criteriaService = criteriaService;
    }

    @GetMapping("/getData.do")
    @ResponseBody
    public List<CriteriaVO> getCriteriaList(@RequestParam(required = false) String courseName) {
        if (courseName == null || courseName.isEmpty()) {
            return criteriaService.getAllCriteria();
        } else {
            return criteriaService.searchCriteria(courseName);
        }
    }
}
