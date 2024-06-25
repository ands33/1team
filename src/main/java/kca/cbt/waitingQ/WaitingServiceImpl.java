package kca.cbt.waitingQ;

import java.util.List;

public class WaitingServiceImpl implements WaitingService{
	private WaitingDAO waitingDAO;
	
	public List<WaitingVO> getWaitingExamPlanList(WaitingVO vo) {
		return waitingDAO.getWaitingExamPlanList(vo);
	}

}
