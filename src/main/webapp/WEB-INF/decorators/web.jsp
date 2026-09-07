<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title><sitemesh:write property='title'/></title>
    <!-- CSS Bootstrap -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/templates/css/style.css" rel="stylesheet" type="text/css">
    <sitemesh:write property='head'/>
</head>

<!-- Khung đỏ để nhận diện Layout đã ốp thành công -->
<body style="border: 10px solid red; padding: 10px;">
    
    <%@ include file="/commons/web/header.jsp"%>
    
    
    <!-- SiteMesh sẽ rót nội dung trang Home vào đây -->
    <sitemesh:write property='body'/>
    
    
    <%@ include file="/commons/web/footer.jsp"%>
    
</body>
</html>