package hcmute.services;

import java.util.Random;

import hcmute.dao.UserDao;
import hcmute.dao.UserDaoImpl;
import hcmute.models.User;
import hcmute.utils.EmailUtil;

public class UserServiceImpl implements UserService {
    
    // Gọi tầng DAO lên để lấy dữ liệu
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassWord())) {
            if (user.getStatus() == 0) {
                return null; // Trả về null hoặc quăng Exception nhắc đi xác thực
            }
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }
    
    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (userDao.checkExistUsername(username) || userDao.checkExistEmail(email)) {
            return false;
        }
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        
        // Tạo chuỗi OTP 6 số ngẫu nhiên
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        String otp = String.format("%06d", number);
        
        // Gọi Constructor có chứa vcode (otp) và status (0)
        User newUser = new User(email, username, fullname, password, null, 5, phone, date, otp, 0);
        userDao.insert(newUser);
        
        // Gửi email
        EmailUtil.sendOTP(email, otp);
        return true;
    }
    
    public boolean checkExistEmail(String email) {
    	return userDao.checkExistEmail(email);
    	}
    
    public boolean checkExistUsername(String username) {
    	return userDao.checkExistUsername(username);
    }
    
    @Override
    	public boolean checkExistPhone(String phone) {
    		return userDao.checkExistPhone(phone);
    	}
    
    @Override
    public void insert(User user) {
    	userDao.insert(user);
    }
    
    @Override
    public boolean verifyOTP(String email, String otp) {
        User user = userDao.getByEmail(email);
        // Kiểm tra user có tồn tại không và mã OTP có khớp không
        if (user != null && otp.equals(user.getVcode())) {
            return true;
        }
        return false;
    }
    
    @Override
    public void updateStatus(String email, int status) {
        userDao.updateStatus(email, status);
    }
    
    @Override
    public void updatePassword(String email, String newPassword) {
        userDao.updatePassword(email, newPassword);
    }

    @Override
    public void updateVcode(String email, String vcode) {
        userDao.updateVcode(email, vcode);
    }
    
    @Override
    public void update(User user) {
        userDao.update(user);
    }
    
}