package kca.cbt.criteria;

import javax.servlet.*;
import javax.servlet.http.*;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

import java.io.*;
import java.util.*;


public class GetBoardListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/getBoardList.do")) {
            System.out.println("글 목록 검색 처리");

            // 1. 사용자 입력 정보 추출 (검색 기능 구현 필요)

            // 2. DB 연동 처리
            BoardVO vo = new BoardVO();
            BoardDAO boardDAO = new BoardDAO(); // BoardDAO는 데이터베이스 접근을 담당하는 클래스입니다.
            List<BoardVO> boardList = boardDAO.getBoardList(vo); // getBoardList는 데이터베이스에서 글 목록을 가져오는 메서드입니다.

            // 3. 검색 결과를 세션에 저장하고 목록 화면으로 이동
            HttpSession session = request.getSession();
            session.setAttribute("boardList", boardList); // boardList를 세션에 저장

            // 목록 화면으로 이동
            response.sendRedirect("getcriTeria.jsp"); // 데이터를 표시할 JSP 파일로 리다이렉트
        }
    }
}
