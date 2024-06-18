package kca.cbt.subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

//DAO(Data Access Object)
@Repository("subjectDAO")
public class SubjectDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private final String SUBJECT_GET = "select * from examplan where idx=?";

	// 과목 한가지 가져오기
	public SubjectVO getSubject(SubjectVO vo) {

		SubjectVO subject = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(SUBJECT_GET);
			stmt.setInt(1, vo.getIdx());
			rs = stmt.executeQuery();
			if (rs.next()) {
				subject = new SubjectVO();
				subject.setIdx(rs.getInt("IDX"));
				subject.setName(rs.getString("NAME"));
				subject.setCategory1(rs.getString("CATEGORY1"));
				subject.setCategory2(rs.getString("CATEGORY2"));
				subject.setCategory3(rs.getString("CATEGORY3"));
				subject.setGrade(rs.getInt("GRADE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return subject;
	}

}
