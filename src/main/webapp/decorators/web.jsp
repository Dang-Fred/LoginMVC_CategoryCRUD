<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title><sitemesh:write property='title'/></title>
    <sitemesh:write property='head'/>
</head>
<body>
    <!-- Nhúng Header từ thư mục commons -->
    <jsp:include page="/commons/web/header.jsp"/>

    <!-- Nội dung động của từng trang (ví dụ: profile.jsp) sẽ đổ vào đây -->
    <div class="main-content">
        <sitemesh:write property='body'/>
    </div>

    <!-- Nhúng Footer từ thư mục commons -->
    <jsp:include page="/commons/web/footer.jsp"/>
</body>
</html>