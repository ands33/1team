package kca.cbt.qna;


import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class QnaClient {

	public static void main(String[] args) {
		// 1. Spring 컨테이너를 구동한다.
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");

		// 2. Spring 컨테이너로부터 BoardServiceImpl 객체를 Lookup한다.
		QnaService qnaService = (QnaService) container.getBean("qnaService");

		// 3. 글 등록 기능 테스트
		QnaVO vo = new QnaVO();
		vo.setTitle("임시 제목");
		qnaService.insertQna(vo);

		// 5. Spring 컨테이너 종료
		container.close();
	}
}
