package kca.cbt.view.examDoc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.examDoc.examDocDAO;
import kca.cbt.examDoc.examDocVO;

@Controller
public class examDocController {
	
	/*
	@RequestMapping("/getExamDocList.do")
	public String getExamDocList(examDocVO vo, examDocDAO examdocDAO,  Model model) {
		model.addAttribute("ExamDocList", examdocDAO.getExamDocList(vo));
		return "examcommitmember/examDoc.jsp";
	}
	*/
	@RequestMapping("/getExamDoc.do")
	public String getExamDoc(examDocVO vo, examDocDAO examdocDAO,  Model model) {
		model.addAttribute("examdoc", examdocDAO.getExamDoc(vo));
		return "examcommitmember/examDoc.jsp";
	}
	
}
