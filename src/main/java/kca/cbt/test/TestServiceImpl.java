package kca.cbt.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("testSerivce")
public class TestServiceImpl implements TestService {
	@Autowired
	private TestDAO testDAO;

	public void setTestDAO(TestDAO testDAO) {
		this.testDAO = testDAO;
	}

	// 문제 등록
	public void createTest(TestVO vo) {
		testDAO.createTest(vo);
	}

	// 문제 정보 가져오기
	public TestVO getTest(TestVO vo) {
		return testDAO.getTest(vo);
	}

	// 문제 업데이트
	public void updateTest(TestVO vo) {

	}

	// 문제 삭제
	public void deleteTest(TestVO vo) {

	}

	// 작성 완료된 문제 감수로 보냄
	public void sendTest(TestVO vo) {

	}

}