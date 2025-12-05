package com.sahakclub.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/images/*")
public class ImageServlet extends HttpServlet {
    private static final String IMAGE_DIR = "D:\\sahakclub_uploads\\images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestedImage = request.getPathInfo();
        if (requestedImage == null || requestedImage.equals("/")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Remove leading slash from pathInfo
        if (requestedImage.startsWith("/")) {
            requestedImage = requestedImage.substring(1);
        }

        File imageFile = new File(IMAGE_DIR, requestedImage);
        if (!imageFile.exists() || imageFile.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String mimeType = getServletContext().getMimeType(imageFile.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        response.setContentType(mimeType);
        response.setContentLengthLong(imageFile.length());

        try (InputStream in = new FileInputStream(imageFile);
             OutputStream out = response.getOutputStream()) {
            in.transferTo(out);
        }
    }
}
