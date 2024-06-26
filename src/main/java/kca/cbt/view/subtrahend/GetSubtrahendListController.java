package kca.cbt.view.subtrahend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;
import kca.cbt.test.TestDAO;
import kca.cbt.test.TestVO;

@Controller
public class GetSubtrahendListController {

	@RequestMapping("/getSubtrahendList.do")
	public String getSubtrahendList(ExamPlanVO vo, ExamPlanDAO examPlanDAO, Model model) {
		model.addAttribute("subtrahendList", examPlanDAO.getSubtrahendList(vo));
		return "examcommitmember/subtrahend.jsp";
	}
	
	@RequestMapping("/subtrahend.do")
	public ModelAndView getTest(TestVO vo, TestDAO testDAO, ModelAndView mav) {
		mav.addObject("test",testDAO.getTest(vo)); // Model 정보 저장
		mav.setViewName("examcommitmember/subtrahendExamCard.jsp"); // View 정보 저장
		return mav;
	}
	
	@RequestMapping("/getReadExamCard.do")
	public ModelAndView getReadExamCard(TestVO vo, TestDAO testDAO, ModelAndView mav) {
		mav.addObject("test",testDAO.getTest(vo)); // Model 정보 저장
		mav.setViewName("examcommitmember/readExamCard.jsp"); // View 정보 저장
		return mav;
	}

}