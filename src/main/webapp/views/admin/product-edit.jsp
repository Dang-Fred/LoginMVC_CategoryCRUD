<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Sản Phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; padding: 20px; }
        .form-box { background: white; padding: 30px; border-radius: 8px; max-width: 500px; margin: auto; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input, .form-group textarea, .form-group select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { width: 100%; padding: 10px; background-color: #ffc107; color: black; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; margin-top: 10px; font-weight: bold;}
        .btn:hover { background-color: #e0a800; }
        .old-img { max-width: 150px; display: block; margin-bottom: 10px; border-radius: 4px; border: 1px solid #ddd; }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Cập nhật Sản Phẩm</h2>
        <form action="${pageContext.request.contextPath}/admin/product/edit" method="post" enctype="multipart/form-data">
            <!-- Trường ẩn lưu ID để đẩy xuống hàm doPost -->
            <input type="hidden" name="id" value="${product.id}">

            <div class="form-group">
                <label>Tên sản phẩm</label>
                <input type="text" name="name" value="${product.name}" required>
            </div>

            <div class="form-group">
                <label>Giá bán (VNĐ)</label>
                <input type="number" name="price" value="${product.price}" required>
            </div>

            <div class="form-group">
                <label>Hình ảnh hiện tại</label>
                <c:choose>
                    <c:when test="${product.image.contains('http')}">
                        <img src="${product.image}" class="old-img" alt="Ảnh cũ">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/image?fname=${product.image}" class="old-img" alt="Ảnh cũ">
                    </c:otherwise>
                </c:choose>
                <label>Đổi ảnh mới (Bỏ trống nếu muốn giữ nguyên)</label>
                <input type="file" name="image">
            </div>

            <div class="form-group">
                <label>Mô tả</label>
                <textarea name="description" rows="4">${product.description}</textarea>
            </div>

            <div class="form-group">
                <label>Thuộc Danh mục</label>
                <select name="cate_id" required>
                    <c:forEach items="${cateList}" var="cate">
                        <option value="${cate.cateId}" ${cate.cateId == product.category.cateId ? 'selected' : ''}>
                            ${cate.cateName} <!-- Cập nhật tên hàm lấy tên danh mục cho chuẩn với Entity của bạn -->
                        </option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn">Lưu Thay Đổi</button>
        </form>
    </div>
</body>
</html>