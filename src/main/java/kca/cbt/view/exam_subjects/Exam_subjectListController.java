package kca.cbt.view.exam_subjects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.exam_subjects.Exam_subjectDAO;
import kca.cbt.exam_subjects.Exam_subjectVO;

@Controller
public class Exam_subjectListController {
	
	@RequestMapping(value="EList.do")
	public String getEList(Exam_subjectVO vo, Exam_subjectDAO exam_subjectDAO, Model model) {
		model.addAttribute("EList", exam_subjectDAO.getEList(vo));
		return "admin/adminIndex.jsp";
		
	}
}
