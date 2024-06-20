package kca.cbt.examDoc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("examDocService")
public class examDocServiceImpl {
	
	@Autowired
	private examDocDAO examDocDAO;
	
	public List<examDocVO> getExamDocList(examDocVO vo){
		return examDocDAO.getExamDocList(vo);
	}
	
}
