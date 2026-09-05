package hcmute.controllers;

import java.io.IOException;

import hcmute.models.Product;
import hcmute.services.ProductService;
import hcmute.services.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/product/detail"})
public class ProductDetailController extends HttpServlet {
    
    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        
        // 1. Kiểm tra ID có bị bỏ trống hay không
        if (idStr != null && !idStr.isEmpty()) {
            try {
                // 2. Chuyển đổi an toàn, đề phòng trường hợp ID bị nhập sai thành chữ cái
                int id = Integer.parseInt(idStr);
                Product product = productService.findById(id); 
                
                req.setAttribute("product", product);
                req.getRequestDispatcher("/views/web/product-detail.jsp").forward(req, resp);
                
            } catch (NumberFormatException e) {
                // Lỗi ép kiểu (ví dụ: id=abc) -> Đẩy về trang chủ
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            // Không có tham số ID -> Đẩy về trang chủ
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}