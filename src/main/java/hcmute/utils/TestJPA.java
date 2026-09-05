package hcmute.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import hcmute.models.Category;
import hcmute.models.Video;

public class TestJPA {
    public static void main(String[] args) {
        // Khởi động JPA
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();

        // Tạo một Danh mục mới
        Category cate = new Category();
        cate.setName("Điện thoại Apple");
        cate.setIcon("apple.jpg");
        cate.setStatus(1);

        // Tạo một Video thuộc về danh mục đó
        Video video = new Video();
        video.setVideoId("V002");
        video.setTitle("Review iPhone 15 Pro Max");
        video.setCategory(cate); // Liên kết Video này vào Category kia

        try {
            trans.begin();
            // Đẩy vào Database
            enma.persist(cate); 
            enma.persist(video);
            trans.commit();
            System.out.println("ĐÃ THÊM THÀNH CÔNG DỮ LIỆU VÀO SQL SERVER!");
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            System.out.println("CÓ LỖI XẢY RA!");
        } finally {
            enma.close();
        }
    }
}