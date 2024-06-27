package kca.cbt.examplan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

import kca.cbt.subtrahend.SubtrahendVO;

//DAO(Data Access Object)
@Repository("examPlanDAO")
public class ExamPlanDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private PreparedStatement stmt1 = null;
	private ResultSet rs1 = null;

	private PreparedStatement stmt2 = null;
	private ResultSet rs2 = null;

	private final String EXAMPLAN_LIST = "select * from examplan where member_id=? and e_status != '제출(완료)' order by num";
	private final String SUBJECT_GET = "select * from subject where idx=?";
	private final String UPDATE_STATUS = "update examplan set e_status=? where num=?";
	private final String SUBTRAHEND_LIST = "select * from examplan where e_status='제출(검토대기)' AND submember_id=? order by num";
	private final String REVIEW_GET = "select review from test where num=?";
	private final String COM_EXAMPLAN_LIST = "select * from examplan where member_id=? and e_status = '제출(완료)' order by num";
	private final String BINARY_LIST = "select * from examplan where member_id=? or submember_id=? order by member_id, idx";
	private final String BINARY_TEST = "select exam_type, behavioral, answer, reference, review from test where num=?";
	private final String PREBINARY_LIST = "select * from test where idx IN (select idx from subject where subject_code IN (select subject_code from member where member_id=?) and e_status='제출(완료)')";
	private final String INSERT_EXAM_LIST = "select * from test where idx IN (select idx from subject where subject_code IN (select subject_code from member where member_id=?) and e_status='제출(완료)')";

	// 글 목록 조회
	public List<ExamPlanVO> getExamPlanList(ExamPlanVO vo) {
		List<ExamPlanVO> examPlanList = new ArrayList<ExamPlanVO>();
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

				ExamPlanVO examPlan = new ExamPlanVO();
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

	public List<ExamPlanVO> getComExamPlanList(ExamPlanVO vo) {
		List<ExamPlanVO> comExamPlanList = new ArrayList<ExamPlanVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COM_EXAMPLAN_LIST);
			stmt.setString(1, vo.getMember_id());
			rs = stmt.executeQuery();
			while (rs.next()) {

				stmt1 = conn.prepareStatement(SUBJECT_GET);
				stmt1.setInt(1, rs.getInt("IDX"));
				rs1 = stmt1.executeQuery();

				stmt2 = conn.prepareStatement(REVIEW_GET);
				stmt2.setInt(1, rs.getInt("NUM"));
				rs2 = stmt2.executeQuery();

				ExamPlanVO comExamPlan = new ExamPlanVO();
				comExamPlan.setNum(rs.getInt("NUM"));
				comExamPlan.setDiff(rs.getString("DIFF"));
				comExamPlan.setMember_name(rs.getString("MEMBER_NAME"));
				comExamPlan.setMember_id(rs.getString("MEMBER_ID"));
				comExamPlan.setIdx(rs.getInt("IDX"));
				comExamPlan.setE_status(rs.getString("E_STATUS"));
				if (rs1.next()) {
					comExamPlan.setName(rs1.getString("NAME"));
					comExamPlan.setCategory1(rs1.getString("CATEGORY1"));
					comExamPlan.setCategory2(rs1.getString("CATEGORY2"));
					comExamPlan.setCategory3(rs1.getString("CATEGORY3"));
				}
				if (rs2.next()) {
					comExamPlan.setReview(rs2.getString("REVIEW"));
				}
				comExamPlanList.add(comExamPlan);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs2, stmt2, conn);
			JDBCUtil.close(rs1, stmt1, conn);
			JDBCUtil.close(rs, stmt, conn);
		}
		return comExamPlanList;
	}

	// 상태 수정
	public void updateStatus(ExamPlanVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(UPDATE_STATUS);
			stmt.setString(1, vo.getE_status());
			stmt.setInt(2, vo.getNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public List<ExamPlanVO> getSubtrahendList(ExamPlanVO vo) {
		List<ExamPlanVO> subtrahendList = new ArrayList<ExamPlanVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(SUBTRAHEND_LIST);
			stmt.setString(1, vo.getMember_id());
			rs = stmt.executeQuery();
			while (rs.next()) {

				stmt1 = conn.prepareStatement(SUBJECT_GET);
				stmt1.setInt(1, rs.getInt("IDX"));
				rs1 = stmt1.executeQuery();

				ExamPlanVO subtrahend = new ExamPlanVO();
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
	public List<ExamPlanVO> getBinaryClass(ExamPlanVO vo) {
		System.out.println("getBinaryClass 실행");
		List<ExamPlanVO> binaryClassList = new ArrayList<ExamPlanVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BINARY_LIST);
			System.out.println(vo.getMember_id());
			stmt.setString(1, vo.getMember_id());
			stmt.setString(2, vo.getMember_id());
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
					// select exam_type, behavioral, answer, reference from test where num=?
					binaryClass.setExam_type(rs2.getString("EXAM_TYPE"));
					binaryClass.setBehavioral(rs2.getString("BEHAVIORAL"));
					binaryClass.setAnswer(rs2.getInt("ANSWER"));
					binaryClass.setReference(rs2.getString("REFERENCE"));
					binaryClass.setReview(rs2.getString("REVIEW"));
				}
				System.out.println(binaryClass);
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

	// 선제 이원분류표 조회
	public List<ExamPlanVO> getPreBinaryClass(ExamPlanVO vo) {
		System.out.println("getPreBinaryClass 실행");
		List<ExamPlanVO> preBinaryClassList = new ArrayList<ExamPlanVO>();
		try {
			conn = JDBCUtil.getConnection();
			// "select * from test where idx IN (select idx from subject where
			// subject_code=?)";
			stmt = conn.prepareStatement(PREBINARY_LIST);
			System.out.println(vo.getMember_id());
			stmt.setString(1, vo.getMember_id());
			rs = stmt.executeQuery();
			while (rs.next()) {

				stmt1 = conn.prepareStatement(SUBJECT_GET);
				stmt1.setInt(1, rs.getInt("IDX"));
				rs1 = stmt1.executeQuery();

				ExamPlanVO PrebinaryClass = new ExamPlanVO();
				PrebinaryClass.setNum(rs.getInt("NUM"));
				PrebinaryClass.setT_num(rs.getInt("T_NUM"));
				PrebinaryClass.setAnswer(rs.getInt("ANSWER"));
				PrebinaryClass.setReference(rs.getString("REFERENCE"));
				PrebinaryClass.setMember_name(rs.getString("WRITTENNAME"));
				PrebinaryClass.setSubmember_name(rs.getString("REVIEWER"));
				PrebinaryClass.setE_status(rs.getString("E_STATUS"));
				PrebinaryClass.setExam_type(rs.getString("EXAM_TYPE"));
				PrebinaryClass.setDiff(rs.getString("DIFF"));
				PrebinaryClass.setBehavioral(rs.getString("BEHAVIORAL"));
				PrebinaryClass.setReview(rs.getString("REVIEW"));
				if (rs1.next()) {
					PrebinaryClass.setName(rs1.getString("NAME"));
					PrebinaryClass.setCategory1(rs1.getString("CATEGORY1"));
					PrebinaryClass.setCategory2(rs1.getString("CATEGORY2"));
					PrebinaryClass.setCategory3(rs1.getString("CATEGORY3"));
				}
				System.out.println(PrebinaryClass);
				preBinaryClassList.add(PrebinaryClass);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs1, stmt1, conn);
			JDBCUtil.close(rs, stmt, conn);
		}
		return preBinaryClassList;
	}

	// 선제 이원분류표 조회
		public List<ExamPlanVO> getInsertExamList(ExamPlanVO vo) {
			System.out.println("getInsertExamList 실행");
			List<ExamPlanVO> insertExamList = new ArrayList<ExamPlanVO>();
			try {
				conn = JDBCUtil.getConnection();
				// "select * from test where idx IN (select idx from subject where
				// subject_code=?)";
				stmt = conn.prepareStatement(INSERT_EXAM_LIST);
				System.out.println(vo.getMember_id());
				stmt.setString(1, vo.getMember_id());
				rs = stmt.executeQuery();
				while (rs.next()) {

					stmt1 = conn.prepareStatement(SUBJECT_GET);
					stmt1.setInt(1, rs.getInt("IDX"));
					rs1 = stmt1.executeQuery();

					ExamPlanVO insertExam = new ExamPlanVO();
					insertExam.setNum(rs.getInt("NUM"));
					insertExam.setT_num(rs.getInt("T_NUM"));
					insertExam.setDiff(rs.getString("DIFF"));
					insertExam.setQuestion(rs.getString("QUESTION"));
					insertExam.setBehavioral(rs.getString("BEHAVIORAL"));
					insertExam.setMember_name(rs.getString("WRITTENNAME"));
					insertExam.setAnswer(rs.getInt("ANSWER"));
					insertExam.setReview(rs.getString("REVIEW"));

					if (rs1.next()) {
						insertExam.setName(rs1.getString("NAME"));
						insertExam.setCategory1(rs1.getString("CATEGORY1"));
						insertExam.setCategory2(rs1.getString("CATEGORY2"));
						insertExam.setCategory3(rs1.getString("CATEGORY3"));
					}
					insertExamList.add(insertExam);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs1, stmt1, conn);
				JDBCUtil.close(rs, stmt, conn);
			}
			return insertExamList;
		}

}