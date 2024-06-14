package kca.cbt.qna;

import java.util.List;


public class QnaServiceImpl implements QnaService {
    private QnaDAO qnaDAO;
    
    public void setQnaDAO(QnaDAO qnaDAO) {
        this.qnaDAO = qnaDAO;
    }

    public void insertQna(QnaVO vo) {
        qnaDAO.insertQna(vo);
    }
    
    @Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		return qnaDAO.getQnaList(vo);
	}
}
