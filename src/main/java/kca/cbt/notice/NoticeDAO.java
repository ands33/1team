package kca.cbt.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

//import com.springbook.biz.NOTICE.NOTICEVO;
import kca.cbt.notice.NoticeVO;
import kca.cbt.JDBCUtil;

@Repository("NoticeDAO")
public class NoticeDAO {
	// JDBC 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// SQL
	private final String NOTICE_INSERT = "insert into Notice(c_type,seq,title,"
			+ "writer,content value((select nvl(max(seq), 0)+1 from notice),?,?,?)";
	private final String NOTICE_UPDATE = "update Notice set title=?," + "content=? " + "where = seq?";
	private final String NOTICE_DELETE = "delete notice where seq=?";
	private final String NOTICE_GET = "SELECT * FROM notice WHERE SEQ=?";
	private final String NOTICE_LIST = "SELECT * FROM notice order by seq desc";
	// 제목에 검색어가 포함된것
	private final String NOTICE_tLIST = "select * from notice where title like '%'||?||'%' order by seq desc";
	// 내용에 검색어가 포함된것
	private final String NOTICE_cLIST = "select * from notice where content like '%'||?||'%' order by seq desc";

	// CRUD 기능의 메소드 구현

	// 글 등록
	public void insertNotice(NoticeVO vo) {
		System.out.println("===> JDBC로 insertNotice() 기능 처리");
		try {
			conn = JDBCUtil.getConnection(); // test db 가르킴
			stmt = conn.prepareStatement(NOTICE_INSERT);
			MultipartFile uploadFile = vo.getUploadFile();
			String fileName = uploadFile.getOriginalFilename();
			stmt.setString(1, vo.getTitle()); // 1번 ?
			stmt.setString(2, vo.getWriter()); // 2번 ?
			stmt.setString(3, vo.getContent()); // 3번 ?
			stmt.setString(4, fileName); // 3번 ?
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn.close();
			// stmt.close();
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정
	public void updateNotice(NoticeVO vo) {
		System.out.println("===> JDBC로 updateNotice() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteNotice(NoticeVO vo) {
		System.out.println("===> JDBC로 deleteNotice() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public NoticeVO getnotice(NoticeVO vo) {
		System.out.println("===> JDBC로 getNoice() 기능 처리");
		NoticeVO notice = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_GET);
			stmt.setInt(1, vo.getSeq()); // select * from board where seq = vo.getSeq()
			rs = stmt.executeQuery();
			if (rs.next()) {
				notice = new NoticeVO();
				notice.setSeq(rs.getInt("SEQ"));
				notice.setTitle(rs.getString("TITLE"));
				notice.setWriter(rs.getString("WRITER"));
				notice.setContent(rs.getString("CONTENT"));
				notice.setCreatedate(rs.getDate("CREATEDATE"));
				notice.setViews(rs.getInt("VIEWS"));
				notice.setFilename(rs.getString("UPLOAD"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return notice;
	}

	// 글 목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("===> JDBC로 getNoticeList() 기능 처리");
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		try {
			conn = JDBCUtil.getConnection();

			// vo가 null인지 체크
			if (vo == null) {
				System.out.println("@@@@@@@@@@list실행@@@@@@");
				stmt = conn.prepareStatement(NOTICE_LIST);
			} else {
				// vo가 null이 아니면 검색 조건에 따라 처리
				if ("TITLE".equals(vo.getSearchCondition())) {
					System.out.println("@@@@tList@@@@@");
					stmt = conn.prepareStatement(NOTICE_LIST);
//		                stmt.setString(1, vo.getSearchKeyword());
				} else if ("CONTENT".equals(vo.getSearchCondition())) {
					System.out.println("@@@@cList@@@@@");
					stmt = conn.prepareStatement(NOTICE_cLIST);
					stmt.setString(1, vo.getSearchKeyword());
				} else {
					stmt = conn.prepareStatement(NOTICE_LIST);
				}
			}

			rs = stmt.executeQuery();
			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setSeq(rs.getInt("SEQ"));
				notice.setTitle(rs.getString("TITLE"));
				notice.setWriter(rs.getString("WRITER"));
				notice.setContent(rs.getString("CONTENT"));
				notice.setCreatedate(rs.getDate("CREATEDATE"));
				notice.setViews(rs.getInt("VIEWS"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return noticeList;
	}

}
