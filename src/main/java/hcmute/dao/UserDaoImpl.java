package hcmute.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hcmute.models.User;
import hcmute.utils.DBConnection;
import hcmute.utils.JPAConfig;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class UserDaoImpl implements UserDao {
    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;

    @Override
    public User get(String username) {
        String sql = "SELECT * FROM [User] WHERE username = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUserName(rs.getString("username"));
                user.setFullName(rs.getString("fullname"));
                user.setPassWord(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleid(rs.getInt("roleid"));
                user.setPhone(rs.getString("phone"));
                user.setCreatedDate(rs.getDate("createdDate"));
                // Lấy thêm vcode và status
                user.setVcode(rs.getString("vcode"));
                user.setStatus(rs.getInt("status"));
                return user; 
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return null;
    }

    // HÀM MỚI: Lấy User bằng Email để đối chiếu OTP
    @Override
    public User getByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUserName(rs.getString("username"));
                user.setFullName(rs.getString("fullname"));
                user.setPassWord(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleid(rs.getInt("roleid"));
                user.setPhone(rs.getString("phone"));
                user.setCreatedDate(rs.getDate("createdDate"));
                user.setVcode(rs.getString("vcode"));
                user.setStatus(rs.getInt("status"));
                return user; 
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return null;
    }

    @Override
    public void insert(User user) {
        // CẬP NHẬT SQL: Thêm vcode và status
        String sql = "INSERT INTO [User](email, username, fullname, password, avatar, roleid, phone, createddate, vcode, status) VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getPassWord());
            ps.setString(5, user.getAvatar());
            ps.setInt(6, user.getRoleid());
            ps.setString(7, user.getPhone());
            ps.setDate(8, user.getCreatedDate());
            // Truyền thêm 2 tham số mới
            ps.setString(9, user.getVcode());
            ps.setInt(10, user.getStatus());
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // HÀM MỚI: Cập nhật trạng thái sau khi nhập đúng OTP
    @Override
    public void updateStatus(String email, int status) {
        String sql = "UPDATE [User] SET status = ? WHERE email = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        boolean duplicate = false;
        String query = "SELECT * FROM [user] WHERE email = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) duplicate = true;
            ps.close();
            conn.close();
        } catch (Exception ex) {}
        return duplicate;
    }
    
    @Override
    public boolean checkExistUsername(String username) {
        boolean duplicate = false;
        String query = "SELECT * FROM [User] WHERE username = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) duplicate = true;
            ps.close();
            conn.close();
        } catch (Exception ex) {}
        return duplicate;
    }
    
    @Override
    public boolean checkExistPhone(String phone) {
        boolean duplicate = false;
        String query = "SELECT * FROM [User] WHERE phone = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            rs = ps.executeQuery();
            if (rs.next()) duplicate = true;
            ps.close();
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return duplicate;
    }
    @Override
    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE [User] SET password = ? WHERE email = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void updateVcode(String email, String vcode) {
        String sql = "UPDATE [User] SET vcode = ? WHERE email = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, vcode);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    @Override
    public void update(User user) {
        // Lưu ý: Đổi JPAConfig thành class cấu hình EntityManager của bạn nếu tên khác
        EntityManager enma = JPAConfig.getEntityManager(); 
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            // Lệnh merge() của JPA sẽ tự động kiểm tra, 
            // nếu đối tượng đã có ID trong CSDL, nó sẽ thực hiện UPDATE
            enma.merge(user); 
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }
}