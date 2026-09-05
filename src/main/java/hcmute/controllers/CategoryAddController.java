package hcmute.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import hcmute.models.Category;
import hcmute.services.CategoryService;
import hcmute.services.CategoryServiceImpl;
import hcmute.utils.Constant;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(urlPatterns = { "/admin/category/add" })

public class CategoryAddController extends HttpServlet {
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String cateName = req.getParameter("name");
        Category category = new Category();
        category.setName(cateName);

        // Xử lý upload file ảnh bằng chuẩn mới của Servlet 3.1+ / Tomcat 11
        Part filePart = req.getPart("icon");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            // Đổi tên file theo thời gian để tránh trùng lặp
            String uniqueName = System.currentTimeMillis() + "_" + fileName;
            
            // Tạo thư mục lưu nếu chưa có
            File uploadDir = new File(Constant.DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            // Ghi file xuống ổ cứng
            filePart.write(Constant.DIR + "/" + uniqueName);
            category.setIcon(uniqueName);
        } else {
            category.setIcon("default.png");
        }

        cateService.insert(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}