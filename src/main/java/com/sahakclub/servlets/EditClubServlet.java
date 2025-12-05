package com.sahakclub.servlets;

import com.sahakclub.dao.ClubDAO;
import com.sahakclub.model.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/edit-club")
public class EditClubServlet extends HttpServlet {
    private ClubDAO dao = new ClubDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("adminUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        String idStr = req.getParameter("id");
        if (idStr == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            return;
        }
        try {
            int id = Integer.parseInt(idStr);
            Club club = dao.findById(id);
            if (club == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                return;
            }
            req.setAttribute("club", club);
            req.getRequestDispatcher("/edit-club.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
