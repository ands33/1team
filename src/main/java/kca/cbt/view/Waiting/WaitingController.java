package kca.cbt.view.Waiting;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.examplan.ExamPlanDAO;
import kca.cbt.examplan.ExamPlanVO;
import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;
import kca.cbt.waitingQ.WaitingDAO;
import kca.cbt.waitingQ.WaitingVO;

@Controller
public class WaitingController {

	@RequestMapping("/getBinaryWaiting.do") /* O */
    public String getBinaryClass(@RequestParam("member_id") String memberId, ExamPlanVO vo, ExamPlanDAO examPlanDAO, MemberVO mvo, MemberDAO memberDAO, Model model) {
        mvo.setMember_id(memberId);
        model.addAttribute("binaryClassList", examPlanDAO.getBinaryClass(vo));
        model.addAttribute("memberAB", memberDAO.getMemberAB(mvo));
        return "admin/binaryClass.jsp";
    }
    
	@RequestMapping("/getWaitingExamPlanList.do")
	public String getExamPlanList(@RequestParam("member_id") String memberId, ExamPlanVO vo, ExamPlanDAO examPlanDAO, Model model) {
		vo.setMember_id(memberId);
		model.addAttribute("examPlanList", examPlanDAO.getExamPlanList(vo));
		model.addAttribute("comExamPlanList", examPlanDAO.getComExamPlanList(vo));
		return "admin/exam.jsp";
	}
    
	@RequestMapping("/getWaitingSubtrahendList.do") /* O */
	public String getWaitingSubtrahendList(@RequestParam("member_id") String memberId, ExamPlanVO vo, ExamPlanDAO examPlanDAO, Model model) {
    	vo.setMember_id(memberId);
    	model.addAttribute("subtrahendList", examPlanDAO.getSubtrahendList(vo));
		return "examcommitmember/subtrahend.jsp";
	}
    
}
