package kca.cbt.waitingQ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

import kca.cbt.examplan.ExamPlanVO;

//DAO(Data Access Object)
@Repository("WaitingDAO")
public class WaitingDAO {
    // JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private PreparedStatement stmt1 = null;
    private ResultSet rs1 = null;
    
    private PreparedStatement stmt2 = null;
    private ResultSet rs2 = null;

    private final String SUBJECT_GET = "select * from subject where idx=?";
    private final String BINARY_LIST = "select * from examplan where member_id=? or submember_id=? order by idx";
    private final String BINARY_TEST = "select exam_type, behavioral, answer, reference from test where num=?";
    private final String SUBTRAHEND_LIST = "select * from examplan where e_status='제출(검토대기)' AND submember_id=? order by num";
    private final String EXAMPLAN_LIST = "select * from examplan where member_id=? and e_status != '제출(완료)' order by num"; 
    private final String REVIEW_GET = "select review from test where num=?";
    
 // 글 목록 조회
 	public List<WaitingVO> getWaitingExamPlanList(WaitingVO vo) {
 		List<WaitingVO> examPlanList = new ArrayList<WaitingVO>();
 		try {
 			conn = JDBCUtil.getConnection();
 			stmt = conn.prepareStatement(EXAMPLAN_LIST);
 			System.out.println(vo.getMember_id());
 			stmt.setString(1, vo.getMember_id());
 			rs = stmt.executeQuery();
 			while (rs.next()) {

 				stmt1 = conn.prepareStatement(SUBJECT_GET);
 				stmt1.setInt(1, rs.getInt("IDX"));
 				rs1 = stmt1.executeQuery();
 				
 				stmt2 = conn.prepareStatement(REVIEW_GET);
 				stmt2.setInt(1, rs.getInt("NUM"));
 				rs2 = stmt2.executeQuery();

 				WaitingVO examPlan = new WaitingVO();
 				examPlan.setNum(rs.getInt("NUM"));
 				examPlan.setDiff(rs.getString("DIFF"));
 				examPlan.setMember_name(rs.getString("MEMBER_NAME"));
 				examPlan.setMember_id(rs.getString("MEMBER_ID"));
 				examPlan.setIdx(rs.getInt("IDX"));
 				examPlan.setE_status(rs.getString("E_STATUS"));
 				if (rs1.next()) {
 					examPlan.setName(rs1.getString("NAME"));
 					examPlan.setCategory1(rs1.getString("CATEGORY1"));
 					examPlan.setCategory2(rs1.getString("CATEGORY2"));
 					examPlan.setCategory3(rs1.getString("CATEGORY3"));
 				}
 				if (rs2.next()) {
 				examPlan.setReview(rs2.getString("REVIEW"));
 				}
 				examPlanList.add(examPlan);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			JDBCUtil.close(rs2, stmt2, conn);
 			JDBCUtil.close(rs1, stmt1, conn);
 			JDBCUtil.close(rs, stmt, conn);
 		}
 		return examPlanList;
 	}
    
    // 감수
    public List<WaitingVO> getWaitingSubtrahendList(WaitingVO vo) {
		List<WaitingVO> subtrahendList = new ArrayList<WaitingVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(SUBTRAHEND_LIST);
			stmt.setString(1, vo.getMember_id());
			rs = stmt.executeQuery();
			while (rs.next()) {

				stmt1 = conn.prepareStatement(SUBJECT_GET);
				stmt1.setInt(1, rs.getInt("IDX"));
				rs1 = stmt1.executeQuery();

				WaitingVO subtrahend = new WaitingVO();
				subtrahend.setNum(rs.getInt("NUM"));
				subtrahend.setDiff(rs.getString("DIFF"));
				subtrahend.setMember_name(rs.getString("MEMBER_NAME"));
				subtrahend.setMember_id(rs.getString("MEMBER_ID"));
				subtrahend.setIdx(rs.getInt("IDX"));
				subtrahend.setE_status(rs.getString("E_STATUS"));
				if (rs1.next()) {
					subtrahend.setName(rs1.getString("NAME"));
					subtrahend.setCategory1(rs1.getString("CATEGORY1"));
					subtrahend.setCategory2(rs1.getString("CATEGORY2"));
					subtrahend.setCategory3(rs1.getString("CATEGORY3"));
				}

				subtrahendList.add(subtrahend);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs1, stmt1, conn);
			JDBCUtil.close(rs, stmt, conn);
		}
		return subtrahendList;
	}
    
    // 이원분류표 조회
    public List<ExamPlanVO> getBinaryClass(ExamPlanVO vo, String memberId) {
        System.out.println("getBinaryClass 실행");
        List<ExamPlanVO> binaryClassList = new ArrayList<ExamPlanVO>();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BINARY_LIST);
            stmt.setString(1, memberId);
            stmt.setString(2, memberId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                stmt1 = conn.prepareStatement(SUBJECT_GET);
                stmt1.setInt(1, rs.getInt("IDX"));
                rs1 = stmt1.executeQuery();
                
                stmt2 = conn.prepareStatement(BINARY_TEST);
                stmt2.setInt(1, rs.getInt("NUM"));
                rs2 = stmt2.executeQuery();

                ExamPlanVO binaryClass = new ExamPlanVO();
                binaryClass.setNum(rs.getInt("NUM"));
                binaryClass.setDiff(rs.getString("DIFF"));
                binaryClass.setMember_name(rs.getString("MEMBER_NAME"));
                binaryClass.setMember_id(rs.getString("MEMBER_ID"));
                binaryClass.setIdx(rs.getInt("IDX"));
                binaryClass.setE_status(rs.getString("E_STATUS"));
                binaryClass.setSubmember_name(rs.getString("SUBMEMBER_NAME"));
                binaryClass.setSubmember_id(rs.getString("SUBMEMBER_ID"));
                if (rs1.next()) {
                    binaryClass.setName(rs1.getString("NAME"));
                    binaryClass.setCategory1(rs1.getString("CATEGORY1"));
                    binaryClass.setCategory2(rs1.getString("CATEGORY2"));
                    binaryClass.setCategory3(rs1.getString("CATEGORY3"));
                }
                if (rs2.next()) {
                    binaryClass.setExam_type(rs2.getString("EXAM_TYPE"));
                    binaryClass.setBehavioral(rs2.getString("BEHAVIORAL"));
                    binaryClass.setAnswer(rs2.getInt("ANSWER"));
                }
                binaryClassList.add(binaryClass);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs2, stmt2, conn);
            JDBCUtil.close(rs1, stmt1, conn);
            JDBCUtil.close(rs, stmt, conn);
        }
        return binaryClassList;
    }
}
