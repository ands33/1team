package kca.cbt.examDoc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("examDocService")
public class examDocServiceImpl implements examDocService {
	
	@Autowired
	private examDocDAO examdocDAO;
	
	public List<examDocVO> getExamDocList(examDocVO vo){
		return examdocDAO.getExamDocList(vo);
	}
}

/*
public examDocVO getExamDoc(examDocVO vo) {
	return examdocDAO.getExamDoc(vo);
}
*/