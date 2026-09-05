package hcmute.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import hcmute.models.Product;
import hcmute.services.ProductService;
import hcmute.services.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/admin/products", "/admin/product/list"})
public class ProductListController extends HttpServlet {
    
    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy danh sách toàn bộ sản phẩm từ Database
        List<Product> productList = productService.findAll();
        
        // Đẩy dữ liệu ra view
        req.setAttribute("productList", productList);
        req.getRequestDispatcher("/views/admin/product-list.jsp").forward(req, resp);
    }
}