<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Khai báo thư viện JSTL chuẩn của Jakarta -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác thực tài khoản</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .verify-box { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 100%; max-width: 400px; text-align: center; }
        .verify-box h2 { margin-top: 0; color: #333; }
        .verify-box p { color: #666; font-size: 14px; margin-bottom: 20px; line-height: 1.5; }
        .form-group { text-align: left; margin-bottom: 20px; }
        .form-group input { width: 100%; padding: 12px; font-size: 18px; text-align: center; letter-spacing: 5px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        .btn-submit { width: 100%; padding: 12px; background-color: #007bff; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; transition: 0.3s; }
        .btn-submit:hover { background-color: #0056b3; }
        .error-msg { color: #dc3545; background: #f8d7da; padding: 10px; border-radius: 5px; margin-bottom: 15px; font-size: 14px; }
    </style>
</head>
<body>

    <div class="verify-box">
        <h2>Nhập mã OTP</h2>
        <!-- sessionScope.email tự động lấy email bạn đã lưu bên RegisterController -->
        <p>Chúng tôi đã gửi một mã gồm 6 chữ số đến email <b>${sessionScope.email}</b>. Vui lòng kiểm tra hộp thư của bạn.</p>

        <!-- Nếu có biến error từ VerifyController gửi sang thì in ra thẻ div màu đỏ -->
        <c:if test="${not empty error}">
            <div class="error-msg">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/verify" method="post">
            <div class="form-group">
                <!-- Ràng buộc nhập đúng 6 chữ số -->
                <input type="text" name="otp" required maxlength="6" pattern="\d{6}" placeholder="------" autocomplete="off">
            </div>
            <button type="submit" class="btn-submit">Kích hoạt tài khoản</button>
        </form>
    </div>

</body>
</html>