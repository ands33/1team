package kca.cbt.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kca.cbt.JDBCUtil;

public class MemberDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private PreparedStatement stmt1 = null;
	private ResultSet rs1 = null;

	private PreparedStatement stmt2 = null;
	private ResultSet rs2 = null;
	// SQL 명령어들
	private final String MEMBER_GET = "select * from member where member_id=? and pw=?";
	private final String MEMBER_LIST = "select * from member order by member_id";
	private final String MEMBER_UPDATE = "update member set pw=?, member_name=?, member_type=? where member_id=?";
	private final String MEMBER_SUBJECT_UPDATE = "update member set subject_code = ? where member_id = ? ";
	private final String MEMBER_SUBJECT_DELETE = "update member set subject_code = NULL where member_id = ?";
	private final String SUBJECT_NAME_GET = "select distinct name from subject where subject_code=?";
	private final String SUBJECT_CODE_GET = "select subject_code from member where member_id=?";
	private final String MEMBER_A_GET = "select member_name from member where subject_code=? and member_type='A'";
	private final String MEMBER_B_GET = "select member_name from member where subject_code=? and member_type='B'";
	private final String MEMBER_QMEMBER = "select * from member where member_type = ? and subject_code = ?";

	// Member 정보 get
	public MemberVO getMember(MemberVO vo) {
		MemberVO member = null;
		try {
			System.out.println("===> JDBC로 getMember() 기능 처리");
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
				member.setSubject_code(rs.getInt("SUBJECT_CODE"));
			}
			stmt1 = conn.prepareStatement(SUBJECT_NAME_GET);
			stmt1.setInt(1, member.getSubject_code());
			rs1 = stmt1.executeQuery();

			if (rs1.next()) {
				member.setSubject_name(rs1.getString("NAME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs1, stmt1, conn);
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}

	// 회원 리스트 조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("=== > JDBC로 getMemberList() 기능 처리");
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				MemberVO member = new MemberVO();
				member.setMember_id(rs.getString("MEMBER_ID"));
				member.setPw(rs.getString("PW"));
				member.setMember_name(rs.getString("MEMBER_NAME"));
				member.setMember_type(rs.getString("MEMBER_TYPE"));
				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return memberList;
	}

	// 여러 회원 업데이트
	public void updateMember(Map<String, MemberVO> members) {
		System.out.println("===> JDBC로 updateMembers() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false); // 트랜잭션 시작
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			for (Map.Entry<String, MemberVO> entry : members.entrySet()) {
				MemberVO vo = entry.getValue();
				stmt.setString(1, vo.getPw());
				stmt.setString(2, vo.getMember_name());
				stmt.setString(3, vo.getMember_type());
				stmt.setString(4, vo.getMember_id());
				stmt.addBatch();
			}
			stmt.executeBatch();
			conn.commit(); // 트랜잭션 커밋
		} catch (Exception e) {
			try {
				if (conn != null)
					conn.rollback(); // 오류 시 트랜잭션 롤백
			} catch (Exception rollbackEx) {
				rollbackEx.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void updateMemberSubject(MemberVO vo) {
		System.out.println("===> JDBC로 updateMemberSubject() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_SUBJECT_UPDATE);
			stmt.setInt(1, vo.getSubject_code());
			stmt.setString(2, vo.getMember_id());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void deleteMemberSubject(MemberVO vo) {
		System.out.println("===> JDBC로 updateMemberSubject() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_SUBJECT_DELETE);
			stmt.setString(1, vo.getMember_id());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public MemberVO getMemberAB(MemberVO vo) {
		MemberVO member = null;
		try {
			System.out.println("===> JDBC로 getMemberAB() 기능 처리");
			conn = JDBCUtil.getConnection();

			stmt2 = conn.prepareStatement(SUBJECT_CODE_GET);
			stmt2.setString(1, vo.getMember_id());
			rs2 = stmt2.executeQuery();

			member = new MemberVO();
			if (rs2.next()) {
				member.setSubject_code(rs2.getInt("SUBJECT_CODE"));
			}

			stmt = conn.prepareStatement(MEMBER_A_GET);
			stmt.setInt(1, member.getSubject_code());
			rs = stmt.executeQuery();

			stmt1 = conn.prepareStatement(MEMBER_B_GET);
			stmt1.setInt(1, member.getSubject_code());
			rs1 = stmt1.executeQuery();

			if (rs.next()) {
				member.setMemberA(rs.getString("MEMBER_NAME"));
			}

			if (rs1.next()) {
				member.setMemberB(rs1.getString("MEMBER_NAME"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs1, stmt1, conn);
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}

	// 주어진 과목 코드와 타입에 해당하는 출제위원 리스트 조회
	public List<MemberVO> getMembersBySubjectAndType(int subjectCode, String memberType) {
		List<MemberVO> members = new ArrayList<>();
		try {
			System.out.println("===> JDBC로 getMembersBySubjectAndType() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_QMEMBER);
			stmt.setString(1, memberType);
			stmt.setInt(2, subjectCode);
			rs = stmt.executeQuery();
			while (rs.next()) {
				MemberVO member = new MemberVO();
				member.setMember_id(rs.getString("MEMBER_ID"));
				member.setPw(rs.getString("PW"));
				member.setMember_name(rs.getString("MEMBER_NAME"));
				member.setMember_type(rs.getString("MEMBER_TYPE"));
				members.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return members;
	}
}
