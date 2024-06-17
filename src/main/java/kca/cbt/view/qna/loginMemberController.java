package kca.cbt.view.qna;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.loginMemberDAO;
import kca.cbt.login.loginMemberVO;

@Controller
public class loginMemberController {
	@RequestMapping("/login.do")
	public String loginView(loginMemberVO vo, loginMemberDAO MemberDAO, HttpSession session) {
		loginMemberVO member = MemberDAO.getMember(vo);
		if (member != null) {
			session.setAttribute("userName", member.getMember_name());
            session.setAttribute("userId", member.getMember_id());
            session.setAttribute("userType", member.getMember_type());
	        if ("A".equals(member.getMember_type())){
	        	System.out.println("A위원으로");
	            return "redirect:indexA.jsp";
	        } else {
	        	System.out.println("B위원으로");
	            return "redirect:indexB.jsp";
	        }
	    } else {
	        return "login.jsp";
	    }
	}
}
