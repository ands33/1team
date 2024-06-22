package kca.cbt.subtrahend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

@Repository("subtrahendDAO")
public class SubtrahendDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private PreparedStatement stmt1 = null;
	private ResultSet rs1 = null;

	private final String SUBTRAHEND_LIST = "select * from examplan where e_status='제출(감수대기)' order by num";
	private final String SUBJECT_GET = "select * from subject where idx=?";
	
	// 글 목록 조회
		public List<SubtrahendVO> getSubtrahendList(SubtrahendVO vo) {
			List<SubtrahendVO> subtrahendList = new ArrayList<SubtrahendVO>();
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(SUBTRAHEND_LIST);
				rs = stmt.executeQuery();
				while (rs.next()) {

					stmt1 = conn.prepareStatement(SUBJECT_GET);
					stmt1.setInt(1, rs.getInt("IDX"));
					rs1 = stmt1.executeQuery();

					SubtrahendVO subtrahend = new SubtrahendVO();
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

}
