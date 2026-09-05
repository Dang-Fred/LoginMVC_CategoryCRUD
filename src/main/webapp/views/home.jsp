<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ Hệ Thống</title>
</head>
<body>
    <div style="text-align: center; margin-top: 50px; font-family: Arial, sans-serif;">
        
        <!-- Lấy fullname và username từ biến account trong Session -->
        <h1 style="color: #0866ff;">Xin chào, ${sessionScope.account.fullName}!</h1>
        
        <h3>Thông tin tài khoản của bạn:</h3>
        <p><b>Tên đăng nhập:</b> ${sessionScope.account.userName}</p>
        <p><b>Email:</b> ${sessionScope.account.email}</p>
        
        <!-- In chức vụ dựa vào roleid -->
        <p><b>Chức vụ:</b> 
            ${sessionScope.account.roleid == 1 ? '<span style="color:red;">Quản trị viên (Admin)</span>' : 'Thành viên (User)'}
        </p>
        
        <br>
        <a href="${pageContext.request.contextPath}/logout" 
           style="padding: 10px 20px; background-color: #dc3545; color: white; text-decoration: none; border-radius: 5px;">
           Đăng xuất
        </a>
        <a href="${pageContext.request.contextPath}/admin/category/list" 
       	style="display: inline-block; padding: 12px 25px; background-color: #28a745; color: white; text-decoration: none; font-size: 16px; font-weight: bold; border-radius: 5px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
       	⚙️ Đi tới Quản lý Danh Mục
    	</a>
    </div>
</body>
</html>