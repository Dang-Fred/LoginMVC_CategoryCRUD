package hcmute.dao;

import hcmute.models.User;

public interface UserDao {
    User get(String username);
    User getByEmail(String email);
    
    void insert(User user);
    void updateStatus(String email, int status);
    
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    
    void updatePassword(String email, String newPassword);
    void updateVcode(String email, String vcode);
}