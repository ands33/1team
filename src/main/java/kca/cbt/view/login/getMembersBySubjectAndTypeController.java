package kca.cbt.view.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class getMembersBySubjectAndTypeController {
    
    @RequestMapping(value = "/getMembersBySubjectAndType.do")
    public String getMembersBySubjectAndType(MemberDAO memberDAO, Model model) {

        // 과목명과 과목코드
        Map<Integer, String> subjectMap = new HashMap<>();
        subjectMap.put(11, "상담철학과 윤리");
        subjectMap.put(12, "고급상담 이론과 실제");
        subjectMap.put(13, "집단상담 프로그램 개발");
        subjectMap.put(14, "심리평가와 진단");
        subjectMap.put(15, "고급 상담연구방법론");
        subjectMap.put(16, "상담슈퍼비전의 이론과 실제");
        subjectMap.put(21, "상담윤리");
        subjectMap.put(22, "상담이론과 실제");
        subjectMap.put(23, "집단상담 이론과 실제");
        subjectMap.put(24, "심리검사와 상담");
        subjectMap.put(25, "상담연구방법론");
        subjectMap.put(26, "진로상담");
        subjectMap.put(27, "가족상담");

        // 과목별 출제위원 리스트를 저장할 맵
        Map<Integer, Map<String, List<MemberVO>>> subjectMemberMap = new HashMap<>();

        for (Map.Entry<Integer, String> entry : subjectMap.entrySet()) {
            int subjectCode = entry.getKey();
            List<MemberVO> membersA = memberDAO.getMembersBySubjectAndType(subjectCode, "A");
            List<MemberVO> membersB = memberDAO.getMembersBySubjectAndType(subjectCode, "B");

            Map<String, List<MemberVO>> membersByType = new HashMap<>();
            membersByType.put("A", membersA);
            membersByType.put("B", membersB);

            subjectMemberMap.put(subjectCode, membersByType);
        }

        model.addAttribute("subjectMap", subjectMap);
        model.addAttribute("subjectMemberMap", subjectMemberMap);
        
        return "admin/waitingQ.jsp";
    }
}
