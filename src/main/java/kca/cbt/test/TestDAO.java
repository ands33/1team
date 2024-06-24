package kca.cbt.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

//DAO(Data Access Object)
@Repository("testDAO")
public class TestDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private PreparedStatement stmt1 = null;
	private ResultSet rs1 = null;

	private PreparedStatement stmt2 = null;
	private ResultSet rs2 = null;

	private final String EXAMPLAN_GET = "SELECT * FROM examplan WHERE num=?";
	private final String TEST_GET = "select * from test where num=?";
	private final String TEST_CREATE = "insert into test(idx, diff, writtenname, member_id, num, reviewer) values(?,?,?,?,?,?)";
	private final String TEST_UPDATE = "update test set behavioral=?, question=?, option1=?, option2=?, option3=?,"
			+ "option4=?, option5=?, answer=?, answerex=?, questionback=?, reference=?, authoryear=?, page=?, createdate=?,"
			+ "aff=?, e_status=? where num=?";
	private final String TEST_SEND = "update test set e_status=? where num=?";
	private final String SUBJECT_GET = "select * from subject where idx=?";

	// 문제 생성
	public void createTest(TestVO vo) {
		try {
			conn = JDBCUtil.getConnection(); // test db 가르킴
			stmt = conn.prepareStatement(TEST_CREATE);

			stmt2 = conn.prepareStatement(TEST_GET);
			stmt2.setInt(1, vo.getNum());
			rs2 = stmt2.executeQuery();

			if (!rs2.next()) {

				stmt1 = conn.prepareStatement(EXAMPLAN_GET);
				stmt1.setInt(1, vo.getNum());
				rs1 = stmt1.executeQuery();

				TestVO test = new TestVO();
				if (rs1.next()) {
					test.setNum(rs1.getInt("NUM"));
					test.setIdx(rs1.getInt("IDX"));
					test.setDiff(rs1.getString("DIFF"));
					test.setWrittenName(rs1.getString("MEMBER_NAME"));
					test.setMember_id(rs1.getString("MEMBER_ID"));
					test.setReviewer(rs1.getString("SUBMEMBER_NAME"));
				}
				stmt.setInt(1, test.getIdx()); // 1번 ?
				stmt.setString(2, test.getDiff()); // 2번 ?
				stmt.setString(3, test.getWrittenName()); // 3번 ?
				stmt.setString(4, test.getMember_id()); // 4번 ?
				stmt.setInt(5, test.getNum()); // 5번 ?
				stmt.setString(6, test.getReviewer()); // 6번 ?
				stmt.executeUpdate();
			} else {
				System.out.println("num값 존재");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn.close();
			// stmt.close();
			JDBCUtil.close(rs1, stmt1, conn);
			JDBCUtil.close(rs2, stmt2, conn);
			JDBCUtil.close(stmt, conn);
		}
	}

	// 의뢰서에서 쓸 한가지 의뢰 가져오기
	public TestVO getTest(TestVO vo) {
		TestVO test = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEST_GET);
			stmt.setInt(1, vo.getNum());
			rs = stmt.executeQuery();

			if (rs.next()) {
				test = new TestVO();
				test.setIdx(rs.getInt("IDX"));
				test.setBehavioral(rs.getString("BEHAVIORAL"));
				test.setDiff(rs.getString("DIFF"));
				test.setQuestion(rs.getString("QUESTION"));
				test.setOption1(rs.getString("OPTION1"));
				test.setOption2(rs.getString("OPTION2"));
				test.setOption3(rs.getString("OPTION3"));
				test.setOption4(rs.getString("OPTION4"));
				test.setOption5(rs.getString("OPTION5"));
				test.setAnswer(rs.getInt("ANSWER"));
				test.setAnswerEx(rs.getString("ANSWEREX"));
				test.setCorrRate(rs.getInt("CORRRATE"));
				test.setQuestionBack(rs.getString("QUESTIONBACK"));
				test.setReference(rs.getString("REFERENCE"));
				test.setAuthorYear(rs.getString("AUTHORYEAR"));
				test.setPage(rs.getString("PAGE"));
				String createDate = rs.getString("CREATEDATE");
	            if (createDate != null && createDate.length() >= 10) {
	                test.setCreateDate(createDate.substring(0, 10));
	            } else {
	                test.setCreateDate(createDate); // Handle if createDate format is unexpected
	            }
				test.setAff(rs.getString("AFF"));
				test.setWrittenName(rs.getString("WRITTENNAME"));
				test.setNum(rs.getInt("NUM"));
				test.setMember_id(rs.getString("MEMBER_ID"));
				test.setReviewer(rs.getString("REVIEWER"));
				test.setReview(rs.getString("REVIEW"));
			}

			stmt1 = conn.prepareStatement(SUBJECT_GET);
			stmt1.setInt(1, rs.getInt("IDX"));
			rs1 = stmt1.executeQuery();

			if (rs1.next()) {
				test.setName(rs1.getString("NAME"));
				test.setCategory1(rs1.getString("CATEGORY1"));
				test.setCategory2(rs1.getString("CATEGORY2"));
				test.setCategory3(rs1.getString("CATEGORY3"));
				test.setGrade(rs1.getInt("GRADE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return test;
	}

	public void updateTest(TestVO vo) {
		System.out.println("updateTest() 처리");
		try {
			conn = JDBCUtil.getConnection();
			// update test set behavioral=?, question=?, option1=?, option2=?, option3=?,"
			// "option4=?, option5=?, answer=?, answerex=?, questionback=?, reference=?,
			// authoryear=?, page=?, createdate=?,"
			// "aff=? where num=?
			stmt = conn.prepareStatement(TEST_UPDATE);
			stmt.setString(1, vo.getBehavioral());
			stmt.setString(2, vo.getQuestion());
			stmt.setString(3, vo.getOption1());
			stmt.setString(4, vo.getOption2());
			stmt.setString(5, vo.getOption3());
			stmt.setString(6, vo.getOption4());
			stmt.setString(7, vo.getOption5());
			stmt.setInt(8, vo.getAnswer());
			stmt.setString(9, vo.getAnswerEx());
			stmt.setString(10, vo.getQuestionBack());
			stmt.setString(11, vo.getReference());
			stmt.setString(12, vo.getAuthorYear());
			stmt.setString(13, vo.getPage());
			stmt.setString(14, vo.getCreateDate()); // 변환된 sqlDate 사용
			stmt.setString(15, vo.getAff());
			stmt.setString(16, "출제중");
			stmt.setInt(17, vo.getNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void sendTest(TestVO vo) {
		System.out.println("sendTest() 처리");
		try {
			conn = JDBCUtil.getConnection();
			// update test set e_status=? where num=?
			stmt = conn.prepareStatement(TEST_SEND);
			stmt.setString(1, "제출(검토대기)");
			stmt.setInt(2, vo.getNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

}