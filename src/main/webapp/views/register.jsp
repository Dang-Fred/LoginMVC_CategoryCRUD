<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; background-color: #f0f2f5; margin: 0; padding: 20px; box-sizing: border-box;}
        .login-box { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 350px; }
        .login-box h2 { text-align: center; margin-bottom: 20px; color: #333; }
        .input-group { margin-bottom: 12px; }
        .input-group label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px;}
        .input-group input { width: 100%; padding: 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .alert { color: #dc3545; text-align: center; margin-bottom: 15px; font-weight: bold; font-size: 14px; min-height: 20px;}
        .btn { width: 100%; padding: 10px; background-color: #0866ff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; font-weight: bold; margin-top: 10px;}
        .btn:hover { background-color: #0056e0; }
        .link-group { text-align: center; margin-top: 15px; font-size: 14px; }
        .link-group a { color: #0866ff; text-decoration: none; font-weight: bold; }
        .link-group a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Đăng Ký</h2>
        
        <!-- Chỗ in câu báo lỗi từ Controller đẩy sang (trùng username, email...) -->
        <div class="alert">${alert}</div>
        
        <!-- action trỏ thẳng về RegisterController -->
        <form action="${pageContext.request.contextPath}/register" method="post">
            
            <div class="input-group">
                <label>Họ và tên</label>
                <input type="text" name="fullname" placeholder="Nhập họ tên..." required>
            </div>
            
            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="Nhập email..." required>
            </div>

            <div class="input-group">
                <label>Số điện thoại</label>
                <input type="text" name="phone" placeholder="Nhập số điện thoại..." required>
            </div>

            <div class="input-group">
                <label>Tài khoản</label>
                <input type="text" name="username" placeholder="Nhập username..." required>
            </div>
            
            <div class="input-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập password..." required>
            </div>
            
            <button type="submit" class="btn">Tạo Tài Khoản</button>
            
            <!-- Link quay lại trang Đăng nhập -->
            <div class="link-group">
                Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập tại đây</a>
            </div>
        </form>
    </div>
</body>
</html>