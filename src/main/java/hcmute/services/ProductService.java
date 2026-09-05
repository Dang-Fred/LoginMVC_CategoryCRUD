package hcmute.services;

import java.util.List;
import hcmute.models.Product;

public interface ProductService {
    // CÁC HÀM CRUD CƠ BẢN DÀNH CHO ADMIN
    void insert(Product product);
    void update(Product product);
    void delete(int id) throws Exception;
    Product findById(int id);
    List<Product> findAll();

    // CÁC HÀM XỬ LÝ NGHIỆP VỤ CHO GIAO DIỆN NGƯỜI DÙNG
    List<Product> getTop10Newest();
    List<Product> findAllWithPagination(int offset, int limit);
    int countTotalProducts();
}