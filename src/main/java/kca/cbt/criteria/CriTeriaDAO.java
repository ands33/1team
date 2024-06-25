package kca.cbt.criteria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class CriteriaDAO {
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<CriteriaVO> getAllCriteria() {
        String sql = "SELECT * FROM SUBJECT";
        return getCriteriaList(sql, null);
    }

    public List<CriteriaVO> searchCriteria(String courseName) {
        String sql = "SELECT * FROM SUBJECT WHERE NAME LIKE ?";
        return getCriteriaList(sql, "%" + courseName + "%");
    }

    private List<CriteriaVO> getCriteriaList(String sql, String param) {
        List<CriteriaVO> list = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            if (param != null) {
                stmt.setString(1, param);
            }
            try (ResultSet rs = stmt.executeQuery()) {
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
            }
        } catch (Exception e) {
            // 예외 처리 및 로깅
            e.printStackTrace();
            // 또는 로깅 프레임워크를 사용하여 예외를 로깅할 수 있습니다.
            // logger.error("An error occurred while fetching criteria data", e);
        }
        return list;
    }
}
