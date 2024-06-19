package kca.cbt.question_card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kca.cbt.JDBCUtil;public class CardDAO {
	
	// JDBC 관련 변수
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL 명령어들
    private final String ONECARD_GET = "select * from exam_question_card where qualification_code = 'KCA01'";
    private final String TWOCARD_GET = "select * from exam_question_card where qualification_code = 'KCA02'";
    
    
    //onecard 정보 get
    public List<CardVO> getOneCard(CardVO vo){
    	System.out.println("===> JDBC로 GetOneCard() 기능 처리");
    	List<CardVO> CardList = new ArrayList<CardVO>();
    	try {
    		conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ONECARD_GET);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CardVO card = new CardVO();
				card.setSubject_code(rs.getInt("SUBJECT_CODE"));
				card.setSubject_name(rs.getString("SUBJECT_NAME"));
				card.setQualification_code(rs.getString("QUALIFICATION_CODE"));
				
				CardList.add(card);
			}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		JDBCUtil.close(rs, stmt, conn);
    	}
    	return CardList;
    }
    
  //twocard 정보 get
    public List<CardVO> getTwoCard(CardVO vo){
    	System.out.println("===> JDBC로 GetOneCard() 기능 처리");
    	List<CardVO> CardList = new ArrayList<CardVO>();
    	try {
    		conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TWOCARD_GET);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CardVO card = new CardVO();
				card.setSubject_code(rs.getInt("SUBJECT_CODE"));
				card.setSubject_name(rs.getString("SUBJECT_NAME"));
				card.setQualification_code(rs.getString("QUALIFICATION_CODE"));
				
				CardList.add(card);
			}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		JDBCUtil.close(rs, stmt, conn);
    	}
    	return CardList;
    }
    
}
