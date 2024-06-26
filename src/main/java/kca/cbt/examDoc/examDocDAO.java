package kca.cbt.examDoc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

@Repository
public class examDocDAO {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private final String EXAMDOCSUB_GET = "SELECT * FROM SUBJECT";
	private final String EXAMDOCSUB_GROUP_GET = "SELECT name FROM subject GROUP BY name ORDER BY MIN(idx)";
	
	public List<examDocVO> getExamDocSub(examDocVO vo) {
		System.out.println("===> JDBC로 getexamDocSub() 기능 처리");
		List<examDocVO> ExamDocSub = new ArrayList<examDocVO>();

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EXAMDOCSUB_GET);
			rs = stmt.executeQuery();
				        
			while (rs.next()) {
				examDocVO examdocsub = new examDocVO();
				examdocsub.setNum(rs.getInt("IDX"));
				examdocsub.setName(rs.getString("NAME"));
				examdocsub.setCategory1(rs.getString("CATEGORY1"));
				examdocsub.setCategory2(rs.getString("CATEGORY2"));
				examdocsub.setCategory3(rs.getString("CATEGORY3"));
				examdocsub.setSubject_code(rs.getString("SUBJECT_CODE"));
	            ExamDocSub.add(examdocsub);

			}
	        
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ExamDocSub;
	}
	
	public List<examDocVO> getExamDocSubGroup(examDocVO vo) {
		System.out.println("===> JDBC로 getexamDocSubGroup() 기능 처리");
		List<examDocVO> ExamDocSub_Group = new ArrayList<examDocVO>();

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EXAMDOCSUB_GROUP_GET);
			rs = stmt.executeQuery();
				        
			while (rs.next()) {
				examDocVO examdocsub_group = new examDocVO();
				examdocsub_group.setName(rs.getString("NAME"));
	            ExamDocSub_Group.add(examdocsub_group);
			}
	        
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ExamDocSub_Group;
	}
}