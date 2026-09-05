package hcmute.services;

import java.util.List;

import hcmute.dao.ProductDao;
import hcmute.dao.ProductDaoImpl;
import hcmute.models.Product;

public class ProductServiceImpl implements ProductService {
    
    // Khởi tạo tầng DAO để tương tác Database
    ProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delete(int id) throws Exception {
        productDao.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productDao.findById(id);
    }

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public List<Product> getTop10Newest() {
        return productDao.getTop10Newest();
    }

    @Override
    public List<Product> findAllWithPagination(int offset, int limit) {
        return productDao.findAllWithPagination(offset, limit);
    }

    @Override
    public int countTotalProducts() {
        return productDao.countTotalProducts();
    }
}