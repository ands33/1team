package kca.cbt.exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;

//DAO(Data Access Object)
@Repository("testDAO")
public class TestDAO {

	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private final String TEST_LIST = "select * from test order by test_num desc";

	// 글 목록 조회
	public List<TestVO> getTestList(TestVO vo) {
		System.out.println("===> JDBC로 getTestList() 기능 처리");
		List<TestVO> testList = new ArrayList<TestVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEST_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				TestVO test = new TestVO();
				test.setSubject(rs.getString("SUBJECT"));
				test.setTest_type(rs.getString("TEST_TYPE"));
				test.setStatus(rs.getString("STATUS"));
				test.setRequestDate(rs.getDate("REQUESTDATE"));
				test.setComRequestDate(rs.getDate("COMREQUESTDATE"));
				test.setCurSituation(rs.getInt("CURSITUATION"));
				test.setPledge(rs.getInt("PLEDGE"));
				test.setReqLetter(rs.getInt("REQLETTER"));
				testList.add(test);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return testList;
	}

}
