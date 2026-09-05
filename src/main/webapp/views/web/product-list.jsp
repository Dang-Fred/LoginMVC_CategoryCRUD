<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tất Cả Sản Phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f8f9fa; }
        .product-container { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; margin-top: 20px; }
        .product-card { background: white; border: 1px solid #ddd; border-radius: 8px; padding: 15px; width: 220px; text-align: center; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
        .product-img { width: 100%; height: 160px; object-fit: cover; border-radius: 4px; }
        .price { color: #dc3545; font-weight: bold; font-size: 18px; margin: 10px 0; }
        .btn-detail { background-color: #0866ff; color: white; padding: 8px 15px; text-decoration: none; border-radius: 4px; display: inline-block; }
        .pagination { margin-top: 40px; text-align: center; }
        .page-btn { padding: 8px 15px; margin: 0 5px; border: 1px solid #0866ff; text-decoration: none; color: #0866ff; border-radius: 4px; font-weight: bold; }
        .page-btn.active { background-color: #0866ff; color: white; }
        .btn-home { display: inline-block; margin-bottom: 20px; padding: 10px 15px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/home" class="btn-home">⬅ Về Trang Chủ</a>
    <h2 style="text-align: center; color: #0866ff;">Tất Cả Sản Phẩm</h2>
    
    <!-- Danh sách sản phẩm -->
    <div class="product-container">
        <c:forEach items="${productList}" var="pro">
            <div class="product-card">
                <c:choose>
                    <c:when test="${pro.image.contains('http')}">
                        <img src="${pro.image}" alt="${pro.name}" class="product-img">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/image?fname=${pro.image}" alt="${pro.name}" class="product-img">
                    </c:otherwise>
                </c:choose>
                <h3 style="font-size: 16px; color: #333; margin: 10px 0;">${pro.name}</h3>
                <p class="price">${pro.price} VNĐ</p>
                <a href="${pageContext.request.contextPath}/product/detail?id=${pro.id}" class="btn-detail">Xem chi tiết</a>
            </div>
        </c:forEach>
    </div>

    <!-- Thanh phân trang -->
    <div class="pagination">
        <c:forEach begin="1" end="${endPage}" var="i">
            <a href="${pageContext.request.contextPath}/product?page=${i}" 
               class="page-btn ${currentPage == i ? 'active' : ''}">
                ${i}
            </a>
        </c:forEach>
    </div>
</body>
</html>