package kca.cbt.view.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class DeleteMemberSubjectController {
	
	@RequestMapping(value = "/deleteSubjectMember.do")
	public String deleteMemberSubject(@RequestParam("memberId") String memberId, MemberDAO memberDAO, MemberVO vo) {
		vo.setMember_id(memberId);
		memberDAO.deleteMemberSubject(vo);
		return "redirect:/IndexMemberList.do";
	}

}
