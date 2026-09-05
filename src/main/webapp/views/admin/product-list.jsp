<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; padding: 20px; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #0866ff; color: white; }
        img { max-width: 80px; border-radius: 4px; }
        .btn { padding: 6px 12px; text-decoration: none; border-radius: 4px; color: white; font-size: 14px; }
        .btn-add { background-color: #28a745; margin-bottom: 15px; display: inline-block; }
        .btn-edit { background-color: #ffc107; color: black; }
        .btn-delete { background-color: #dc3545; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Sản phẩm</h2>
        
        <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-add">+ Thêm Sản phẩm mới</a>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Danh mục</th>
                    <th>Giá bán</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productList}" var="pro">
                    <tr>
                        <td>${pro.id}</td>
                        <td>
                            <!-- Đường dẫn tải ảnh tùy thuộc vào cấu hình load file tĩnh của bạn -->
                            <c:choose>
                                <c:when test="${pro.image.contains('http')}">
                                    <img src="${pro.image}" alt="img">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/image?fname=${pro.image}" alt="img">
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${pro.name}</td>
                        <!-- Truy xuất tên danh mục thông qua khóa ngoại Category -->
                        <td>${pro.category.name}</td>
                        <td>${pro.price}</td>
                        <td>${pro.createdDate}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/product/edit?id=${pro.id}" class="btn btn-edit">Sửa</a>
                            <a href="${pageContext.request.contextPath}/admin/product/delete?id=${pro.id}" class="btn btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>