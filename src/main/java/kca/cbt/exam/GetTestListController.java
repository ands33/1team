package kca.cbt.exam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GetTestListController {

	@RequestMapping("/getTestList.do")
	public String getTestList(TestVO vo, TestDAO testDAO, Model model) {
		model.addAttribute("testList", testDAO.getTestList(vo));
		return "examcommitmember/exam/exam.jsp";
	}

}
