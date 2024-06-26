package kca.cbt.view.examDoc;

import java.util.ArrayList;
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
	public String getExamDocSub(examDocVO vo, examDocDAO examdocDAO,  Model model) {
		List<examDocVO> ExamDocSub = examdocDAO.getExamDocSub(vo);
		model.addAttribute("ExamDocSub", examdocDAO.getExamDocSub(vo));
		
		List<examDocVO> ExamDocSub_Group = examdocDAO.getExamDocSubGroup(vo);
		model.addAttribute("ExamDocSubGroup", examdocDAO.getExamDocSubGroup(vo));
		
		return "./examcommitmember/examDoc.jsp";
	}

}