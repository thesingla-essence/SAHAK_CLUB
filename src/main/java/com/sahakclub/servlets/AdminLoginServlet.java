package com.sahakclub.servlets;

import com.sahakclub.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("username");
        String pass = req.getParameter("password");
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement("SELECT id FROM admins WHERE username=? AND password=?")) {
            ps.setString(1, user);
            ps.setString(2, pass);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = req.getSession();
                    session.setAttribute("adminUser", user);
                    resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                    return;
                }
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("error", "Invalid credentials");
        req.getRequestDispatcher("/admin-login.jsp").forward(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin-login.jsp").forward(req, resp);
    }
}
