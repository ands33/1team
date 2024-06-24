package kca.cbt.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("testService")
public class TestServiceImpl implements TestService {
    @Autowired
    private TestDAO testDAO;

    public void setTestDAO(TestDAO testDAO) {
        this.testDAO = testDAO;
    }

    @Override
    public void createTest(TestVO vo) {
        testDAO.createTest(vo);
    }

    @Override
    public TestVO getTest(TestVO vo) {
        return testDAO.getTest(vo);
    }

    @Override
    public void updateTest(TestVO vo) {
        testDAO.updateTest(vo);
    }

    @Override
    public void deleteTest(TestVO vo) {
        //testDAO.deleteTest(vo);
    }

    @Override
    public void sendTest(TestVO vo) {
        // sendTest 메소드 구현 필요
    }
}