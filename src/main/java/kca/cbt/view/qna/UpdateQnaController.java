package kca.cbt.view.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.qna.QnaDAO;
import kca.cbt.qna.QnaVO;

@Controller
public class UpdateQnaController {
	
	@RequestMapping(value="/updateQna.do")
	public String updateQna(QnaVO vo, QnaDAO qnaDAO) {
		
		qnaDAO.updateQna(vo);
		return "getQnaList.do";
	}

}
