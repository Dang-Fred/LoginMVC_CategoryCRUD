<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Cập nhật Hồ Sơ</title>
</head>
<body>
    <div style="max-width: 500px; margin: 40px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px;">
        <h2 style="color: #0866ff; text-align: center;">Hồ Sơ Cá Nhân</h2>
        
        <p style="color: green; text-align: center;">${message}</p>

        <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
            
            <div style="text-align: center; margin-bottom: 20px;">
                <c:choose>
                    <c:when test="${not empty sessionScope.user.avatar}">
                        <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.user.avatar}" 
                             style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover;">
                    </c:when>
                    <c:otherwise>
                        <img src="https://via.placeholder.com/120" style="width: 120px; height: 120px; border-radius: 50%;">
                    </c:otherwise>
                </c:choose>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Họ và Tên:</label><br>
                <input type="text" name="fullName" value="${sessionScope.user.fullName}" required style="width: 100%; padding: 8px;">
            </div>

            <div style="margin-bottom: 15px;">
                <label>Số điện thoại:</label><br>
                <input type="text" name="phone" value="${sessionScope.user.phone}" required style="width: 100%; padding: 8px;">
            </div>

            <div style="margin-bottom: 20px;">
                <label>Đổi ảnh đại diện mới:</label><br>
                <input type="file" name="image" style="width: 100%; padding: 8px;">
            </div>

            <button type="submit" style="width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 4px; font-weight: bold;">
                Lưu Thay Đổi
            </button>
        </form>
    </div>
</body>