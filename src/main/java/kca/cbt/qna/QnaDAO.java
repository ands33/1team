package kca.cbt.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kca.cbt.JDBCUtil;


@Repository("qnaDAO")
public class QnaDAO {
    // JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    // SQL 명령어들
    // nvl은 null일경우 뒤의값, 아닐경우 앞의값을 return
    private final String QNA_INSERT = "insert into qna (seq_number, title, q, member_id, file_data) values ((SELECT NVL(MAX(seq_number), 0) + 1 from qna), ?, ?, ?, ?)";
    private final String QNA_UPDATE = "update qna set title=?, q=?, file_data=? where seq_number=?";
    private final String QNA_DELETE = "delete from qna where seq_number=?";
    private final String QNA_GET = "select * from qna where seq_number=?";
    private final String QNA_LIST = "select * from qna order by seq_number desc";
    private final String A_INSERT = "";

    // QnA 삽입 메소드
    public void insertQna(QnaVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(QNA_INSERT);
            MultipartFile uploadFile = vo.getFile_data();
            String fileName = uploadFile.getOriginalFilename();
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getQ());
            stmt.setString(3, vo.getMember_id()); // member_id 추가
            stmt.setString(4, fileName); // file_data 추가
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
}