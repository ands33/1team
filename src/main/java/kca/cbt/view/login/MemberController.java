package kca.cbt.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class MemberController {
	
	@RequestMapping("/login.do")
	public String loginView(MemberVO vo, MemberDAO memberDAO, HttpSession session) {
		MemberVO member = memberDAO.getMember(vo);
		if (member != null) {
	        session.setAttribute("memberName", member.getMember_name());
	        if ("admin".equals(member.getMember_id()) && "adminpassword".equals(member.getPw())) {
	        	System.out.println("===> 관리자로그인");
	            return "redirect:getUserList.do";
	        } else {
	        	System.out.println("===> 출제위원으로 로그인");
	            return "redirect:getBoardList.do";
	        }
	    } else {
	        return "login.jsp";
	    }
	}
}
