package kca.cbt.view.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.exam_subjects.Exam_subjectDAO;
import kca.cbt.exam_subjects.Exam_subjectVO;
import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class IndexMemberListController {

    @RequestMapping(value = "IndexMemberList.do")
    public String getMemberList(MemberVO vo, MemberDAO memberDAO, Exam_subjectDAO exam_subjectDAO, Model model) {
        List<MemberVO> memberList = memberDAO.getMemberList(vo);
        Map<String, Map<String, String>> subjectData = new HashMap<>();

        for (MemberVO member : memberList) {
            List<Exam_subjectVO> examSubjectList = exam_subjectDAO.getEList(member.getMember_id());
            Map<String, String> subjects = new HashMap<>();
            for (Exam_subjectVO examSubject : examSubjectList) {
                subjects.put(String.valueOf(examSubject.getSubject_code()), examSubject.getName());
            }
            subjectData.put(member.getMember_id(), subjects);
        }

        model.addAttribute("memberList", memberList);
        model.addAttribute("subjectData", subjectData);

        return "admin/adminIndex.jsp";
    }
    
 // Excel export method
    @RequestMapping(value = "/exportToExcel.do", method = RequestMethod.GET)
    public ModelAndView exportToExcel(MemberDAO memberDAO, Exam_subjectDAO exam_subjectDAO) {
        List<MemberVO> memberList = memberDAO.getMemberList(new MemberVO());
        Map<String, Map<String, String>> subjectData = new HashMap<>();

        for (MemberVO member : memberList) {
            List<Exam_subjectVO> examSubjectList = exam_subjectDAO.getEList(member.getMember_id());
            Map<String, String> subjects = new HashMap<>();
            for (Exam_subjectVO examSubject : examSubjectList) {
                subjects.put(String.valueOf(examSubject.getSubject_code()), examSubject.getName());
            }
            subjectData.put(member.getMember_id(), subjects);
        }

        Map<String, Object> model = new HashMap<>();
        model.put("memberList", memberList);
        model.put("subjectData", subjectData);

        return new ModelAndView(new ExcelView(), model);
    }
}
