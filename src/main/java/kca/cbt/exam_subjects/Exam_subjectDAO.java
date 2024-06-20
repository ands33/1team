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
    
 // SQL 명령어들
    private final String E_List = "select * from exam_subjects order by member_id";
    private final String UPDATE_E = "update exam_subjects set subject_name=? subject_code=? where  member_id = ?";
    
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
    			exam_subject.setSubject_name(rs.getString("SUBJECT_NAME"));
    			EList.add(exam_subject);
    			
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		JDBCUtil.close(rs, stmt, conn);
    	}
    	return EList;
    }
    
    // 리스트 업데이트
    public void updateE(Map<String, Exam_subjectVO> es) {
    	System.out.println("===> JDBC로 updateE() 기능 처리");
    	
    	try {
    		conn = JDBCUtil.getConnection();
            conn.setAutoCommit(false);  // 트랜잭션 시작

            stmt = conn.prepareStatement(UPDATE_E);
            for (Map.Entry<String, Exam_subjectVO> entry : es.entrySet()) {
            	Exam_subjectVO vo = entry.getValue();
                stmt.setString(1, vo.getSubject_name());
                stmt.setInt(2, vo.getSubject_code());
                stmt.setString(3, vo.getMember_id());
                stmt.addBatch();
            }
            stmt.executeBatch();
            conn.commit();  // 트랜잭션 커밋
    	}catch (Exception e) {
    		try {
    			if(conn != null) conn.rollback();
    		}catch(Exception rollbackEx) {
    			rollbackEx.printStackTrace();
    		}
    		e.printStackTrace();
    	}finally {
    		JDBCUtil.close(stmt, conn);
    	}
    }
}
