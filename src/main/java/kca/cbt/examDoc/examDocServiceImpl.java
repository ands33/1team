package kca.cbt.examDoc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class examDocServiceImpl implements examDocService {
	
	/*@Autowired
	private examDocDAO examdocDAO;
	
	public List<examDocVO> getExamDocList(examDocVO vo){
		return examdocDAO.getExamDocList(vo);
	}*/
	
	@Autowired
	private examDocDAO examdocDAO;
	
	public List<examDocVO> getExamDocSub(examDocVO vo){
		return examdocDAO.getExamDocSub(vo);
	}
}