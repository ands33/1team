package kca.cbt.examDoc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.springbook.biz.common.JDBCUtil;

public class examDocDAO {
	
		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;

		//private final String EXAMDOC_GET = "select * from examplan where num=? and diff=? and member_name=? and member_id=? and idx=? and status=?";
		private final String EXAMDOC_LIST = "select * from examplan order by num";		
		//private final String EXAMDOCSUB_GET = "select * from subject where idx=?";
		//private final String EXAMDOCMEM_GET = "select * from member where member_name=? and member_type";
	    private final String EXAMDOCSUB_GET = "select category1, category2, category3 from subject where idx=?";
		
		public List<examDocVO> getExamDocList(examDocVO vo) {
		    System.out.println("===> JDBC로 getexamDocList() 기능 처리");
		    List<examDocVO> ExamDocList = new ArrayList<examDocVO>();
		    try {
		        conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(EXAMDOC_LIST);
		        rs = stmt.executeQuery();
		        while (rs.next()) {
		            examDocVO examdoc = new examDocVO();
		            examdoc.setNum(rs.getInt("NUM"));
					examdoc.setDiff(rs.getString("DIFF"));
					examdoc.setMemeber_name(rs.getString("MEMBER_NAME"));
					examdoc.setIdx(rs.getInt("IDX"));
					examdoc.setStatus(rs.getString("STATUS"));
		            
					// Subject 테이블에서 category1, category2, category3 가져오기
	                PreparedStatement subStmt = conn.prepareStatement(EXAMDOCSUB_GET);
	                subStmt.setInt(1, examdoc.getIdx());
	                ResultSet subRs = subStmt.executeQuery();
	                if (subRs.next()) {
	                    examdoc.setCategory1(subRs.getString("CATEGORY1"));
	                    examdoc.setCategory2(subRs.getString("CATEGORY2"));
	                    examdoc.setCategory3(subRs.getString("CATEGORY3"));
	                }
	                subRs.close();
	                subStmt.close();
					
					ExamDocList.add(examdoc);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        JDBCUtil.close(rs, stmt, conn);
		    }
		    return ExamDocList;
		}
}

/*
public examDocVO getExamDoc(examDocVO vo) {
	System.out.println("===> JDBC로 getExamDoc() 기능 처리");
	examDocVO examdoc = null;
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(EXAMDOC_GET);
		stmt.setInt(1, vo.getNum());
		stmt.setString(2, vo.getDiff());
		stmt.setString(3, vo.getMemeber_name());
		stmt.setInt(4, vo.getIdx());
		stmt.setString(5, vo.getStatus());
		rs = stmt.executeQuery();
		
		if (rs.next()) {
			examdoc = new examDocVO();
			examdoc.setNum(rs.getInt("NUM"));
			examdoc.setDiff(rs.getString("DIFF"));
			examdoc.setMemeber_name(rs.getString("MEMBER_NAME"));
			examdoc.setIdx(rs.getInt("IDX"));
			examdoc.setStatus(rs.getString("STATUS"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JDBCUtil.close(rs, stmt, conn);
	}
	return examdoc;
}*/
