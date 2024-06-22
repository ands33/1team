package kca.cbt.view.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UpdateMemberSubjectController {

    @RequestMapping(value = "/updateSubjectMember.do", method = RequestMethod.POST)
    public String updateMemberSubject(@RequestParam("subject_code") String[] subjectCodes, 
                                      @RequestParam("member_id") String memberId,
                                      MemberDAO memberDAO) {
        System.out.println("Received memberId: " + memberId); // memberId 확인
        for (String subjectCode : subjectCodes) {
            System.out.println("Received subjectCode: " + subjectCode); // subjectCode 확인
            try {
                int subjectCodeInt = Integer.parseInt(subjectCode); // int로 변환
                MemberVO vo = new MemberVO();
                vo.setMember_id(memberId);
                vo.setSubject_code(subjectCodeInt);
                memberDAO.updateMemberSubject(vo);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        return "redirect:IndexMemberList.do";
    }
}
