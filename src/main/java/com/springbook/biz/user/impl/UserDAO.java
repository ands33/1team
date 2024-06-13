package com.springbook.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.user.UserVO;

//DAO(Data Access Object)
public class UserDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// SQL 명령어들
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String USER_INSERT = "insert into users(seq, name, gender, id, password, passwordc, addr, email, phone, hobby, introduce, u_filename) values((select nvl(max(seq), 0)+1 from users),?,?,?,?,?,?,?,?,?,?,?)";	
	private final String USER_UPDATE = "update users set password=?, passwordc=?, addr=?,email=?, phone=?, hobby=?, introduce=? ,u_filename=? where id=?";
	private final String USER_DELETE = "delete users where id=?";
	private final String USER_LIST = "select * from users order by seq desc";
	private final String USER_GET_ONE = "select * from users where id=?";
	
	// CRUD 기능의 메소드 구현
	public UserVO getUserOne(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET_ONE);
			stmt.setString(1, vo.getU_id());
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setU_seq(rs.getInt("SEQ"));
				user.setU_name(rs.getString("NAME"));
				user.setU_gender(rs.getString("GENDER"));
				user.setU_id(rs.getString("ID"));
				user.setU_pw(rs.getString("PASSWORD"));
				user.setU_pw(rs.getString("PASSWORDC"));
				user.setU_addr(rs.getString("ADDR"));
				user.setU_phone(rs.getString("PHONE"));
				user.setU_hobby(rs.getString("HOBBY"));
				user.setU_introduce(rs.getString("INTRODUCE"));
				user.setU_filename(rs.getString("U_FILENAME"));
//				user.setU_email(rs.getString("ROLE"));
				String emailstr = rs.getString("EMAIL");
				user.setU_email((emailstr).substring(0, emailstr.indexOf("@")));
				user.setU_emailAddr(emailstr.substring(emailstr.indexOf("@")+1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
	
	// 회원 등록
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
	// stmt = select * from users where u_id=? and u_pw=?
			
			stmt.setString(1, vo.getU_id());
			stmt.setString(2, vo.getU_pw());
	// stmt = select * from users where u_id='test' and u_pw='test123'
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setU_seq(rs.getInt("SEQ"));
				user.setU_name(rs.getString("NAME"));
				user.setU_gender(rs.getString("GENDER"));
				user.setU_id(rs.getString("ID"));
				user.setU_pw(rs.getString("PASSWORD"));
				user.setU_pw(rs.getString("PASSWORDC"));
				user.setU_addr(rs.getString("ADDR"));
				user.setU_phone(rs.getString("PHONE"));
				user.setU_hobby(rs.getString("HOBBY"));
				user.setU_introduce(rs.getString("INTRODUCE"));
//				user.setU_email(rs.getString("ROLE"));
				String emailstr = rs.getString("EMAIL");
				user.setU_email((emailstr).substring(0, emailstr.indexOf("@")));
				user.setU_emailAddr(emailstr.substring(emailstr.indexOf("@")+1));
				user.setU_filename(rs.getString("U_FILENAME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
	
	public void insertUser(UserVO vo) {
		System.out.println("===> JDBC로 insertUser() 기능 처리");
		try {
			conn = JDBCUtil.getConnection(); // test db 가르킴
			stmt = conn.prepareStatement(USER_INSERT);
			MultipartFile uploadFile = vo.getU_pic();
			String fileName = uploadFile.getOriginalFilename();
			stmt.setString(1, vo.getU_name()); //1번 ?
			stmt.setString(2, vo.getU_gender()); //2번 ?
			stmt.setString(3, vo.getU_id()); //3번 ?
			stmt.setString(4, vo.getU_pw());
			stmt.setString(5, vo.getU_pwc());
			stmt.setString(6, vo.getU_addr());
			stmt.setString(7, vo.getU_email()+"@"+vo.getU_emailAddr());
			stmt.setString(8, vo.getU_phone());
			stmt.setString(9, vo.getU_hobby());
			stmt.setString(10, vo.getU_introduce());
			stmt.setString(11, fileName);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//conn.close();
			//stmt.close();
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정
	public void updateUser(UserVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_UPDATE);
			stmt.setString(1, vo.getU_pw());
			stmt.setString(2, vo.getU_pwc());
			stmt.setString(3, vo.getU_addr());
			stmt.setString(4, vo.getU_email()+"@"+vo.getU_emailAddr());
			stmt.setString(5, vo.getU_phone());
			stmt.setString(6, vo.getU_hobby());
			stmt.setString(7, vo.getU_introduce());
			stmt.setString(8, vo.getU_id());		
			stmt.setString(9, vo.getU_filename());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteUser(UserVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_DELETE);
			stmt.setString(1, vo.getU_id());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	// 글 목록 조회
		public List<UserVO> getUserList(UserVO vo) {
			System.out.println("===> JDBC로 getuserList() 기능 처리");
			List<UserVO> UserList = new ArrayList<UserVO>();
			try {
				conn = JDBCUtil.getConnection();
//				if(vo.getSearchCondition().equals("TITLE")) {
//					stmt = conn.prepareStatement(user_tLIST);
//				}else if(vo.getSearchCondition().equals("CONTENT")) {
//					stmt = conn.prepareStatement(user_cLIST);
//				}
//				stmt.setString(1, vo.getSearchKeyword());
				stmt = conn.prepareStatement(USER_LIST);
				rs = stmt.executeQuery();
				while (rs.next()) {
					UserVO user = new UserVO();
					user = new UserVO();
					user.setU_seq(rs.getInt("SEQ"));
					user.setU_name(rs.getString("NAME"));
					user.setU_gender(rs.getString("GENDER"));
					user.setU_id(rs.getString("ID"));
//					user.setU_pw(rs.getString("PWASSWORD"));
//					user.setU_pw(rs.getString("PWASSWORDC"));
					user.setU_addr(rs.getString("ADDR"));
					user.setU_phone(rs.getString("PHONE"));
//					user.setU_hobby(rs.getString("HOBBY"));
					user.setU_introduce(rs.getString("INTRODUCE"));
//					user.setU_email(rs.getString("ROLE"));
					user.setU_email(rs.getString("EMAIL"));
					user.setU_regdate(rs.getDate("REGDATE"));
					
					UserList.add(user);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return UserList;
		}
}
