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

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Đã sửa lại đường dẫn cho khớp với doPost
        req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        
        UserService service = new UserServiceImpl();
        boolean hasError = false;
        
        // 1. Validation Lõi (Chặn người dùng bypass qua HTML)
        if (fullname == null || fullname.trim().isEmpty()) {
            req.setAttribute("errorFullname", "Họ tên không được để trống.");
            hasError = true;
        }
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            req.setAttribute("errorEmail", "Email không hợp lệ.");
            hasError = true;
        }
        if (phone == null || !phone.matches("\\d{10,11}")) {
            req.setAttribute("errorPhone", "Số điện thoại phải từ 10 đến 11 số.");
            hasError = true;
        }
        if (username == null || username.length() < 5) {
            req.setAttribute("errorUsername", "Tài khoản phải có ít nhất 5 ký tự.");
            hasError = true;
        }
        if (password == null || password.length() < 6) {
            req.setAttribute("errorPassword", "Mật khẩu phải từ 6 ký tự trở lên.");
            hasError = true;
        }

        // Nếu có lỗi định dạng, trả ngay về trang đăng ký
        if (hasError) {
            req.setAttribute("alert", "Vui lòng kiểm tra lại các trường thông tin!");
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
            return;
        }
        
        // 2. Kiểm tra trùng lặp Database (Code cũ của bạn giữ nguyên)
        if (service.checkExistEmail(email)) {
            req.setAttribute("alert", "Email đã tồn tại!");
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
            return;
        }
        if (service.checkExistUsername(username)) {
            req.setAttribute("alert", "Tài khoản đã tồn tại!");
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
            return;
        }
        
        // 3. Tiến hành đăng ký
        boolean isSuccess = service.register(username, password, email, fullname, phone);
        if (isSuccess) {
            HttpSession session = req.getSession();
            session.setAttribute("email", email);
            resp.sendRedirect(req.getContextPath() + "/verify");
        } else {
            req.setAttribute("alert", "Lỗi hệ thống, không thể đăng ký!");
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
        }
    }
}