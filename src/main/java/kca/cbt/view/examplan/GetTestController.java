package kca.cbt.view.examplan;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;
import kca.cbt.test.TestDAO;
import kca.cbt.test.TestVO;

@Controller
public class GetTestController {
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
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
	
	@RequestMapping("/updateTest.do")
	public String updateTest(TestVO vo, TestDAO testDAO) {
		testDAO.updateTest(vo);
		return "getExamPlanList.do";
	}
	
	@RequestMapping("/sendTest.do")
	public String sendTest(TestVO vo, TestDAO testDAO, ExamPlanVO evo, ExamPlanDAO examPlanDAO) {
		testDAO.updateTest(vo);
		testDAO.sendTest(vo);
		evo.setE_status("제출(검토대기)");
		examPlanDAO.updateStatus(evo);
		return "getExamPlanList.do";
	}
}