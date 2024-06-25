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
	
	public List<examDocVO> getExamDocSub(examDocVO vo) {
		System.out.println("===> JDBC로 getexamDocSub() 기능 처리");
		List<examDocVO> ExamDocSub = new ArrayList<examDocVO>();
	    Map<String, Integer> rowspanMapC1 = new HashMap<>();
        Map<String, Integer> rowspanMapC2 = new HashMap<>();

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EXAMDOCSUB_GET);
			rs = stmt.executeQuery();
			
			int prevIdx = -1; // 이전 idx 값을 저장하기 위한 변수
	        examDocVO prevExamdocsub = null; // 이전 examDocVO 객체 저장하기 위한 변수
	        
			while (rs.next()) {
				examDocVO examdocsub = new examDocVO();
				examdocsub.setNum(rs.getInt("IDX"));
				examdocsub.setName(rs.getString("NAME"));
				examdocsub.setCategory1(rs.getString("CATEGORY1"));
				examdocsub.setCategory2(rs.getString("CATEGORY2"));
				examdocsub.setCategory3(rs.getString("CATEGORY3"));
				
				// Calculate rowspan
	            String c1Value = examdocsub.getCategory1();
	            if (rowspanMapC1.containsKey(c1Value)) {
	                int count = rowspanMapC1.get(c1Value);
	                rowspanMapC1.put(c1Value, count + 1);
	            } else {
	                rowspanMapC1.put(c1Value, 1);
	            }
	            
	         // Calculate rowspan
	            String c2Value = examdocsub.getCategory2();
	            if (rowspanMapC2.containsKey(c2Value)) {
	                int count = rowspanMapC2.get(c2Value);
	                rowspanMapC2.put(c2Value, count + 1);
	            } else {
	                rowspanMapC2.put(c2Value, 1);
	            }
	            
	         // Check if we should merge rows based on conditions
	            if (prevExamdocsub != null && prevExamdocsub.getCategory1().equals(examdocsub.getCategory1())) {
	                // Check idx continuity condition (difference should be 1)
	                if (examdocsub.getNum() - prevExamdocsub.getNum() == 1) {
	                    prevExamdocsub.setRowspanC1(prevExamdocsub.getRowspanC1() + 1);
	                    prevExamdocsub.setRowspanC2(prevExamdocsub.getRowspanC2() + 1);
	                    continue; // Skip adding the current examdocsub to list
	                }
	            }
	            
	            ExamDocSub.add(examdocsub);
	            prevExamdocsub = examdocsub;

			}
			
			// Set rowspan value for each testVO
	        for (examDocVO examdocsub : ExamDocSub) {
	            examdocsub.setRowspanC1(rowspanMapC1.get(examdocsub.getCategory1()));
	            examdocsub.setRowspanC2(rowspanMapC2.get(examdocsub.getCategory2()));

	            // Only the first occurrence should have the actual rowspan value
	            rowspanMapC1.put(examdocsub.getCategory1(), 0);
                rowspanMapC2.put(examdocsub.getCategory2(), 0);

	        }
	        
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ExamDocSub;
	}
}

/*package kca.cbt.examDoc;

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

	private final String EXAMDOC_LIST = "SELECT examplan.num, subject.name, subject.category1, subject.category2, subject.category3, examplan.diff, examplan.e_status, examplan.member_name, examplan.member_id, member.member_type FROM examplan INNER JOIN subject ON examplan.idx = subject.idx INNER JOIN member ON examplan.member_name = member.member_name order by examplan.idx ASC";
		
	public List<examDocVO> getExamDocList(examDocVO vo) {
		System.out.println("===> JDBC로 getexamDocList() 기능 처리");
		List<examDocVO> ExamDocList = new ArrayList<examDocVO>();
	    Map<String, Integer> rowspanMapC1 = new HashMap<>();
        Map<String, Integer> rowspanMapC2 = new HashMap<>();

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
				examdoc.setMember_type(rs.getString("member_type")); //
				
				// Calculate rowspan
	            String c1Value = examdoc.getCategory1();
	            if (rowspanMapC1.containsKey(c1Value)) {
	                int count = rowspanMapC1.get(c1Value);
	                rowspanMapC1.put(c1Value, count + 1);
	            } else {
	                rowspanMapC1.put(c1Value, 1);
	            }
	            
	         // Calculate rowspan
	            String c2Value = examdoc.getCategory2();
	            if (rowspanMapC2.containsKey(c2Value)) {
	                int count = rowspanMapC2.get(c2Value);
	                rowspanMapC2.put(c2Value, count + 1);
	            } else {
	                rowspanMapC2.put(c2Value, 1);
	            }
	            
	            ExamDocList.add(examdoc);
			}
			
			// Set rowspan value for each testVO
	        for (examDocVO examdoc : ExamDocList) {
	            examdoc.setRowspanC1(rowspanMapC1.get(examdoc.getCategory1()));
	            examdoc.setRowspanC2(rowspanMapC2.get(examdoc.getCategory2()));

	            // Only the first occurrence should have the actual rowspan value
	            rowspanMapC1.put(examdoc.getCategory1(), 0);
                rowspanMapC2.put(examdoc.getCategory2(), 0);

	        }
	        
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ExamDocList;
	}

	// A,B위원 이름 그룹화 하고 하나로 나타내기
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
}*/