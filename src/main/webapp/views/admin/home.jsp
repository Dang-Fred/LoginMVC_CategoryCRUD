<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bảng Điều Khiển Admin</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .dashboard-container { max-width: 700px; margin: 40px auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); text-align: center; }
        .admin-title { color: #dc3545; margin-bottom: 5px; }
        .info-box { background-color: #f8f9fa; border: 1px solid #dee2e6; padding: 15px 25px; border-radius: 5px; margin: 25px 0; text-align: left; }
        .info-box p { margin: 8px 0; font-size: 15px; }
        .action-buttons { display: flex; justify-content: center; gap: 20px; margin-top: 20px; flex-wrap: wrap; }
        .btn { padding: 12px 25px; color: white; text-decoration: none; font-size: 16px; font-weight: bold; border-radius: 5px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); transition: opacity 0.2s; display: inline-flex; align-items: center; gap: 8px;}
        .btn:hover { opacity: 0.85; }
        .btn-category { background-color: #28a745; }
        .btn-product { background-color: #0866ff; }
        .btn-logout { background-color: #6c757d; margin-top: 30px; display: inline-block; padding: 10px 20px; color: white; text-decoration: none; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="dashboard-container">
        
        <h1 class="admin-title">⚙️ Bảng Điều Khiển Quản Trị</h1>
        <h2 style="margin-top: 0;">Xin chào, ${sessionScope.account.fullName}!</h2>
        
        <div class="info-box">
            <h3 style="margin-top: 0; color: #333;">Thông tin tài khoản:</h3>
            <p><b>Tên đăng nhập:</b> ${sessionScope.account.userName}</p>
            <p><b>Email:</b> ${sessionScope.account.email}</p>
            <p><b>Quyền hạn:</b> <span style="color:red; font-weight: bold;">Quản trị viên (Admin)</span></p>
        </div>
        
        <h3 style="color: #444;">Chọn chức năng quản lý:</h3>
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-category">
                📂 Quản lý Danh Mục
            </a>
            <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-product">
                📦 Quản lý Sản Phẩm
            </a>
        </div>
        
        <br>
        <a href="${pageContext.request.contextPath}/logout" class="btn-logout">
           Đăng xuất
        </a>
    </div>
</body>
</html>