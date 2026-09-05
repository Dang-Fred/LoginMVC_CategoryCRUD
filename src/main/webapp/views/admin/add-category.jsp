<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Danh Mục</title>
</head>
<body>
    <div style="width: 50%; margin: 50px auto; text-align: center; border: 1px solid #ccc; padding: 20px;">
        <h2>THÊM DANH MỤC MỚI</h2>
        
        <!-- Action trỏ về AddController. Bắt buộc phải có enctype -->
        <form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data">
            <div style="margin-bottom: 15px;">
                <label>Tên danh mục: </label>
                <input type="text" name="name" required placeholder="Nhập tên danh mục...">
            </div>
            
            <div style="margin-bottom: 15px;">
                <label>Ảnh đại diện: </label>
                <!-- Thẻ input type="file" để chọn ảnh -->
                <input type="file" name="icon" accept="image/*" required>
            </div>
            
            <button type="submit" style="padding: 8px 20px; background-color: #28a745; color: white; border: none;">Thêm mới</button>
            <a href="${pageContext.request.contextPath}/admin/category/list" style="margin-left: 10px;">Hủy (Quay lại)</a>
        </form>
    </div>
</body>
</html>