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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import hcmute.models.User; // Model JPA của bạn
import hcmute.services.UserService;
import hcmute.services.UserServiceImpl;
import hcmute.utils.Constant;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = { "/profile" })
public class ProfileController extends HttpServlet {

    UserService accountService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/web/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User currentAccount = (User) session.getAttribute("account");

        if (currentAccount == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Lấy dữ liệu từ form
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        
        currentAccount.setFullName(fullName);
        currentAccount.setPhone(phone); // Đảm bảo Model Account có trường phone

        // Xử lý upload file ảnh
        Part filePart = req.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uniqueName = System.currentTimeMillis() + "_" + fileName;

            File uploadDir = new File(Constant.DIR); // Đường dẫn lưu file
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(Constant.DIR + "/" + uniqueName);
            currentAccount.setAvatar(uniqueName);
        }

        // Gọi hàm update sử dụng JPA EntityManager (merge)
        accountService.update(currentAccount);
        
        // Cập nhật lại session
        session.setAttribute("account", currentAccount);
        
        req.setAttribute("message", "Cập nhật hồ sơ thành công!");
        req.getRequestDispatcher("/views/web/profile.jsp").forward(req, resp);
    }
}