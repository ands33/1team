package kca.cbt.view.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;
import kca.cbt.question_card.CardDAO;
import kca.cbt.question_card.CardVO;

@Controller
public class IndexMemberListController {
	
	@RequestMapping(value = "IndexMemberList.do")
	public String getMemberList(CardVO vo1, CardDAO cardDAO, MemberVO vo, MemberDAO memberDAO, Model model) {
		model.addAttribute("memberList", memberDAO.getMemberList(vo));
		model.addAttribute("cardList1", cardDAO.getOneCard(vo1));
		model.addAttribute("cardList2", cardDAO.getTwoCard(vo1));
		return "admin/adminIndex.jsp";
	}
}