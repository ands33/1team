package kca.cbt.notice;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import kca.cbt.notice.NoticeService;
import kca.cbt.notice.NoticeVO;

public class NoticeServiceClient {

	public static void main(String[] args) {
		// 1. Spring 컨테이너를 구동한다.
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");

		// 2. Spring 컨테이너로부터 BoardServiceImpl 객체를 Lookup한다.
		NoticeService noticeService = (NoticeService) container.getBean("noticeService");

		// 3. 글 등록 기능 테스트
		NoticeVO vo = new NoticeVO();
		vo.setTitle("임시 제목");
		vo.setWriter("홍길동");
		vo.setContent("임시 내용..............");
		noticeService.insertNotice(vo);

		// 4. 글 목록 검색 기능 테스트
		List<NoticeVO> noticeList = noticeService.getNoticeList(vo);
		for (NoticeVO notice : noticeList) {
			System.out.println("---> " + notice.toString());
		}
		// 5. Spring 컨테이너 종료
		container.close();
	}
}
