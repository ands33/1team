package kca.cbt.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kca.cbt.JDBCUtil;

public class MemberDAO {
	// JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL 명령어들
    private final String MEMBER_GET = "select * from member where member_id=? and pw=?";
    
    //Member 정보 get
    public MemberVO getMember(MemberVO vo) {
    	MemberVO member = null;

    	try {
    		System.out.println("===> JDbC로 getMember() 기능 처리");
    		conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getMember_id());
			stmt.setString(2, vo.getPw());
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
		    	member.setMember_id(rs.getString("MEMBER_ID"));
		    	member.setPw(rs.getString("PW"));
		    	member.setMember_name(rs.getString("MEMBER_NAME"));
		    	member.setMember_type(rs.getString("MEMBER_TYPE"));
			}
    	}catch (Exception e) {
    		e.printStackTrace();
    	}finally {
    		JDBCUtil.close(rs, stmt, conn);
    	}
    	return member;
    }
}
