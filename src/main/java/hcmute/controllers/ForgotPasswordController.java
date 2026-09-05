package hcmute.controllers;

import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import hcmute.services.UserService;
import hcmute.services.UserServiceImpl;
import hcmute.utils.EmailUtil;

@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (userService.checkExistEmail(email)) {
            // Tạo OTP 6 số ngẫu nhiên
            String otp = String.format("%06d", new Random().nextInt(999999));
            // Cập nhật mã OTP mới vào CSDL
            userService.updateVcode(email, otp);
            // Gửi mail
            EmailUtil.sendOTP(email, otp);
            
            // Lưu email vào session để dùng ở bước sau
            req.getSession().setAttribute("reset_email", email);
            resp.sendRedirect(req.getContextPath() + "/reset-password");
        } else {
            req.setAttribute("error", "Email không tồn tại trong hệ thống!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        }
    }
}