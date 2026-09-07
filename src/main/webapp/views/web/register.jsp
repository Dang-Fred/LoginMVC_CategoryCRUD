<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <!-- SiteMesh Layout Trigger -->
    <meta name="decorator" content="/web.jsp" />
</head>
<body>
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Đăng Ký Tài Khoản</h4>
                    </div>
                    <div class="card-body p-4">
                        
                        <!-- Báo lỗi chung từ DB (Trùng tài khoản, email...) -->
                        <c:if test="${not empty alert}">
                            <div class="alert alert-danger text-center font-weight-bold">${alert}</div>
                        </c:if>
                        
                        <!-- Lớp needs-validation để kích hoạt Bootstrap báo lỗi đỏ -->
                        <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                            
                            <div class="form-group">
                                <label class="font-weight-bold">Họ và tên</label>
                                <input type="text" class="form-control ${not empty errorFullname ? 'is-invalid' : ''}" 
                                       name="fullname" value="${param.fullname}" required>
                                <div class="invalid-feedback">
                                    ${not empty errorFullname ? errorFullname : 'Vui lòng nhập họ tên.'}
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="font-weight-bold">Email</label>
                                <input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" 
                                       name="email" value="${param.email}" required>
                                <div class="invalid-feedback">
                                    ${not empty errorEmail ? errorEmail : 'Vui lòng nhập email hợp lệ.'}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Số điện thoại</label>
                                <input type="text" class="form-control ${not empty errorPhone ? 'is-invalid' : ''}" 
                                       name="phone" value="${param.phone}" pattern="\d{10,11}" required>
                                <div class="invalid-feedback">
                                    ${not empty errorPhone ? errorPhone : 'Số điện thoại phải từ 10 đến 11 số.'}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Tài khoản</label>
                                <input type="text" class="form-control ${not empty errorUsername ? 'is-invalid' : ''}" 
                                       name="username" value="${param.username}" minlength="5" required>
                                <div class="invalid-feedback">
                                    ${not empty errorUsername ? errorUsername : 'Tài khoản phải có ít nhất 5 ký tự.'}
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="font-weight-bold">Mật khẩu</label>
                                <input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" 
                                       name="password" minlength="6" required>
                                <div class="invalid-feedback">
                                    ${not empty errorPassword ? errorPassword : 'Mật khẩu phải có ít nhất 6 ký tự.'}
                                </div>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-block font-weight-bold mt-4">Tạo Tài Khoản</button>
                            
                            <div class="text-center mt-3">
                                Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="text-primary font-weight-bold">Đăng nhập tại đây</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Script Kích hoạt Bootstrap Validation -->
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>