package kca.cbt.question_card;

import java.util.List;

public class CardServiceImpl implements CardService{
	private CardDAO cardDAO;

	public List<CardVO> getOneCard(CardVO vo) {
		return cardDAO.getOneCard(vo);
	}

	public List<CardVO> getTwoCard(CardVO vo) {
		return cardDAO.getTwoCard(vo);
	}

}
