<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Simple Ecommerce</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <!-- Menu chính -->
            <ul class="navbar-nav m-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/category">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                </li>
            </ul>

            <!-- Thanh tìm kiếm -->
            <form class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

            <%-- Khối kiểm tra Đăng nhập/Chưa đăng nhập (Sử dụng ghi chú JSP để tránh lỗi 500) --%>
            <ul class="navbar-nav ml-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <%-- Đã đăng nhập: Hiện tên user và nút Giỏ hàng --%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white font-weight-bold" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user-circle"></i> ${sessionScope.account.fullName}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                                    <i class="fa fa-id-card"></i> Thông tin cá nhân
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
                                    <i class="fa fa-sign-out"></i> Đăng xuất
                                </a>
                            </div>
                        </li>
                        <li class="nav-item ml-2">
                            <a class="btn btn-success btn-sm mt-1" href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">3</span>
                            </a>
                        </li>
                    </c:when>
                    
                    <c:otherwise>
                        <%-- Chưa đăng nhập: Hiện nút Đăng nhập / Đăng ký --%>
                        <li class="nav-item mr-2">
                            <a class="btn btn-outline-light btn-sm mt-1 font-weight-bold" href="${pageContext.request.contextPath}/login">
                                Đăng nhập
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-primary btn-sm mt-1 font-weight-bold" href="${pageContext.request.contextPath}/register">
                                Đăng ký
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">E-COMMERCE BOOTSTRAP THEME</h1>
        <p class="lead text-muted mb-0">Simple theme for e-commerce buid with Bootstrap 4.0.0. Pages available : home, category, product, cart & contact</p>
    </div>
</section>