package kca.cbt.view.examplan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;

@Controller
public class GetExamPlanListController {

	@RequestMapping("/getExamPlanList.do")
	public String getExamPlanList(ExamPlanVO vo, ExamPlanDAO examPlanDAO, Model model) {
		model.addAttribute("examPlanList", examPlanDAO.getExamPlanList(vo));
		return "examcommitmember/exam.jsp";
	}

	@RequestMapping("/updateStatus.do")
	public String updateStatus(ExamPlanVO vo, ExamPlanDAO examPlanDAO) {
		examPlanDAO.updateStatus(vo);
		return "getExamPlanList.do";
	}

}
