package kca.cbt.exam.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kca.cbt.exam.TestService;
import kca.cbt.exam.TestVO;

@Service("testSerivce")
public class TestServiceImpl implements TestService {
	@Autowired
	private TestDAO testDAO;


	public List<TestVO> getTestList(TestVO vo) {
		// TODO Auto-generated method stub
		return testDAO.getTestList(vo);
	}

}
