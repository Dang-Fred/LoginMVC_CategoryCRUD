package hcmute.dao;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import hcmute.utils.JPAConfig; // Đảm bảo bạn đã có file cấu hình JPA
import hcmute.models.Product;

public class ProductDaoImpl implements ProductDao {

    // --- 1. CÁC HÀM CRUD CƠ BẢN ---
    @Override
    public void insert(Product product) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(product); // Thêm mới
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void update(Product product) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(product); // Cập nhật
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Product product = enma.find(Product.class, id);
            if (product != null) {
                enma.remove(product); // Xóa
            } else {
                throw new Exception("Không tìm thấy sản phẩm");
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public Product findById(int id) {
        EntityManager enma = JPAConfig.getEntityManager();
        Product product = enma.find(Product.class, id);
        return product;
    }

    @Override
    public List<Product> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Product> query = enma.createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();
    }

    // --- 2. CÁC HÀM ĐẶC THÙ (TOP 10, PHÂN TRANG) ---
    @Override
    public List<Product> getTop10Newest() {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Product> query = enma.createQuery("SELECT p FROM Product p ORDER BY p.id DESC", Product.class);
        query.setMaxResults(10);
        return query.getResultList();
    }

    @Override
    public List<Product> findAllWithPagination(int offset, int limit) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Product> query = enma.createQuery("SELECT p FROM Product p", Product.class);
        query.setFirstResult(offset);
        query.setMaxResults(limit);
        return query.getResultList();
    }

    @Override
    public int countTotalProducts() {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT count(p) FROM Product p";
        Query query = enma.createQuery(jpql);
        return ((Long) query.getSingleResult()).intValue();
    }
}