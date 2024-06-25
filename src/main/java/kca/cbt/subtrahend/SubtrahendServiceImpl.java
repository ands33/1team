package kca.cbt.subtrahend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kca.cbt.test.TestDAO;

@Service("subtrahendService")
public class SubtrahendServiceImpl implements SubtrahendService {
	
	@Autowired
    private SubtrahendDAO subtrahendDAO;
	
	public void setSubtrahendDAO(SubtrahendDAO subtrahendDAO) {
        this.subtrahendDAO = subtrahendDAO;
    }
	
	@Override
    public void updateReview(SubtrahendVO vo) {
        subtrahendDAO.updateReview(vo);
    }

}
