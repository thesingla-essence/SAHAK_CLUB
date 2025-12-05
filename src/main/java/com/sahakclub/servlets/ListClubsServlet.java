package com.sahakclub.servlets;

import com.sahakclub.dao.ClubDAO;
import com.sahakclub.model.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/clubs")
public class ListClubsServlet extends HttpServlet {
    private ClubDAO dao = new ClubDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Club> clubs = dao.listAll();
            req.setAttribute("clubs", clubs);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
