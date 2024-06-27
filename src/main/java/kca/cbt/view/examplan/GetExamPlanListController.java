package kca.cbt.view.examplan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;
import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class GetExamPlanListController {

	@RequestMapping("/getExamPlanList.do")
	public String getExamPlanList(ExamPlanVO vo, ExamPlanDAO examPlanDAO, Model model) {
		model.addAttribute("examPlanList", examPlanDAO.getExamPlanList(vo));
		model.addAttribute("comExamPlanList", examPlanDAO.getComExamPlanList(vo));
		return "examcommitmember/exam.jsp";
	}

	@RequestMapping("/updateStatus.do")
	public String updateStatus(ExamPlanVO vo, ExamPlanDAO examPlanDAO) {
		examPlanDAO.updateStatus(vo);
		return "getExamPlanList.do";
	}
	
	@RequestMapping("/getBinaryClass.do")
	public String getBinatyClass(ExamPlanVO vo, ExamPlanDAO examPlanDAO, MemberVO mvo, MemberDAO memberDAO, Model model) {
		model.addAttribute("binaryClassList", examPlanDAO.getBinaryClass(vo));
		model.addAttribute("memberAB", memberDAO.getMemberAB(mvo));
		return "examcommitmember/binaryClass.jsp";
	}
	
	@RequestMapping("/getPreBinaryClass.do")
	public String getPreBinatyClass(ExamPlanVO vo, ExamPlanDAO examPlanDAO, MemberVO mvo, MemberDAO memberDAO, Model model) {
		model.addAttribute("preBinaryClassList", examPlanDAO.getPreBinaryClass(vo));
		model.addAttribute("memberAB", memberDAO.getMemberAB(mvo));
		return "examcommitmember/preBinaryClass.jsp";
	}
	
	
	@RequestMapping("/getInsertForm.do")
	public String getInsertForm(ExamPlanVO vo, ExamPlanDAO examPlanDAO, MemberVO mvo, MemberDAO memberDAO, Model model) {
		model.addAttribute("getInsertExamList", examPlanDAO.getInsertExamList(vo));
		return "examcommitmember/getInsertForm.jsp";
	}

}