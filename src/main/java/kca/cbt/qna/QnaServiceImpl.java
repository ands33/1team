package kca.cbt.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;
	public void insertQna(QnaVO vo) {
		qnaDAO.insertQna(vo);

	}

}
