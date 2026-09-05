<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Danh Mục</title>
</head>
<body>
    <div style="width: 50%; margin: 50px auto; text-align: center; border: 1px solid #ccc; padding: 20px;">
        <h2>SỬA DANH MỤC</h2>
        
        <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
            <!-- ID bị ẩn đi, người dùng không thấy nhưng vẫn gửi về server -->
            <input type="hidden" name="id" value="${category.id}">
            
            <div style="margin-bottom: 15px;">
                <label>Tên danh sách: </label>
                <input type="text" name="name" value="${category.name}" required>
            </div>
            
            <div style="margin-bottom: 15px;">
                <label>Ảnh đại diện hiện tại: </label><br>
                <img src="${pageContext.request.contextPath}/image?fname=${category.icon}" width="100" height="100" style="margin: 10px 0;"><br>
                
                <label>Chọn ảnh mới (Bỏ trống nếu giữ ảnh cũ): </label>
                <input type="file" name="icon" accept="image/*">
            </div>
            
            <button type="submit" style="padding: 8px 20px; background-color: #ffc107; border: none;">Cập nhật</button>
            <a href="${pageContext.request.contextPath}/admin/category/list" style="margin-left: 10px;">Hủy (Quay lại)</a>
        </form>
    </div>
</body>
</html>