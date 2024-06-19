package kca.cbt.question_card;

import java.util.List;

public interface CardService {

	// CRUE 기능의 메소드 구현
	List<CardVO> getOneCard(CardVO vo);
	
	List<CardVO> getTwoCard(CardVO vo);
	
	
}
