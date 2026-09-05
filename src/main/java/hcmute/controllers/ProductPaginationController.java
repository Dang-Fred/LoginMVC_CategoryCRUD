package hcmute.controllers;

import java.io.IOException;
import java.util.List;

import hcmute.models.Product;
import hcmute.services.ProductServiceImpl;
import hcmute.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/product")
public class ProductPaginationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tham số trang hiện tại từ URL (mặc định là trang 1)
        String pageParam = req.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        
        int pageSize = 6; // Đề bài: 6 SP / 1 trang
        int offset = (currentPage - 1) * pageSize; // Tính toán vị trí bắt đầu lấy
        
        // Lấy danh sách sản phẩm cho trang hiện tại
        List<Product> listPage = productService.findAllWithPagination(offset, pageSize);
        
        // Tính tổng số trang
        int totalProducts = productService.countTotalProducts();
        int endPage = totalProducts / pageSize;
        if (totalProducts % pageSize != 0) {
            endPage++; // Nếu còn dư SP thì cộng thêm 1 trang
        }
        
        // Truyền dữ liệu ra JSP
        req.setAttribute("productList", listPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("currentPage", currentPage);
        
        req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
    }
}