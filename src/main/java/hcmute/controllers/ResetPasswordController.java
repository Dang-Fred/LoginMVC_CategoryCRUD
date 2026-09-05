package hcmute.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import hcmute.services.UserService;
import hcmute.services.UserServiceImpl;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/web/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String otp = req.getParameter("otp");
        String newPassword = req.getParameter("newPassword");
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("reset_email");

        if (email != null && userService.verifyOTP(email, otp)) {
            // Đổi mật khẩu
            userService.updatePassword(email, newPassword);
            // Dọn dẹp session
            session.removeAttribute("reset_email");
            resp.sendRedirect(req.getContextPath() + "/login?message=Doi mat khau thanh cong!");
        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("/views/web/reset-password.jsp").forward(req, resp);
        }
    }
}