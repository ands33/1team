package kca.cbt.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/login.do")
	public String loginView(MemberVO vo, MemberDAO memberDAO, HttpSession session) {
		MemberVO member = memberDAO.getMember(vo);
		if (member != null) {
	        session.setAttribute("memberName", member.getMember_name());
	        if ("admin".equals(member.getMember_id()) && "adminpassword".equals(member.getPw())) {
	        	System.out.println("===> 관리자로그인");
//	            return "redirect:getUserList.do";
	        	return "redirect:/IndexMemberList.do";
//	        	관리자페이지로가도록구현해야함
	        } 
	        else if ("A".equals(member.getMember_type())){
	        	System.out.println("===> 출제위원 A로 로그인");
	            //return "redirect:/getExamDocList.do";
	        	return "redirect:indexA.jsp";
	        }
	        else if("B".equals(member.getMember_type())){
	        	System.out.println("===> 출제위원 B로 로그인");
	        	return "redirect:indexB.jsp";
	        }
	    } else {
	        return "redirect:login/login.jsp?error=true";
	    }
		return "redirect:login/login.jsp?error=true";
	}
}
