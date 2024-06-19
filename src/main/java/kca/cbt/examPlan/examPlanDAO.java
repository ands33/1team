package kca.cbt.examPlan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kca.cbt.JDBCUtil;

public class examPlanDAO {
	// JDBC 관련 변수
		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		
		private final String EXAMPLAN_GET = "select * from examplan where num=? and diff=? and member_name=? and memeber_id=? and idx=? and status=?";
		private final String EXAMPLAN_LIST = "select * from examplan order by num desc";
	
	    public examPlanVO getExamplan(examPlanVO vo) {
	        examPlanVO examplan = null;
	    	try {
	    		conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(EXAMPLAN_GET);
				stmt.setInt(1, vo.getNum());
				stmt.setString(2, vo.getDiff());
				stmt.setString(3, vo.getMember_name());
				stmt.setString(4, vo.getMember_id());
				stmt.setInt(5, vo.getIdx());
				stmt.setString(6, vo.getStatus());
				rs = stmt.executeQuery();
				
				if (rs.next()) {
					// ResultSet에서 회원 정보를 가져와서 examplan 객체에 저장
					examplan = new examPlanVO();
					examplan.setNum(rs.getInt("NUM"));
					examplan.setDiff(rs.getString("DIFF"));
					examplan.setMember_name(rs.getString("MEMBER_NAME"));
					examplan.setMember_id(rs.getString("MEMBER_ID"));
					examplan.setIdx(rs.getInt("IDX"));
					examplan.setStatus(rs.getString("STATUS"));
			        }
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}finally {
	    		// 리소스 해제 (Connection, PreparedStatement, ResultSet)
				JDBCUtil.close(rs, stmt, conn);
				// close 메서드는 연결 해제를 처리하는 유틸리티 메서드
	    	}
			return examplan;
	    }
		
		public List<examPlanVO> getexamPlanList(examPlanVO vo) {
		    System.out.println("===> JDBC로 getexamPlanList() 기능 처리");
		    List<examPlanVO> examplanList = new ArrayList<examPlanVO>();
		    try {
		        conn = JDBCUtil.getConnection();
		        
		        // vo가 null인지 체크
		        if (vo == null) {
		        	System.out.println("@@@@@@@@@@list실행@@@@@@");
		            stmt = conn.prepareStatement(EXAMPLAN_LIST);
		        } else {
		            // vo가 null이 아니면 검색 조건에 따라 처리
		            if ("TITLE".equals(vo.getSearchCondition())) {
		            	System.out.println("@@@@tList@@@@@");
		                stmt = conn.prepareStatement(EXAMPLAN_LIST);
//		                stmt.setString(1, vo.getSearchKeyword());
		            } else if ("CONTENT".equals(vo.getSearchCondition())) {
		            	System.out.println("@@@@cList@@@@@");
		                stmt = conn.prepareStatement(BOARD_cLIST);
		                stmt.setString(1, vo.getSearchKeyword());
		            } else {
		                stmt = conn.prepareStatement(EXAMPLAN_LIST);
		            }
		        }

		        rs = stmt.executeQuery();
		        while (rs.next()) {
		            examPlanVO examplan = new examPlanVO();
		            examplan.setNum(rs.getInt("NUM"));
					examplan.setDiff(rs.getString("DIFF"));
					examplan.setMember_name(rs.getString("MEMBER_NAME"));
					examplan.setMember_id(rs.getString("MEMBER_ID"));
					examplan.setIdx(rs.getInt("IDX"));
					examplan.setStatus(rs.getString("STATUS"));
					examplanList.add(examplan);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        JDBCUtil.close(rs, stmt, conn);
		    }
		    return examplanList;
		}
}
