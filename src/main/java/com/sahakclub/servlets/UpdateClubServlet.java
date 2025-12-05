package com.sahakclub.servlets;

import com.sahakclub.dao.ClubDAO;
import com.sahakclub.model.Club;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.Instant;

@WebServlet("/admin/update-club")
@MultipartConfig(fileSizeThreshold = 1024*1024*1, maxFileSize = 1024*1024*8, maxRequestSize = 1024*1024*20)
public class UpdateClubServlet extends HttpServlet {
    private ClubDAO dao = new ClubDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("adminUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String faculty = req.getParameter("facultyCoordinator");
            String student = req.getParameter("studentCoordinator");
            String description = req.getParameter("description");
            String engagement = req.getParameter("engagement");
            
            // Get the uploaded file part
            Part filePart = null;
            try {
                filePart = req.getPart("image");
            } catch (Exception e) {
                System.err.println("Error getting file part: " + e.getMessage());
            }

            Club club = dao.findById(id);
            if (club == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                return;
            }

            String fileName = club.getImageUrl(); // keep existing by default
            
            // Debug: Log file part info
            if (filePart != null) {
                System.out.println("File part received - Size: " + filePart.getSize() + ", Name: " + filePart.getSubmittedFileName());
            } else {
                System.out.println("No file part received in request");
            }
            
            // Check if a new image file was uploaded
            if (filePart != null && filePart.getSize() > 0) {
                String submittedFileName = filePart.getSubmittedFileName();
                if (submittedFileName != null && !submittedFileName.trim().isEmpty()) {
                try {
                    String submitted = Paths.get(submittedFileName).getFileName().toString();
                    System.out.println("Processing uploaded file: " + submitted);
                    
                    String ext = "";
                    int i = submitted.lastIndexOf('.');
                    if (i > 0 && i < submitted.length() - 1) {
                        ext = submitted.substring(i).toLowerCase();
                    }
                    
                    // Generate unique filename
                    String safeName = "club_" + Instant.now().toEpochMilli() + ext;
                    System.out.println("Generated safe filename: " + safeName);
                    
                    // Ensure upload directory exists
                    String uploadDirPath = "D:/sahakclub_uploads/images";
                    File uploadDir = new File(uploadDirPath);
                    if (!uploadDir.exists()) {
                        boolean created = uploadDir.mkdirs();
                        System.out.println("Upload directory created: " + created + " at " + uploadDirPath);
                    }
                    
                    // Write the file
                    File targetFile = new File(uploadDir, safeName);
                    System.out.println("Writing file to: " + targetFile.getAbsolutePath());
                    filePart.write(targetFile.getAbsolutePath());
                    
                    // Verify file was written
                    if (targetFile.exists() && targetFile.length() > 0) {
                        fileName = safeName;
                        System.out.println("File uploaded successfully: " + fileName + " (" + targetFile.length() + " bytes)");
                    } else {
                        // File write failed, keep existing image
                        System.err.println("Failed to write uploaded image file: " + targetFile.getAbsolutePath());
                        System.err.println("File exists: " + targetFile.exists() + ", Length: " + (targetFile.exists() ? targetFile.length() : 0));
                    }
                } catch (Exception e) {
                    // If file upload fails, keep existing image
                    System.err.println("Error uploading image: " + e.getMessage());
                    e.printStackTrace();
                    // fileName remains as existing club.getImageUrl()
                }
                } else {
                    System.out.println("File part has no submitted filename, keeping existing image");
                }
            } else {
                System.out.println("No new image uploaded, keeping existing image: " + fileName);
            }

            club.setName(name);
            club.setFacultyCoordinator(faculty);
            club.setStudentCoordinator(student);
            club.setDescription(description);
            club.setEngagement(engagement);
            club.setImageUrl(fileName != null ? fileName : "placeholder.png");

            dao.updateClub(club);
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException(e);
        }
    }
}
