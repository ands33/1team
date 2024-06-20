//package kca.cbt.view.login;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import kca.cbt.exam_subjects.Exam_subjectDAO;
//import kca.cbt.exam_subjects.Exam_subjectVO;
//import kca.cbt.login.MemberDAO;
//import kca.cbt.login.MemberVO;
//import kca.cbt.question_card.CardDAO;
//import kca.cbt.question_card.CardVO;
//
//@Controller
//public class IndexMemberListController {
//	
//	@RequestMapping(value = "IndexMemberList.do")
//	public String getMemberList(Exam_subjectVO vo2, Exam_subjectDAO exam_subjectDAO, CardVO vo1, CardDAO cardDAO, MemberVO vo, MemberDAO memberDAO, Model model) {
//		model.addAttribute("memberList", memberDAO.getMemberList(vo));
//		model.addAttribute("cardList1", cardDAO.getOneCard(vo1));
//		model.addAttribute("cardList2", cardDAO.getTwoCard(vo1));
//		model.addAttribute("EList", exam_subjectDAO.getEList(vo2));
//		return "admin/adminIndex.jsp";
//	}
//	
//	@RequestMapping(value = "openSubjectPopup.do")
//	public String openSubjectPopup(@RequestParam("rowIdx") int rowIdx, CardVO vo, CardDAO cardDAO, Model model) {
//		model.addAttribute("rowIdx", rowIdx);
//		model.addAttribute("cardList1", cardDAO.getOneCard(vo));
//		model.addAttribute("cardList2", cardDAO.getTwoCard(vo));
//		return "admin/subject_popup.jsp";
//	}
//}
package kca.cbt.view.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.exam_subjects.Exam_subjectDAO;
import kca.cbt.exam_subjects.Exam_subjectVO;
import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;
import kca.cbt.question_card.CardDAO;
import kca.cbt.question_card.CardVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexMemberListController {

    @RequestMapping(value = "IndexMemberList.do")
    public String getMemberList(Exam_subjectVO vo2, Exam_subjectDAO exam_subjectDAO, CardVO vo1, CardDAO cardDAO, MemberVO vo, MemberDAO memberDAO, Model model) {
        List<MemberVO> memberList = memberDAO.getMemberList(vo);
        List<Exam_subjectVO> examSubjectList = exam_subjectDAO.getEList(vo2);

        model.addAttribute("memberList", memberList);
        model.addAttribute("cardList1", cardDAO.getOneCard(vo1));
        model.addAttribute("cardList2", cardDAO.getTwoCard(vo1));
        model.addAttribute("EList", examSubjectList);

        // 동적으로 subjectData 설정
        Map<String, Map<String, String>> subjectData = new HashMap<>();
        for (Exam_subjectVO examSubject : examSubjectList) {
            Map<String, String> data = new HashMap<>();
            data.put("subjectName", examSubject.getSubject_name());
            data.put("subjectCode", String.valueOf(examSubject.getSubject_code()));
            subjectData.put(examSubject.getMember_id(), data);
        }
        model.addAttribute("subjectData", subjectData);

        return "admin/adminIndex.jsp";
    }

    @RequestMapping(value = "openSubjectPopup.do")
    public String openSubjectPopup(@RequestParam("rowIdx") int rowIdx, CardVO vo, CardDAO cardDAO, Model model) {
        model.addAttribute("rowIdx", rowIdx);
        model.addAttribute("cardList1", cardDAO.getOneCard(vo));
        model.addAttribute("cardList2", cardDAO.getTwoCard(vo));
        return "admin/subject_popup.jsp";
    }
}
