package kca.cbt.view.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.qna.QnaDAO;
import kca.cbt.qna.QnaVO;

@Controller
public class DeleteQnaController {
	
	@RequestMapping(value="/deleteQna.do")
	public String deleteQna(QnaVO vo, QnaDAO qnaDAO) {
		
		qnaDAO.deleteQna(vo);
		return "getQnaList.do";

	}

}
