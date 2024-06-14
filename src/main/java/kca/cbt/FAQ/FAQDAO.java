package kca.cbt.FAQ;

import kca.cbt.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FAQDAO {

    // 모든 FAQ 조회 메서드
    public List<FAQVO> getAllFAQs() {
        List<FAQVO> faqList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = JDBCUtil.getConnection();
            String sql = "SELECT SEQ_NUMBER, Q, FILE_DATA, AUTHOR, CREATE_DAY, VIEWS, FAQ_ID, ANSWER_ID, CONTENT FROM FAQ";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                FAQVO faq = new FAQVO();
                faq.setSeqNumber(rs.getInt("SEQ_NUMBER"));
                faq.setQuestion(rs.getString("Q"));
                faq.setFileData(rs.getBytes("FILE_DATA"));
                faq.setAuthor(rs.getString("AUTHOR"));
                faq.setCreateDate(rs.getDate("CREATE_DAY"));
                faq.setViews(rs.getInt("VIEWS"));
                faq.setFaqId(rs.getString("FAQ_ID"));
                faq.setAnswerId(rs.getString("ANSWER_ID"));
                faq.setContent(rs.getString("CONTENT"));

                faqList.add(faq);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }

        return faqList;
    }

    // 필요에 따라 다른 CRUD 메서드 추가 가능
}
