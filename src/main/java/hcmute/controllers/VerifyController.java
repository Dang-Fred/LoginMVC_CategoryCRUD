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

@WebServlet(urlPatterns = "/verify")
public class VerifyController extends HttpServlet {
    
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Chuyển hướng đến file giao diện nhập OTP
        req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Lấy mã OTP người dùng nhập vào ô input
        String otp = req.getParameter("otp");
        
        // 2. Lấy email từ Session (email này đã được lưu tạm lúc bấm Đăng ký)
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");

        // Đề phòng trường hợp user gõ thẳng URL /verify mà chưa qua bước đăng ký
        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/register");
            return;
        }

        // 3. Gọi Service đối chiếu OTP
        boolean isCorrect = userService.verifyOTP(email, otp);

        if (isCorrect) {
            // Đúng OTP -> Cập nhật trạng thái thành 1 (Đã kích hoạt)
            userService.updateStatus(email, 1);
            
            // Xóa email khỏi session để dọn dẹp bộ nhớ
            session.removeAttribute("email");
            
            // Chuyển về trang đăng nhập báo thành công
            resp.sendRedirect(req.getContextPath() + "/login?message=Kich hoat thanh cong. Vui long dang nhap!");
        } else {
            // Sai OTP -> Báo lỗi màu đỏ và giữ lại trang verify
            req.setAttribute("error", "Mã OTP không chính xác. Vui lòng thử lại!");
            req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
        }
    }
}