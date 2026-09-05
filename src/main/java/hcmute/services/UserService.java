package hcmute.services;

import hcmute.models.User;

public interface UserService {
    User login(String username, String password);
    User get(String username);
    void insert(User user);
    boolean register(String username, String password, String email, String fullname, String phone);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    boolean verifyOTP(String email, String otp);
    void updateStatus(String email, int status);
    
    void updatePassword(String email, String newPassword);
    void updateVcode(String email, String vcode);
}