package kca.cbt.notice;

import java.util.List;

public interface NoticeService {

	// CURD 기능 메소드 구현
	// 공지 등록
	void insertNotice(NoticeVO vo);
	
	// 공지 수정
	void updateNotice(NoticeVO vo);
	
	// 공지 삭제
	void deleteNotice(NoticeVO vo);
	
	//공지 상세 조회
	NoticeVO getNotice(NoticeVO vo);
	
	//공지 목록 조회
	List<NoticeVO> getNoticeList(NoticeVO vo);
	
}
