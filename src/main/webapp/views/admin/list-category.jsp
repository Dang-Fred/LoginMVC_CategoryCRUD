<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Danh Mục</title>
    <style>
        table { width: 80%; margin: 20px auto; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #0866ff; color: white; }
        .btn { padding: 5px 10px; text-decoration: none; border-radius: 3px; color: white; }
        .btn-add { background-color: #28a745; margin-left: 10%; display: inline-block; padding: 10px 15px;}
        .btn-edit { background-color: #ffc107; color: black; }
        .btn-delete { background-color: #dc3545; }
    </style>
</head>
<body>
    <h2 style="text-align: center;">DANH SÁCH DANH MỤC</h2>
    
    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-add">+ Thêm Danh Mục Mới</a>

    <table>
        <tr>
            <th>STT</th>
            <th>Ảnh đại diện (Icon)</th>
            <th>Tên danh mục</th>
            <th>Thao tác</th>
        </tr>
        
        <!-- Dùng vòng lặp JSTL để in danh sách ra bảng -->
        <c:forEach items="${cateList}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index + 1}</td>
                <td>
                    <!-- Gọi Controller /image để load ảnh -->
                    <img src="${pageContext.request.contextPath}/image?fname=${cate.icon}" width="80" height="80" alt="Icon">
                </td>
                <td>${cate.name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}" class="btn btn-edit">Sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}" class="btn btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>