package kca.cbt.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kca.cbt.JDBCUtil;
import kca.cbt.qna.QnaVO;

@Repository("qnaDAO")
public class loginMemberDAO {
	// JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL 명령어들
    // nvl은 null일경우 뒤의값, 아닐경우 앞의값을 return
    private final String loginMember_INSERT = "insert into member (full name, birth, email) values(?, ?, ?))";
    
 // QnA 삽입 메소드
    public void insertloginMember(loginMemberVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(loginMember_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getQ());
            stmt.setString(3, vo.getMember_id()); // member_id 추가
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
}
