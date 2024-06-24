package kca.cbt.exam_subjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import kca.cbt.JDBCUtil;

public class Exam_subjectDAO {
    // JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL 명령어
    private final String E_List = "select s.grade, s.subject_code, s.name, m.member_id from subject s join member m on s.subject_code = m.subject_code where m.member_id = ?";
    
    // 출제 문항 카드 리스트
    public List<Exam_subjectVO> getEList(String memberId){
        System.out.println("===> JDBC로 getEList() 기능 처리");
        List<Exam_subjectVO> EList = new ArrayList<Exam_subjectVO>();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(E_List);
            stmt.setString(1, memberId); // memberId를 쿼리의 매개변수로 설정
            rs = stmt.executeQuery();
            while (rs.next()) {
                Exam_subjectVO exam_subject = new Exam_subjectVO();
                exam_subject.setMember_id(rs.getString("member_id")); // 조인된 결과에서 member_id 가져오기
                exam_subject.setSubject_code(rs.getInt("grade"));
                exam_subject.setSubject_code(rs.getInt("subject_code"));
                exam_subject.setName(rs.getString("name"));
                EList.add(exam_subject);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return EList;
    }
}
