package kca.cbt.view.criteria;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetCriTeriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CriTeriaService criTeriaService;

    public void setCriTeriaService(CriTeriaService criTeriaService) {
        this.criTeriaService = criTeriaService;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CriTeriaVO> list = criTeriaService.getAllCriteria();
        request.setAttribute("criteriaList", list);
        request.getRequestDispatcher("/WEB-INF/CriTeriaListView.jsp").forward(request, response); // JSP 파일 경로 확인
    }
}
