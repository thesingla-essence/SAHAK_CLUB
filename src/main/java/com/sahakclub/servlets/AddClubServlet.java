package com.sahakclub.servlets;

import com.sahakclub.dao.ClubDAO;
import com.sahakclub.model.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.Instant;

@WebServlet("/admin/add-club")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 8, maxRequestSize = 1024 * 1024 * 20)
public class AddClubServlet extends HttpServlet {
    private ClubDAO dao = new ClubDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/add-club.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("adminUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String name = req.getParameter("name");
        String faculty = req.getParameter("facultyCoordinator");
        String student = req.getParameter("studentCoordinator");
        String description = req.getParameter("description");
        String engagement = req.getParameter("engagement");
        Part filePart = req.getPart("image");

        String uploadDirPath = "D:/sahakclub_uploads/images";
        File uploadDir = new File(uploadDirPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            String submitted = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String ext = "";
            int i = submitted.lastIndexOf('.');
            if (i > 0) ext = submitted.substring(i).toLowerCase();
            String safeName = "club_" + Instant.now().toEpochMilli() + ext;

            filePart.write(uploadDirPath + File.separator + safeName);
            fileName = safeName;
        }

        Club club = new Club();
        club.setName(name);
        club.setFacultyCoordinator(faculty);
        club.setStudentCoordinator(student);
        club.setDescription(description);
        club.setEngagement(engagement);
        club.setImageUrl(fileName != null ? fileName : "placeholder.png");

        try {
            dao.addClub(club);
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
