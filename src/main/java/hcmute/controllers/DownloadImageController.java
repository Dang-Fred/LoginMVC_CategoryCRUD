package hcmute.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files; // Dùng thư viện chuẩn của Java thay vì IOUtils
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import hcmute.utils.Constant;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/image") // Đường dẫn gọi ảnh: /image?fname=ten_anh.jpg
public class DownloadImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getParameter("fname");
        File file = new File(Constant.DIR + "/" + fileName);
        
        resp.setContentType("image/jpeg");
        
        if (file.exists()) {
            // Dùng Files.copy của Java để chép ảnh ra web (Thay cho IOUtils)
            Files.copy(file.toPath(), resp.getOutputStream());
        }
    }
}