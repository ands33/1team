package kca.cbt.waitingQ;

import java.util.List;

public interface WaitingService {

	List<WaitingVO> getWaitingExamPlanList(WaitingVO vo);
}
