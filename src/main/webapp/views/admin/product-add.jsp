<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Sản Phẩm Mới</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; padding: 20px; }
        .form-box { background: white; padding: 30px; border-radius: 8px; max-width: 500px; margin: auto; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input, .form-group textarea, .form-group select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; margin-top: 10px;}
        .btn:hover { background-color: #218838; }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Thêm Sản Phẩm Mới</h2>
        <form action="${pageContext.request.contextPath}/admin/product-add" method="post">
        	<!-- Đổi input nhập text thành input file -->
   			 <div class="form-group">
       			 <label>Hình ảnh sản phẩm</label>
        		<input type="file" name="image" required>
    		</div>
    		
            <div class="form-group">
                <label>Tên sản phẩm</label>
                <input type="text" name="name" required>
            </div>
            
            <div class="form-group">
                <label>Giá bán (VNĐ)</label>
                <input type="number" name="price" required>
            </div>
            
            <div class="form-group">
                <label>Hình ảnh (Nhập URL hoặc tên file)</label>
                <input type="text" name="image">
            </div>

            <div class="form-group">
                <label>Mô tả</label>
                <textarea name="description" rows="4"></textarea>
            </div>

            <div class="form-group">
                <label>Thuộc Danh mục</label>
                <select name="cate_id" required>
                    <!-- Lấy cateList từ Controller đổ ra -->
                    <c:forEach items="${cateList}" var="cate">
                        <option value="${cate.cateId}">${cate.cateName}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn">Lưu Sản Phẩm</button>
        </form>
    </div>
</body>
</html>