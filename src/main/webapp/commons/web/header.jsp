<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="url" value="${pageContext.request.contextPath}/template"></c:set>

<!-- TOPBAR: Nơi hiển thị thông tin liên hệ và Nút Đăng xuất/Profile -->
<div id="topbar">
   <div class="container">
      <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
         <div class="top-contact d-flex flex-wrap">
            <span><i class="fas fa-phone-alt"></i>+1 (800) 123-4567</span>
            <span><i class="fas fa-envelope"></i>hello@sarabfood.com</span>
         </div>
         <div class="d-flex align-items-center gap-3">
             <!-- Kiểm tra nếu đã đăng nhập thì hiện Tên, Profile, Đăng xuất -->
             <c:if test="${not empty sessionScope.account}">
                 <span style="color: #fff; font-weight: bold; font-family: Arial;">Xin chào, ${sessionScope.account.fullName}!</span>
                 <a href="${pageContext.request.contextPath}/profile" style="color: #fff; text-decoration: none; padding: 5px 10px; background: #17a2b8; border-radius: 4px; font-size: 14px;">👤 Profile</a>
                 <a href="${pageContext.request.contextPath}/logout" style="color: #fff; text-decoration: none; padding: 5px 10px; background: #dc3545; border-radius: 4px; font-size: 14px;">Đăng xuất</a>
             </c:if>
             <!-- Nếu chưa đăng nhập thì hiện nút Đăng nhập -->
             <c:if test="${empty sessionScope.account}">
                 <a href="${pageContext.request.contextPath}/login" style="color: #fff; text-decoration: none; padding: 5px 15px; background: #0866ff; border-radius: 4px; font-weight: bold;">Đăng nhập</a>
             </c:if>
         </div>
      </div>
   </div>
</div>

<!-- NAVBAR: Thanh menu chính -->
<nav class="navbar navbar-expand-lg" id="nav">
   <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
         <div class="blogo">
            <div class="bico"><i class="fas fa-utensils"></i></div>
            <div>
               <div class="bname">Sar<span>ab</span></div>
               <div class="bsub">Fast Food & Restaurant</div>
            </div>
         </div>
      </a>
      <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
      <i class="fas fa-bars" style="color:var(--primary);font-size:1.35rem;"></i>
      </button>
      <div class="collapse navbar-collapse" id="navmenu">
         <ul class="navbar-nav mx-auto">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Trang Chủ</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/product">Thực Đơn</a></li>
         </ul>
         <div class="d-flex align-items-center gap-1">
            <button id="navSearchBtn" title="Tìm kiếm"><i class="fas fa-search"></i></button>
            <a href="${pageContext.request.contextPath}/product" class="nav-link nav-cta"><i class="fas fa-shopping-bag me-1"></i>Đặt Ngay</a>
         </div>
      </div>
   </div>
</nav>

<!-- SEARCH OVERLAY POPUP: Khung tìm kiếm ẩn -->
<div id="searchOv">
   <button class="sovclose" id="searchClose"><i class="fas fa-times"></i></button>
   <div class="sovbox">
      <h4>Bạn muốn ăn gì hôm nay?</h4>
      <div class="sovinput">
         <input type="text" id="searchInput" placeholder="Tìm burger, gà rán..." autocomplete="off"/>
         <button><i class="fas fa-search"></i></button>
      </div>
   </div>
</div>