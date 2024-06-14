package kca.cbt.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
    @Autowired
    private QnaDAO qnaDAO;
    
    public void setQnaDAO(QnaDAO qnaDAO) {
        this.qnaDAO = qnaDAO;
    }

    public void insertQna(QnaVO vo) {
        qnaDAO.insertQna(vo);
    }

//	public List<QnaVO> getQnaList(QnaVO vo) {
//		return qnaDAO.getQnaList(vo);
//	}
}
