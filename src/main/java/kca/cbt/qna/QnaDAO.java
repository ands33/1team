package kca.cbt.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
    private final String QNA_LIST = "select * from qna order by seq_number asc";
    private final String QNA_GET = "select * from qna where seq_number=?";
    private final String QNA_UPDATE = "update qna set title=?, q=?, file_data=? where seq_number=?";
    private final String QNA_DELETE = "delete from qna where seq_number=?";

    

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
    
    // 글 조회
    public QnaVO getQna(QnaVO vo) {
    	System.out.println("==> JDBC getQna() 기능 처리");
    	QnaVO qna = null;
    	try {
    		conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(QNA_GET);
			stmt.setInt(1, vo.getSeq_number()); //select * from board where seq = vo.getSeq()
			rs = stmt.executeQuery();
			if(rs.next()) {
				qna = new QnaVO();
				qna.setSeq_number(rs.getInt("SEQ_NUMBER"));
				qna.setQ(rs.getString("Q"));
//				qna.setFile_data(rs.getString("FILE_DATA"));
				qna.setTitle(rs.getString("TITLE"));
				qna.setAtitle(rs.getString("ATITLE"));
				qna.setA_content(rs.getString("A_CONTENT"));
//				qna.setA_file(rs.getString("A_FILE"));
				qna.setCreate_day(rs.getDate("CREATE_DAY"));
				qna.setMember_id(rs.getString("MEMBER_ID"));
				qna.setAnswer_id(rs.getString("ANSWER_ID"));
				qna.setViews(rs.getInt("VIEWS"));
			}
    		
    	} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return qna;
    }
    
 // 글 목록 조회
 	public List<QnaVO> getQnaList(QnaVO vo) {
 	    System.out.println("===> JDBC로 getQnaList() 기능 처리");
 	    List<QnaVO> qnaList = new ArrayList<QnaVO>();
 	   try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(QNA_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				QnaVO qna = new QnaVO();
				qna = new QnaVO();
				qna.setSeq_number(rs.getInt("SEQ_NUMBER"));
				qna.setTitle(rs.getString("TITLE"));
//				qna.setFile_data(rs.getString("FILE_DATA"));  (이 부분은 찾아봐야함 이미지로 링크 시켜서 봐야할듯)
				qna.setMember_id(rs.getString("MEMBER_ID"));
				qna.setCreate_day(rs.getDate("CREATE_DAY"));
				qna.setViews(rs.getInt("VIEWS"));
				qnaList.add(qna);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return qnaList;
	}
 	
 	// 글 수정
 	public void updateQna(QnaVO vo) {
 		System.out.println("===> JDBC로 updateBoard() 기능 처리");
 		try {
 			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(QNA_UPDATE);
			
			MultipartFile uploadFile = vo.getFile_data();
            String fileName = (uploadFile != null && !uploadFile.isEmpty()) ? uploadFile.getOriginalFilename() : null;

            
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getQ());
			stmt.setString(3, fileName);
			stmt.setInt(4, vo.getSeq_number());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
 	}
 	
 	// 글 삭제 
 	public void deleteQna(QnaVO vo) {
 		System.out.println("===> JDBC로 deleteQna() 기능 처리");
 		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(QNA_DELETE);
			stmt.setInt(1, vo.getSeq_number());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
 	}
}