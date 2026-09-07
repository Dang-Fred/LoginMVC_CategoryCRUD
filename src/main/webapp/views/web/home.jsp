<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<!DOCTYPE html>
<html>
<head>
    <title>Sarab - Trang Chủ</title>
    
</head>
<body>

    <!-- Gọi chính xác Header -->


    <div class="container">
        <div class="row">
            <div class="col-12">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="https://dummyimage.com/1200x400/55595c/fff" alt="Banner">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Lưới 10 Sản phẩm mới nhất từ Database -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-primary text-white text-uppercase">
                        <i class="fa fa-star"></i> 10 Sản Phẩm Mới Nhất
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${top10Products}" var="pro">
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                                    <div class="card h-100">
                                        <c:choose>
                                            <c:when test="${pro.image.contains('http')}">
                                                <img class="card-img-top" src="${pro.image}" alt="${pro.name}" style="height: 200px; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <img class="card-img-top" src="${pageContext.request.contextPath}/image?fname=${pro.image}" alt="${pro.name}" style="height: 200px; object-fit: cover;">
                                            </c:otherwise>
                                        </c:choose>
                                        
                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-title text-truncate" title="${pro.name}">${pro.name}</h5>
                                            <div class="row mt-auto">
                                                <div class="col-12 mb-2">
                                                    <p class="btn btn-danger btn-block mb-0">
   														 <fmt:formatNumber value="${pro.price}" pattern="#,###" /> VNĐ
													</p>
                                                </div>
                                                <div class="col-12">
                                                    <a href="${pageContext.request.contextPath}/product/detail?id=${pro.id}" class="btn btn-success btn-block">Xem chi tiết</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="text-center mt-3">
                            <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-primary">Xem tất cả sản phẩm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Gọi chính xác Footer -->
   

    <!-- JS -->
    <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>















