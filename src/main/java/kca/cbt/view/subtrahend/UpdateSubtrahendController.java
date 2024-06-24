package kca.cbt.view.subtrahend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;
import kca.cbt.subtrahend.SubtrahendDAO;
import kca.cbt.subtrahend.SubtrahendVO;
import kca.cbt.test.TestDAO;
import kca.cbt.test.TestVO;

@Controller
public class UpdateSubtrahendController {
	
	@RequestMapping("/updateReview.do")
	public String updateReview(SubtrahendVO vo, SubtrahendDAO subtrahendDAO) {
		subtrahendDAO.updateReview(vo);
		return "getSubtrahendList.do";
	}
	
	@RequestMapping("/reExam.do")
	public String reExam(SubtrahendVO vo, SubtrahendDAO subtrahendDAO, ExamPlanVO evo, ExamPlanDAO examPlanDAO) {
		subtrahendDAO.updateReview(vo);
		evo.setE_status("재출제요청");
		examPlanDAO.updateStatus(evo);
		return "getSubtrahendList.do";
	}
	
	@RequestMapping("/testComplete.do")
	public String testComplete(SubtrahendVO vo, SubtrahendDAO subtrahendDAO, ExamPlanVO evo, ExamPlanDAO examPlanDAO) {
		subtrahendDAO.updateReview(vo);
		subtrahendDAO.testComplete(vo);
		evo.setE_status("제출(완료)");
		examPlanDAO.updateStatus(evo);
		return "getSubtrahendList.do";
	}

}
