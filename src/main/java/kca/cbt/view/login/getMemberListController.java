package kca.cbt.view.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class getMemberListController {
	
    @RequestMapping(value = "getMemberList.do")
    public String getMemberList(MemberVO vo, MemberDAO memberDAO, Model model) {
        model.addAttribute("memberList", memberDAO.getMemberList(vo));
        return "admin/memberlist.jsp";
    }
}
