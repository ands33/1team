package kca.cbt.subtrahend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

@Repository("subtrahendDAO")
public class SubtrahendDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String REVIEW_UPDATE = "update test set review=? where num=?";
	
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

}
