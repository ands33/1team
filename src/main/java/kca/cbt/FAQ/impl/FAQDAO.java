package kca.cbt.FAQ.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kca.cbt.FAQ.FAQVO;

@Repository
public class FAQDAO {

    @Autowired
    private DataSource dataSource; // 데이터베이스 연결을 위한 DataSource

    // FAQ 목록 조회
    public List<FAQVO> getFAQList() {
        List<FAQVO> faqList = new ArrayList<>();
        String sql = "SELECT Q, SEQ_NUMBER, FILE_DATA, TITLE, CREATE_DAY, MEMBER_ID, ANSWER_ID, CONTENT_ID, VIEWS FROM FAQ_TABLE";

        try (
            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
        ) {
            while (rs.next()) {
                FAQVO faq = new FAQVO();
                faq.setQ(rs.getString("Q"));
                faq.setSEQ_NUMBER(rs.getInt("SEQ_NUMBER"));
                faq.setFILE_DATA(rs.getString("FILE_DATA"));
                faq.setTITLE(rs.getString("TITLE"));
                faq.setCREATE_DAY(rs.getDate("CREATE_DAY"));
                faq.setMEMBER_ID(rs.getString("MEMBER_ID"));
                faq.setANSWER_ID(rs.getString("ANSWER_ID"));
                faq.setCONTENT_ID(rs.getString("CONTENT_ID"));
                faq.setVIEWS(rs.getString("VIEWS"));
                faqList.add(faq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return faqList;
    }

    // FAQ 항목 추가
    public void insertFAQ(FAQVO faq) {
        String sql = "INSERT INTO FAQ_TABLE (Q, SEQ_NUMBER, FILE_DATA, TITLE, CREATE_DAY, MEMBER_ID, ANSWER_ID, CONTENT_ID, VIEWS) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, faq.getQ());
            pstmt.setInt(2, faq.getSEQ_NUMBER());
            pstmt.setString(3, faq.getFILE_DATA());
            pstmt.setString(4, faq.getTITLE());
            pstmt.setDate(5, faq.getCREATE_DAY());
            pstmt.setString(6, faq.getMEMBER_ID());
            pstmt.setString(7, faq.getANSWER_ID());
            pstmt.setString(8, faq.getCONTENT_ID());
            pstmt.setString(9, faq.getVIEWS());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // FAQ 항목 수정
    public void updateFAQ(FAQVO faq) {
        String sql = "UPDATE FAQ_TABLE SET Q=?, FILE_DATA=?, TITLE=?, CREATE_DAY=?, MEMBER_ID=?, ANSWER_ID=?, CONTENT_ID=?, VIEWS=? WHERE SEQ_NUMBER=?";

        try (
            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, faq.getQ());
            pstmt.setString(2, faq.getFILE_DATA());
            pstmt.setString(3, faq.getTITLE());
            pstmt.setDate(4, faq.getCREATE_DAY());
            pstmt.setString(5, faq.getMEMBER_ID());
            pstmt.setString(6, faq.getANSWER_ID());
            pstmt.setString(7, faq.getCONTENT_ID());
            pstmt.setString(8, faq.getVIEWS());
            pstmt.setInt(9, faq.getSEQ_NUMBER());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // FAQ 항목 삭제
    public void deleteFAQ(int vo) {
        String sql = "DELETE FROM FAQ_TABLE WHERE SEQ_NUMBER=?";

        try (
            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, vo);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	public Object getFAQ(FAQVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public FAQVO getFAQ(int seq_NUMBER) {
		// TODO Auto-generated method stub
		return null;
	}
}
