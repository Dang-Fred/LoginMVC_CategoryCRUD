<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm: ${product.name}</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f8f9fa; }
        .container { max-width: 900px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); display: flex; gap: 40px; }
        .img-col { flex: 1; }
        .img-col img { width: 100%; border-radius: 8px; object-fit: cover; border: 1px solid #ddd; }
        .info-col { flex: 1.5; }
        .product-name { font-size: 28px; color: #333; margin-top: 0; }
        .product-price { font-size: 24px; color: #dc3545; font-weight: bold; margin: 15px 0; }
        .info-row { font-size: 16px; margin: 10px 0; color: #555; }
        .info-row strong { color: #333; }
        .description { line-height: 1.6; margin-top: 20px; color: #444; background: #f4f7f6; padding: 15px; border-radius: 5px; }
        .btn-buy { margin-top: 25px; padding: 12px 25px; background-color: #28a745; color: white; border: none; font-size: 18px; border-radius: 5px; cursor: pointer; font-weight: bold; width: 100%; transition: 0.2s;}
        .btn-buy:hover { background-color: #218838; }
        .btn-back { display: inline-block; margin-bottom: 20px; color: #0866ff; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div style="max-width: 900px; margin: auto;">
        <a href="javascript:history.back()" class="btn-back">⬅ Quay lại danh sách</a>
    </div>
    
    <div class="container">
        <!-- Cột hiển thị hình ảnh -->
        <div class="img-col">
            <c:choose>
                <c:when test="${product.image.contains('http')}">
                    <img src="${product.image}" alt="${product.name}">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/image?fname=${product.image}" alt="${product.name}">
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Cột hiển thị thông tin -->
        <div class="info-col">
            <h1 class="product-name">${product.name}</h1>
            <div class="product-price">${product.price} VNĐ</div>
            
            <div class="info-row">
                <strong>Danh mục:</strong> ${product.category.name}
            </div>
            <div class="info-row">
                <strong>Ngày cập nhật:</strong> ${product.createdDate}
            </div>
            
            <div class="description">
                <strong>Mô tả chi tiết:</strong><br><br>
                ${product.description}
            </div>
            
            <button class="btn-buy">🛒 Thêm Vào Giỏ Hàng</button>
        </div>
    </div>
</body>
</html>