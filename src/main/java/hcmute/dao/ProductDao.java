package hcmute.dao;

import java.util.List;

import hcmute.models.Product;

public interface ProductDao {
	// 5 Hàm CRUD cơ bản
    void insert(Product product);
    void update(Product product);
    void delete(int id) throws Exception;
    Product findById(int id);
    List<Product> findAll();
    
    
	List<Product> getTop10Newest();
	List<Product> findAllWithPagination(int offset, int limit);
	int countTotalProducts();
}
