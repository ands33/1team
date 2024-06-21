package kca.cbt.criteria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CriTeriaDAO {
    private static final String URL = "jdbc:oracle:thin:@YOUR_DB_HOST:1521:YOUR_DB_SID";
    private static final String USER = "YOUR_DB_USER";
    private static final String PASSWORD = "YOUR_DB_PASSWORD";

    public List<CriTeriaVO> getAllCriteria() {
        List<CriTeriaVO> list = new ArrayList<>();
        String sql = "SELECT * FROM SUBJECT";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CriTeriaVO vo = new CriTeriaVO();
                vo.setId(rs.getInt("IDX"));
                vo.setName(rs.getString("NAME"));
                vo.setCategory1(rs.getString("CATEGORY1"));
                vo.setCategory2(rs.getString("CATEGORY2"));
                vo.setCategory3(rs.getString("CATEGORY3"));
                vo.setGrade(rs.getInt("GRADE"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CriTeriaVO> searchCriteria(String subject, String category) {
        List<CriTeriaVO> list = new ArrayList<>();
        String sql = "SELECT * FROM SUBJECT WHERE NAME LIKE ? AND CATEGORY1 LIKE ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + subject + "%");
            stmt.setString(2, "%" + category + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CriTeriaVO vo = new CriTeriaVO();
                    vo.setId(rs.getInt("IDX"));
                    vo.setName(rs.getString("NAME"));
                    vo.setCategory1(rs.getString("CATEGORY1"));
                    vo.setCategory2(rs.getString("CATEGORY2"));
                    vo.setCategory3(rs.getString("CATEGORY3"));
                    vo.setGrade(rs.getInt("GRADE"));
                    list.add(vo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
