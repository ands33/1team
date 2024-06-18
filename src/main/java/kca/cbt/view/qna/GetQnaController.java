package kca.cbt.view.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.qna.QnaDAO;
import kca.cbt.qna.QnaVO;

@Controller
public class GetQnaController {
	@RequestMapping(value = "/getQna.do")
	public ModelAndView getQna(QnaVO vo, QnaDAO qnaDAO, ModelAndView mav) {
		// 조회수 증가
		qnaDAO.increaseViews(vo);
		
		mav.addObject("qna",qnaDAO.getQna(vo)); // Model 정보 저장
		mav.setViewName("qna/qnadetail.jsp");
		return mav;
	}
	
}
