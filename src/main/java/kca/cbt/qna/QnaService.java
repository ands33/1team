package kca.cbt.qna;

import java.util.List;

public interface QnaService {
	
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertQna(QnaVO vo);
	
	// 글 목록 조회
	List<QnaVO> getQnaList(QnaVO vo);
	
	// 글 상세 조회
	QnaVO getQna(QnaVO vo);
	
	// 글 수정
	void updateQna(QnaVO vo);
	
	// 글 삭제
	void deleteQna(QnaVO vo);
}
