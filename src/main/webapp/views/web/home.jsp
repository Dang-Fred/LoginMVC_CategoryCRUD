<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Cần taglib này để chạy vòng lặp sản phẩm -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Khách Hàng</title>
    <style>
        .product-container { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; margin-top: 30px; }
        .product-card { border: 1px solid #ccc; border-radius: 8px; padding: 15px; width: 220px; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .product-img { width: 100%; height: 150px; object-fit: cover; border-radius: 4px; }
        .product-price { color: red; font-weight: bold; font-size: 18px; }
        .btn-detail { background-color: #0866ff; color: white; padding: 8px 15px; text-decoration: none; border-radius: 4px; display: inline-block; margin-top: 10px; }
    </style>
</head>
<body>
    <div style="text-align: center; margin-top: 50px; font-family: Arial, sans-serif;">
        
        <h1 style="color: #0866ff;">Xin chào, ${sessionScope.account.fullName}!</h1>
        
        <h3>Thông tin tài khoản của bạn:</h3>
        <p><b>Tên đăng nhập:</b> ${sessionScope.account.userName}</p>
        <p><b>Email:</b> ${sessionScope.account.email}</p>
        
        <p><b>Chức vụ:</b> 
            ${sessionScope.account.roleid == 1 ? '<span style="color:red;">Quản trị viên (Admin)</span>' : 'Thành viên (User)'}
        </p>
        
        <br>
        <a href="${pageContext.request.contextPath}/logout" 
           style="padding: 10px 20px; background-color: #dc3545; color: white; text-decoration: none; border-radius: 5px;">
           Đăng xuất
        </a>
        <!-- Đã xóa bỏ các nút tới trang Quản lý Category và Product ở đây -->
    </div>

    <hr style="margin: 40px 0; border: 0; border-top: 1px solid #eee;">

    <!-- HIỂN THỊ 10 SẢN PHẨM MỚI NHẤT DÀNH CHO USER -->
    <div style="text-align: center; font-family: Arial, sans-serif; padding-bottom: 50px;">
        <h2>🔥 10 Sản Phẩm Mới Nhất 🔥</h2>
        
        <div class="product-container">
            <c:forEach items="${top10Products}" var="pro">
                <div class="product-card">
                    <!-- Hiển thị ảnh -->
                    <c:choose>
                        <c:when test="${pro.image.contains('http')}">
                            <img src="${pro.image}" alt="${pro.name}" class="product-img">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image?fname=${pro.image}" alt="${pro.name}" class="product-img">
                        </c:otherwise>
                    </c:choose>
                    
                    <h3>${pro.name}</h3>
                    <p class="product-price">${pro.price} VNĐ</p>
                    
                    <!-- Link chuyển sang trang Chi tiết -->
                    <a href="${pageContext.request.contextPath}/product/detail?id=${pro.id}" class="btn-detail">Xem chi tiết</a>
                </div>
            </c:forEach>
        </div>
        
        <!-- Nút chuyển tới trang xem toàn bộ (Phân trang) -->
        <div style="margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/product" style="font-size: 16px; color: #0866ff; text-decoration: underline; font-weight: bold;">
                Xem tất cả sản phẩm (Phân trang) ➔
            </a>
        </div>
    </div>
</body>
</html>