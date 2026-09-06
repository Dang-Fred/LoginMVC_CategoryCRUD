<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Tạo biến url trỏ thẳng vào thư mục template -->
<c:set var="url" value="${pageContext.request.contextPath}/template"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><sitemesh:write property='title'/></title>
    
    <!-- Link CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700;900&family=Poppins:wght@300;400;500;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet"/>
    <link href="${url}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${url}/css/aos.css" rel="stylesheet"/>
    <link href="${url}/css/swiper-bundle.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${url}/css/all.min.css"/>
    <link rel="stylesheet" href="${url}/css/magnific-popup.css"/>
    <link rel="stylesheet" href="${url}/css/style.css" />
    
    <sitemesh:write property='head'/>
</head>
<body>
    <!-- Nhúng thanh điều hướng Header -->
    <jsp:include page="/commons/web/header.jsp"/>

    <!-- Phần lõi thay đổi theo từng trang -->
    <sitemesh:write property='body'/>

    <!-- Nhúng chân trang Footer -->
    <jsp:include page="/commons/web/footer.jsp"/>

    <!-- Nút cuộn lên đầu trang -->
    <button id="btt" onclick="window.scrollTo({top:0,behavior:'smooth'})"><i class="fas fa-chevron-up"></i></button>

    <!-- Link JS -->
    <script src="${url}/js/jquery-3.7.1.min.js"></script>
    <script src="${url}/js/bootstrap.bundle.min.js"></script>
    <script src="${url}/js/aos.js"></script>
    <script src="${url}/js/swiper-bundle.min.js"></script>
    <script src="${url}/js/jquery.magnific-popup.min.js"></script>
    <script src="${url}/js/main.js"></script>
</body>
</html>