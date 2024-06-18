package kca.cbt.subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("subjectSerivce")
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	private SubjectDAO subjectDAO;

	public void setSubjectDAO(SubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}

	public SubjectVO getSubject(SubjectVO vo) {
		return subjectDAO.getSubject(vo);
	}

}
