package com.springbook.biz;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;

public class BoardServiceClient {

	public static void main(String[] args) {
		// 1. Spring 컨테이너를 구동한다.
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");

		// 2. Spring 컨테이너로부터 BoardServiceImpl 객체를 Lookup한다.
		BoardService boardService = (BoardService) container.getBean("boardService");

		// 3. 글 등록 기능 테스트
		BoardVO vo = new BoardVO();
		vo.setTitle("임시 제목");
		vo.setWriter("홍길동");
		vo.setContent("임시 내용..............");
		boardService.insertBoard(vo);

		// 4. 글 목록 검색 기능 테스트
		List<BoardVO> boardList = boardService.getBoardList(vo);
		for (BoardVO board : boardList) {
			System.out.println("---> " + board.toString());
		}
		// 5. Spring 컨테이너 종료
		container.close();
		// 깃 테스트  깃 테스트  깃 테스트  깃 테스트  깃 테스트  깃 테스트  깃 테스트 
		// 아아아앙아ㅏㅇ
		// 기모찌 기모찌 기모지 기모찌 기모찌 기모찌찌찌 앙아앙아아아ㅏㅇㅇ
		//오늘의 점심은 서브웨이 입니다.
		// 바보 멍충이
		// 강하늘 멍청이
		// 강하늘 바보
		// 멍충이들 ㅎ

	}

}
