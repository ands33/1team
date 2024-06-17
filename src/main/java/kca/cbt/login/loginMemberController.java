package kca.cbt.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.loginMemberDAO;
import kca.cbt.login.loginMemberVO;

//미완성
@Controller
public class loginMemberController {
	@RequestMapping("/login.do")
	public String loginView(loginMemberVO vo, loginMemberDAO MemberDAO, HttpSession session) {
		loginMemberVO member = MemberDAO.getMember(vo);
		if (member != null) {
	        session.setAttribute("userName", user.getU_name());
	        if ("admin".equals(user1.getU_id()) && "admin123".equals(user1.getU_pw())){
	        	System.out.println("유저리스트로1");
	            return "redirect:getUserList.do";
	        } else {
	        	System.out.println("보드리스트로1");
	            return "redirect:getBoardList.do";
	        }
	    } else {
	        return "login.jsp";
	    }
	}
}
