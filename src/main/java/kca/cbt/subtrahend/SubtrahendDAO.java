package kca.cbt.subtrahend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

import kca.cbt.test.TestVO;

@Repository("subtrahendDAO")
public class SubtrahendDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String REVIEW_UPDATE = "update test set review=? where num=?";
	private final String RE_EXAM = "update test set e_status=? where num=?";
	private final String TEST_SEND = "update test set e_status=? where num=?";
	
	public void updateReview(SubtrahendVO vo) {
		System.out.println("updateReview() 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_UPDATE);
			stmt.setString(1, vo.getReview());
			stmt.setInt(2, vo.getNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void reExam(SubtrahendVO vo) {
		System.out.println("reExam() 처리");
		try {
			conn = JDBCUtil.getConnection();
			// update test set e_status=? where num=?
			stmt = conn.prepareStatement(RE_EXAM);
			stmt.setString(1, "재출제요청");
			stmt.setInt(2, vo.getNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void testComplete(SubtrahendVO vo) {
		System.out.println("testComplete() 처리");
		try {
			conn = JDBCUtil.getConnection();
			// update test set e_status=? where num=?
			stmt = conn.prepareStatement(TEST_SEND);
			stmt.setString(1, "제출(완료)");
			stmt.setInt(2, vo.getNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

}
