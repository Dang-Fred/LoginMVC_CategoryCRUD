<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Thêm JSTL để bắt các sự kiện ẩn/hiện thông báo -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #f0f2f5; margin: 0; }
        .login-box { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 320px; }
        .login-box h2 { text-align: center; margin-bottom: 20px; color: #333; }
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px;}
        .input-group input[type="text"], .input-group input[type="password"] { width: 100%; padding: 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .alert { color: #dc3545; text-align: center; margin-bottom: 10px; font-weight: bold; font-size: 14px; }
        .success { color: #28a745; text-align: center; margin-bottom: 15px; font-weight: bold; font-size: 14px; background: #d4edda; padding: 8px; border-radius: 4px;}
        .btn { width: 100%; padding: 10px; background-color: #0866ff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; font-weight: bold; }
        .btn:hover { background-color: #0056e0; }
        .checkbox-group { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .checkbox-group > div { display: flex; align-items: center; }
        .checkbox-group input { margin-right: 5px; }
        .forgot-link { font-size: 14px; text-decoration: none; color: #0866ff; }
        .forgot-link:hover { text-decoration: underline; }
    </style>
</head>
<body>



    <div class="login-box">
        <h2>Đăng Nhập</h2>
        
        <!-- Khu vực báo lỗi màu đỏ -->
        <c:if test="${not empty alert}">
            <div class="alert">${alert}</div>
        </c:if>

        <!-- Khu vực báo thành công màu xanh (nhận từ URL ?message=...) -->
        <c:if test="${not empty param.message}">
            <div class="success">${param.message}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="input-group">
                <label>Tài khoản</label>
                <input type="text" name="username" placeholder="Nhập username...">
            </div>
            
            <div class="input-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập password...">
            </div>
            
            <div class="checkbox-group">
                <div>
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember" style="font-weight: normal; margin-bottom: 0;">Ghi nhớ</label>
                </div>
                <!-- Nút Quên mật khẩu được đẩy sang góc phải -->
                <a href="${pageContext.request.contextPath}/forgot-password" class="forgot-link">Quên mật khẩu?</a>
            </div>
            
            <button type="submit" class="btn">Đăng Nhập</button>
            <div style="text-align: center; margin-top: 15px; font-size: 14px;">
    			Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" style="text-decoration: none; color: #0866ff;">Đăng ký ngay</a>
			</div>
        </form>
    </div>
    
    
</body>
</html>