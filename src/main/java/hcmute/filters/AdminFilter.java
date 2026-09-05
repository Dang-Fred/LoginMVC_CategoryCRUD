package hcmute.filters;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import hcmute.models.User;

// Filter này sẽ canh gác tất cả các đường dẫn bắt đầu bằng /admin/
@WebFilter(urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("account");
        }
        
        // Nếu đã đăng nhập VÀ có quyền Admin (roleid == 1)
        if (user != null && user.getRoleid() == 1) {
            chain.doFilter(request, response); // Cho phép đi tiếp vào Controller
        } else {
            // Chưa đăng nhập hoặc là User thường (roleid = 5) -> Đuổi về trang Đăng nhập
            resp.sendRedirect(req.getContextPath() + "/login?alert=Access Denied! Ban khong co quyen truy cap.");
        }
    }
}