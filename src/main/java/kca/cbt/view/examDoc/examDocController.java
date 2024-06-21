package kca.cbt.view.examDoc;

import java.util.List;
import java.util.Map;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.examDoc.examDocDAO;
import kca.cbt.examDoc.examDocVO;
//import kca.cbt.examDoc.examDocService;

@Controller
public class examDocController {
	
	@RequestMapping("/getExamDocList.do")
	public String getExamDocList(examDocVO vo, examDocDAO examdocDAO,  Model model) {
        List<examDocVO> examDocList = examdocDAO.getExamDocList(vo);
        Map<String, String> memberNames = examdocDAO.getExamDocMemberNames();

		model.addAttribute("ExamDocList", examdocDAO.getExamDocList(vo));
        model.addAttribute("memberNames", memberNames);
		
		return "./examcommitmember/examDoc.jsp";
	}

}

/*
@Controller
public class examDocController {
	@RequestMapping("/getExamDocList.do")
	public String getExamDocList(examDocVO vo, examDocDAO examdocDAO,  Model model) {
		model.addAttribute("ExamDocList", examdocDAO.getExamDocList(vo));
		return "./examcommitmember/examDoc.jsp";
	}
}*/

//@Autowired
		//private examDocService examDocService;
	
	/*
	@RequestMapping("/getExamDocList.do")
	public String getExamDocList(examDocVO vo, Model model) {
		model.addAttribute("ExamDocList", examDocService.getExamDocList(vo));
		return "./examcommitmember/examDoc.jsp";
	}
	*/
	
	/*
	@RequestMapping("/getExamDoc.do")
	public String getExamDoc(examDocVO vo, examDocDAO examdocDAO,  Model model) {
		model.addAttribute("examdoc", examdocDAO.getExamDoc(vo));
		return "examcommitmember/examDoc.jsp";
	}
	*/
