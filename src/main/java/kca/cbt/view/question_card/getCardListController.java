package kca.cbt.view.question_card;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.question_card.CardDAO;
import kca.cbt.question_card.CardVO;

@Controller
public class getCardListController {
	
	@RequestMapping(value = "getOneCardList.do")
	public String getOneCardList(CardVO vo, CardDAO cardDAO, Model model) {
		model.addAttribute("cardList1", cardDAO.getOneCard(vo));
		model.addAttribute("cardList2", cardDAO.getOneCard(vo));
		return "admin/memberlist.jsp";
	}
	
	@RequestMapping(value = "getTwoCardList.do")
	public String getTwoCardList(CardVO vo, CardDAO cardDAO, Model model) {
		model.addAttribute("cardList2", cardDAO.getTwoCard(vo));
		return "admin/memberlist.jsp";
	}
}
