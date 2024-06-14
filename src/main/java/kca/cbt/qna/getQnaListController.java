//package kca.cbt.qna;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//public class getQnaListController {
//	@RequestMapping(value="/getQnaList.do")
//	public String getQnaList(QnaVO vo, QnaDAO qnaDAO, Model model) {
//		model.addAttribute("qnaList", qnaDAO.getQnaList(vo));
//		return "QnaList.jsp";
//	}
//}
