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

	private final String EXAMPLAN_GET = "select * from examplan where num=?";
	private final String TEST_GET = "select * from test where num=?";
	private final String TEST_CREATE = "insert into test(idx, diff, writtenname, member_id, num) values(?,?,?,?,?)";
	private final String TEST_UPDATE = "update examplan set status=? where num=?";
	private final String TEST_SEND = "완료하고 보내는 SQL문";
	private final String TEST_DELETE = "삭제시 들어갈 SQL문";
	private final String SUBJECT_GET = "select * from subject where idx=?";

	// 문제 생성
	public void createTest(TestVO vo) {
		System.out.println("===> JDBC로 createTest() 기능 처리");
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
					test.setExamName(rs1.getString("MEMBER_NAME"));
					test.setMember_id(rs1.getString("MEMBER_ID"));
				}
				stmt.setInt(1, test.getIdx()); // 1번 ?
				stmt.setString(2, test.getDiff()); // 2번 ?
				stmt.setString(3, test.getExamName()); // 3번 ?
				stmt.setString(4, test.getMember_id()); // 4번 ?
				stmt.setInt(5, test.getNum()); // 5번 ?
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
				test.setWrittenName(rs.getString("WRITTENNAME"));
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

}