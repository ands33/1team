package kca.cbt.test;

public interface TestService {

	// 문제 등록
	void createTest(TestVO vo);

	// 문제 업데이트
	void updateTest(TestVO vo);

	// 문제 삭제
	void deleteTest(TestVO vo);
	
	// 작성 완료된 문제 감수로 보냄
	void sendTest(TestVO vo);

	// 문제 정보 가져오기
	TestVO getTest(TestVO vo);

}
