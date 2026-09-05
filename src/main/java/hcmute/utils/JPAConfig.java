package hcmute.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    public static EntityManager getEntityManager() {
        // Chữ "LoginMVC_PU" này phải khớp y hệt với tên thẻ <persistence-unit> trong file xml nhé
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("LoginMVC_PU");
        return factory.createEntityManager();
    }
}