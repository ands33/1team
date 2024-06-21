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

@Repository("examdocDAO")
public class examDocDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String EXAMDOC_LIST = "SELECT examplan.num, subject.name, subject.category1, subject.category2, subject.category3, examplan.diff, examplan.e_status, examplan.member_name, examplan.member_id, member.member_type FROM examplan INNER JOIN subject ON examplan.idx = subject.idx INNER JOIN member ON examplan.member_name = member.member_name";
	
	public List<examDocVO> getExamDocList(examDocVO vo) {
	    System.out.println("===> JDBC로 getexamDocList() 기능 처리");
	    List<examDocVO> ExamDocList = new ArrayList<examDocVO>();
	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(EXAMDOC_LIST);
	        rs = stmt.executeQuery();
	        while (rs.next()) {
	            examDocVO examdoc = new examDocVO();
	            examdoc.setNum(rs.getInt("num"));
	            examdoc.setName(rs.getString("name"));
	            examdoc.setCategory1(rs.getString("category1"));
	            examdoc.setCategory2(rs.getString("category2"));
	            examdoc.setCategory3(rs.getString("category3"));
	            examdoc.setDiff(rs.getString("diff"));
	            examdoc.setE_status(rs.getString("e_status"));
	            examdoc.setMember_name(rs.getString("member_name"));
	            examdoc.setMember_id(rs.getString("member_id"));
	            examdoc.setMember_type(rs.getString("member_type"));
	            //examdoc.setIdx(rs.getInt("idx"));
	            ExamDocList.add(examdoc);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, stmt, conn);
	    }
	    return ExamDocList;
	}
	
	public Map<String, String> getExamDocMemberNames() {
	    System.out.println("===> JDBC로 getExamDocMemberNames() 기능 처리");
	    Map<String, String> memberNames = new HashMap<>();
	    
	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(EXAMDOC_LIST);
	        rs = stmt.executeQuery();
	        
	        while (rs.next()) {
	            String memberType = rs.getString("member_type");
	            String memberName = rs.getString("member_name");
	            
	            if ("A".equals(memberType) && !memberNames.containsKey("A")) {
	                memberNames.put("A", memberName);
	            } else if ("B".equals(memberType) && !memberNames.containsKey("B")) {
	                memberNames.put("B", memberName);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, stmt, conn);
	    }
	    
	    return memberNames;
	}
}
/*
package kca.cbt.examDoc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.springbook.biz.common.JDBCUtil;

@Repository("examdocDAO")
public class examDocDAO {
	
		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
	
		private final String EXAMDOC_LIST = "select examplan.num, subject.name, subject.category1, subject.category2, subject.category3, examplan.diff,examplan.e_status, examplan.member_name,examplan.member_id,member.member_type from examplan inner join subject on examplan.idx = subject.idx inner join member on examplan.member_name = member.member_name";
		
		public List<examDocVO> getExamDocList(examDocVO vo) {
		    System.out.println("===> JDBC로 getexamDocList() 기능 처리");
		    List<examDocVO> ExamDocList = new ArrayList<examDocVO>();
		    try {
		        conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(EXAMDOC_LIST);
		        rs = stmt.executeQuery();
		        if (rs.next()) {
		            examDocVO examdoc = new examDocVO();
		            examdoc.setNum(rs.getInt("NUM"));
		            examdoc.setName(rs.getString("NAME"));
		            examdoc.setCategory1(rs.getString("CATEGORY1"));
		            examdoc.setCategory2(rs.getString("CATEGORY2"));
		            examdoc.setCategory3(rs.getString("CATEGORY3"));
					examdoc.setDiff(rs.getString("DIFF"));
					examdoc.setE_status(rs.getString("E_STATUS"));
					examdoc.setMember_name(rs.getString("MEMBER_NAME"));
					examdoc.setMember_id(rs.getString("MEMBER_ID"));
					examdoc.setMember_type(rs.getString("MEMBER_TYPE"));
					examdoc.setIdx(rs.getInt("IDX"));
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
*/
//private final String EXAMDOC_GET = "select * from examplan where num=? and diff=? and member_name=? and member_id=? and idx=? and status=?";
		//private final String EXAMDOC_LIST = "select * from examplan order by num";//num에 해당하는 값 모두 가져옴	
		//private final String EXAMDOCSUB_GET = "select * from subject where idx=?";
		//private final String EXAMDOCMEM_GET = "select * from member where member_name=? and member_type";
	    //private final String EXAMDOCSUB_GET = "select subject.category1, subject.category2, subject.category3 from subject inner join examplan on subject.idx = examplan.idx;";

/*
public examDocVO getExamDoc(examDocVO vo) {
    System.out.println("===> JDBC로 getexamDoc() 기능 처리");
    examDocVO examdoc = null;
    try {
        conn = JDBCUtil.getConnection();
        System.out.println("DB Connection established");
		stmt = conn.prepareStatement(EXAMDOC_LIST);
        rs = stmt.executeQuery();
        if (rs.next()) {
        	examdoc = new examDocVO();
            examdoc.setNum(rs.getInt("NUM"));
            examdoc.setName(rs.getString("NAME"));
            examdoc.setCategory1(rs.getString("CATEGORY1"));
            examdoc.setCategory2(rs.getString("CATEGORY2"));
            examdoc.setCategory3(rs.getString("CATEGORY3"));
			examdoc.setDiff(rs.getString("DIFF"));
			examdoc.setE_status(rs.getString("E_STATUS"));
			examdoc.setMember_name(rs.getString("MEMBER_NAME"));
			examdoc.setMember_id(rs.getString("MEMBER_ID"));
			examdoc.setMember_type(rs.getString("MEMBER_TYPE"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        JDBCUtil.close(rs, stmt, conn);
    }
    return examdoc;
}
*/

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

/*
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
			examdoc.setMember_name(rs.getString("MEMBER_NAME"));
			examdoc.setMember_id(rs.getString("MEMBER_ID"));
			examdoc.setIdx(rs.getInt("IDX"));
			examdoc.setE_status(rs.getString("E_STATUS"));

			// Subject 테이블에서 category1, category2, category3 가져오기
            subStmt = conn.prepareStatement(EXAMDOCSUB_GET);
            //subStmt.setInt(1, examdoc.getIdx());
            subRs = subStmt.executeQuery();
            
            if (subRs.next()) {
            	System.out.println("category write~!!!");
                examdoc.setCategory1(subRs.getString("category1"));
                examdoc.setCategory2(subRs.getString("category2"));
                examdoc.setCategory3(subRs.getString("category3"));
            }
            subRs.close();
            subStmt.close();
			
			ExamDocList.add(examdoc);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    	JDBCUtil.close(subRs, subStmt, conn);
        JDBCUtil.close(rs, stmt, conn);
    }
    return ExamDocList;
}*/