package kca.cbt.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kca.cbt.JDBCUtil;

public class loginMemberDAO {
	// JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL 명령어들
    private final String loginMember_GET = "select * from member where member_id=? and pw=? and member_name=? and memeber_type=?";
    
    //Member 정보 get
    public loginMemberVO getMember(loginMemberVO vo) {
        loginMemberVO member = null;
    	try {
    		conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(loginMember_GET);
			stmt.setString(1, vo.getMember_id());
			stmt.setString(2, vo.getPw());
			stmt.setString(3, vo.getMember_name());
			stmt.setString(4, vo.getMember_type());
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				// ResultSet에서 회원 정보를 가져와서 Member 객체에 저장
				member = new loginMemberVO();
		        member.setMember_id(rs.getString("MEMBER_ID"));
		        member.setPw(rs.getString("PW"));
		        member.setMember_name(rs.getString("MEMBER_NAME"));
		        member.setMember_type(rs.getString("MEMBER_TYPE"));
		        }
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally {
    		// 리소스 해제 (Connection, PreparedStatement, ResultSet)
			JDBCUtil.close(rs, stmt, conn);
			// close 메서드는 연결 해제를 처리하는 유틸리티 메서드
    	}
		return member;
    }
}
