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

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/home")
public class HomeController extends HttpServlet {
	ProductService productService = new ProductServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// Lấy 10 SP mới nhất truyền ra JSP
        List<Product> top10 = productService.getTop10Newest();
        req.setAttribute("top10Products", top10);
        req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
    }
}