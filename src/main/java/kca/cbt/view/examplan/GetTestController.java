package kca.cbt.view.examplan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;
import kca.cbt.test.TestDAO;
import kca.cbt.test.TestVO;

@Controller
public class GetTestController {
	
	@RequestMapping("/createTest.do")
	public String insertBoard(TestVO vo, TestDAO testDAO, ExamPlanVO evo, ExamPlanDAO examPlanDAO) {
		examPlanDAO.updateStatus(evo);
		testDAO.createTest(vo);
		return "getTest.do";
	}

	@RequestMapping("/getTest.do")
	public ModelAndView getTest(TestVO vo, TestDAO testDAO, ModelAndView mav) {
		mav.addObject("test",testDAO.getTest(vo)); // Model 정보 저장
		mav.setViewName("examcommitmember/examCard.jsp"); // View 정보 저장
		return mav;
	}
}
