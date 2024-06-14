package kca.cbt.exam;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kca.cbt.qna.QnaDAO;

@Service("testSerivce")
public class TestServiceImpl implements TestService {
	@Autowired
	private TestDAO testDAO;

    public void setTestDAO(TestDAO testDAO) {
        this.testDAO = testDAO;
    }

	public List<TestVO> getTestList(TestVO vo) {
		// TODO Auto-generated method stub
		return testDAO.getTestList(vo);
	}

}
