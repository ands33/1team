package kca.cbt.Index;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.JDBCUtil;

@Repository("IndexDAO")

public class IndexDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	// SQL 명령어들
		// nvl은 null일경우 뒤의값, 아닐경우 앞의값을 return
		private final String INDEX_UPDATE = "update member set title=?, content=? where seq=?";
		private final String INDEX_GET = "select * from board where seq=?";
		private final String INDEX_LIST = "select * from board order by seq desc";

		public void insertIndex(IndexVO vo) {
			System.out.println("===> JDBC로 insertIndex() 기능 처리");
			try {
				conn = JDBCUtil.getConnection(); // test db 가르킴
				stmt = conn.prepareStatement(BOARD_INSERT);
				MultipartFile uploadFile = vo.getUploadFile();
				String fileName = uploadFile.getOriginalFilename();
				stmt.setString(1, vo.getTitle()); //1번 ?
				stmt.setString(2, vo.getWriter()); //2번 ?
				stmt.setString(3, vo.getContent()); //3번 ?
				stmt.setString(4, fileName); //3번 ?
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				//conn.close();
				//stmt.close();
				JDBCUtil.close(stmt, conn);
			}
		}
		
}
