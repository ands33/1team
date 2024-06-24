package kca.cbt.view.exam_subjects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.exam_subjects.Exam_subjectDAO;

@Controller
public class Exam_subjectListController {
	
    @RequestMapping(value="EList.do")
    public String getEList(@RequestParam("memberId") String memberId, Exam_subjectDAO exam_subjectDAO, Model model) {
        model.addAttribute("EList", exam_subjectDAO.getEList(memberId));
        return "admin/adminIndex.jsp";
    }
}
