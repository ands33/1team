package kca.cbt.exam_subjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kca.cbt.JDBCUtil;
import kca.cbt.login.MemberVO;

public class Exam_subjectDAO {
	// JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
 // SQL 명령어
    private final String E_List = "select s.* from subject s join member m on s.subject_code = m.subject_code where m.member_id = ?";
    
    // 출제 문항 카드 리스트
    public List<Exam_subjectVO> getEList(Exam_subjectVO vo){
    	System.out.println("===> JDBC로 getEList() 기능 처리");
    	List<Exam_subjectVO> EList = new ArrayList<Exam_subjectVO>();
    	try {
    		conn = JDBCUtil.getConnection();
    		stmt = conn.prepareStatement(E_List);
    		rs = stmt.executeQuery();
    		while (rs.next()) {
    			Exam_subjectVO exam_subject = new Exam_subjectVO();
    			exam_subject.setMember_id(rs.getString("MEMBER_ID"));
    			exam_subject.setSubject_code(rs.getInt("SUBJECT_CODE"));
    			EList.add(exam_subject);
    			
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		JDBCUtil.close(rs, stmt, conn);
    	}
    	return EList;
    }
    
}
