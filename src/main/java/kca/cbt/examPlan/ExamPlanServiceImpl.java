package kca.cbt.examplan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardVO;

import kca.cbt.qna.QnaDAO;

@Service("testSerivce")
public class ExamPlanServiceImpl implements ExamPlanService {
	@Autowired
	private ExamPlanDAO examPlanDAO;

	public void setExamPlanDAO(ExamPlanDAO examPlanDAO) {
		this.examPlanDAO = examPlanDAO;
	}

	public List<ExamPlanVO> getExamPlanList(ExamPlanVO vo) {
		return examPlanDAO.getExamPlanList(vo);
	}
	
	public void updateStatus(ExamPlanVO vo) {
		examPlanDAO.updateStatus(vo);
	}

}
