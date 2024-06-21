package kca.cbt.criteria;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetCriTeriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;  // serialVersionUID 필드 추가

    private CriTeriaDAO criTeriaDAO = new CriTeriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CriTeriaVO> list = criTeriaDAO.getAllCriteria();
        request.setAttribute("criteriaList", list);
        request.getRequestDispatcher("criteriaListView.jsp").forward(request, response);
    }
}
