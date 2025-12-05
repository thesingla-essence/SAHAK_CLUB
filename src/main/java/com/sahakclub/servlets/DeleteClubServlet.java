package com.sahakclub.servlets;

import com.sahakclub.dao.ClubDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/delete-club")
public class DeleteClubServlet extends HttpServlet {
    private ClubDAO dao = new ClubDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("adminUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        String idStr = req.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                dao.deleteClub(id);
            } catch (Exception e) {
                throw new ServletException(e);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
    }
}
