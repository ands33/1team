package kca.cbt.criteria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import kca.cbt.JDBCUtil;

public class CriteriaDAO {
    // JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL 명령어들
    private final String CRITERIA_GET_ALL = "SELECT * FROM SUBJECT";
    private final String CRITERIA_SEARCH = "SELECT * FROM SUBJECT WHERE NAME LIKE ?";

    // 모든 기준 가져오기
    public List<CriteriaVO> getAllCriteria() {
        List<CriteriaVO> list = new ArrayList<>();
        try {
            System.out.println("===> JDBC로 getAllCriteria() 기능 처리");
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(CRITERIA_GET_ALL);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                CriteriaVO vo = new CriteriaVO();
                vo.setId(rs.getInt("ID"));
                vo.setName(rs.getString("NAME"));
                vo.setCategory1(rs.getString("CATEGORY1"));
                vo.setCategory2(rs.getString("CATEGORY2"));
                vo.setCategory3(rs.getString("CATEGORY3"));
                vo.setGrade(rs.getInt("GRADE"));
                list.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return list;
    }

    // 특정 기준 검색
    public List<CriteriaVO> searchCriteria(String name) {
        List<CriteriaVO> list = new ArrayList<>();
        try {
            System.out.println("===> JDBC로 searchCriteria() 기능 처리");
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(CRITERIA_SEARCH);
            stmt.setString(1, "%" + name + "%");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                CriteriaVO vo = new CriteriaVO();
                vo.setId(rs.getInt("ID"));
                vo.setName(rs.getString("NAME"));
                vo.setCategory1(rs.getString("CATEGORY1"));
                vo.setCategory2(rs.getString("CATEGORY2"));
                vo.setCategory3(rs.getString("CATEGORY3"));
                vo.setGrade(rs.getInt("GRADE"));
                list.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return list;
    }
}
