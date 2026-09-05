package hcmute.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import hcmute.models.Category;
import hcmute.models.Product;
import hcmute.services.CategoryService;
import hcmute.services.CategoryServiceImpl;
import hcmute.services.ProductService;
import hcmute.services.ProductServiceImpl;
import hcmute.utils.Constant;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(urlPatterns = { "/admin/product/add" })
public class ProductAddController extends HttpServlet {
    
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy danh sách Category để đổ vào thẻ <select> trên giao diện
        List<Category> cateList = categoryService.getAll();                         // lỡ có sai
        req.setAttribute("cateList", cateList);
        
        req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int cateId = Integer.parseInt(req.getParameter("cate_id"));

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setCreatedDate(new java.sql.Date(System.currentTimeMillis()));

        // Xử lý upload file ảnh sản phẩm giống hệt Category
        Part filePart = req.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uniqueName = System.currentTimeMillis() + "_" + fileName;
            
            File uploadDir = new File(Constant.DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            filePart.write(Constant.DIR + "/" + uniqueName);
            product.setImage(uniqueName);
        } else {
            product.setImage("default.png");
        }

        // Liên kết khóa ngoại với Category
        Category category = new Category();
        category.setId(cateId); 
        product.setCategory(category);

        productService.insert(product);
        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}