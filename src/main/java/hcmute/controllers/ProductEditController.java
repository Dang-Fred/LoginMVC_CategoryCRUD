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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = { "/admin/product/edit" })
public class ProductEditController extends HttpServlet {

    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy ID từ URL và truy vấn dữ liệu sản phẩm cũ
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        
        // Lấy danh sách danh mục để đổ vào thẻ <select>
        List<Category> cateList = categoryService.getAll();

        req.setAttribute("product", product);
        req.setAttribute("cateList", cateList);
        req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int cateId = Integer.parseInt(req.getParameter("cate_id"));

        // Lấy sản phẩm cũ lên để đè dữ liệu mới vào (giữ lại createdDate)
        Product product = productService.findById(id);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);

        Category category = new Category();
        category.setId(cateId); // Kiểm tra lại tên hàm set ID của bảng Category
        product.setCategory(category);

        // Xử lý ảnh: Nếu có upload file mới thì lưu đè, nếu không thì giữ nguyên ảnh cũ
        Part filePart = req.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uniqueName = System.currentTimeMillis() + "_" + fileName;

            File uploadDir = new File(Constant.DIR);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(Constant.DIR + "/" + uniqueName);
            product.setImage(uniqueName);
        }

        productService.update(product);
        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}