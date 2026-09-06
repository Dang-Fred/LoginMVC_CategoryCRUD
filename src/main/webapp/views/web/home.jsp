<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="url" value="${pageContext.request.contextPath}/template"></c:set>

<!DOCTYPE html>
<html>
<head>
    <title>Sarab - Trang Chủ</title>
</head>
<body>
        <section id="hero">
         <div class="hs hs1"></div>
         <div class="hs hs2"></div>
         <div class="hbgtxt">FOOD</div>
         <div class="container">
            <div class="row align-items-center g-5" style="min-height:88vh;">
               <div class="col-lg-6">
                  <div class="hbadge">
                     <div class="hbi"><i class="fas fa-star"></i></div>
                     <span>#1 Quán Trà Sữa & Đồ Ăn Vặt Được Yêu Thích</span>
                  </div>
                  <h1 class="htitle">Thưởng Thức <span class="hl">Hương Vị</span><br/>Tuyệt Hảo Mỗi Ngày</h1>
                  <p class="hdesc">Trải nghiệm những món đồ uống và thức ăn nhanh được pha chế từ nguyên liệu tươi ngon nhất. Từ trà sữa đậm vị đến những món ăn vặt giòn rụm.</p>
                  <div class="d-flex flex-wrap gap-3 mb-2">
                     <a href="#menu" class="btn-red"><i class="fas fa-utensils"></i>Khám Phá Menu</a>
                     <a href="https://www.youtube.com/watch?v=RXv_uIN6e-Y" class="magnific_popup btn-play popup-youtube">
                        <div class="pico"><i class="fas fa-play"></i></div>
                        <span>Câu Chuyện Của Chúng Tôi</span>
                     </a>
                  </div>
                  <div class="hstats d-flex gap-3 flex-wrap mt-4">
                     <div class="hstat"><span class="snum">850<em>+</em></span><small>Khách Hàng</small></div>
                     <div class="sdiv"></div>
                     <div class="hstat"><span class="snum">120<em>+</em></span><small>Món Ăn</small></div>
                     <div class="sdiv"></div>
                     <div class="hstat"><span class="snum">15<em>+</em></span><small>Đầu Bếp</small></div>
                  </div>
               </div>
               <div class="col-lg-6">
                  <div style="position:relative;text-align:center;">
                     <div class="hcircle">
                        <img src="${url}/img/banner-img.jpg" alt="Burger"/>
                     </div>
                     <div class="fcard fc1">
                        <div class="fcoi r"><i class="fas fa-fire"></i></div>
                        <div><span class="fcnum">Hot Deal</span><span class="fcsm">Giảm 30% hôm nay</span></div>
                     </div>
                     <div class="fcard fc2">
                        <div class="fcoi y"><i class="fas fa-star"></i></div>
                        <div><span class="fcnum">4.9/5</span><span class="fcsm">2k+ đánh giá</span></div>
                     </div>
                     <div class="fcard fc3">
                        <div class="fcoi g"><i class="fas fa-clock"></i></div>
                        <div><span class="fcnum">20 phút</span><span class="fcsm">Giao hàng siêu tốc</span></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      
      <!-- MARQUEE -->
      <div class="mqsec">
         <div class="mqtrack">
            <div class="mqitem"><i class="fas fa-circle"></i>Trà Sữa Trân Châu</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Gà Rán Giòn Rụm</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Bánh Tráng Trộn</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Cá Viên Chiên</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Trà Đào Cam Sả</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Pizza Phô Mai</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Trà Sữa Trân Châu</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Gà Rán Giòn Rụm</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Bánh Tráng Trộn</div>
            <div class="mqitem"><i class="fas fa-circle"></i>Cá Viên Chiên</div>
         </div>
      </div>
      
      <!-- CATEGORY -->
      <section id="category">
         <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
               <span class="slbl">Phân Loại Món Ăn</span>
               <h2 class="stitle">Khám Phá Theo <span>Danh Mục</span></h2>
               <div class="sline"></div>
            </div>
            <div class="row g-3 justify-content-center">
               <div class="col-6 col-sm-4 col-md-3 col-lg-2" data-aos="zoom-in" data-aos-delay="0">
                  <div class="catcard active" data-filter="all">
                     <img class="catimg" src="${url}/img/category/1.jpg" alt=""/>
                     <div class="catnm">Tất Cả</div>
                     <div class="catct">99 món</div>
                  </div>
               </div>
               <div class="col-6 col-sm-4 col-md-3 col-lg-2" data-aos="zoom-in" data-aos-delay="70">
                  <div class="catcard" data-filter="burgers">
                     <img class="catimg" src="${url}/img/category/2.jpg" alt=""/>
                     <div class="catnm">Burgers</div>
                     <div class="catct">24 món</div>
                  </div>
               </div>
               <div class="col-6 col-sm-4 col-md-3 col-lg-2" data-aos="zoom-in" data-aos-delay="140">
                  <div class="catcard" data-filter="pizza">
                     <img class="catimg" src="${url}/img/category/3.jpg" alt=""/>
                     <div class="catnm">Pizza</div>
                     <div class="catct">18 món</div>
                  </div>
               </div>
               <div class="col-6 col-sm-4 col-md-3 col-lg-2" data-aos="zoom-in" data-aos-delay="210">
                  <div class="catcard" data-filter="chicken">
                     <img class="catimg" src="${url}/img/category/4.jpg" alt=""/>
                     <div class="catnm">Gà Rán</div>
                     <div class="catct">15 món</div>
                  </div>
               </div>
               <div class="col-6 col-sm-4 col-md-3 col-lg-2" data-aos="zoom-in" data-aos-delay="280">
                  <div class="catcard" data-filter="wraps">
                     <img class="catimg" src="${url}/img/category/5.jpg" alt=""/>
                     <div class="catnm">Bánh Tráng</div>
                     <div class="catct">12 món</div>
                  </div>
               </div>
               <div class="col-6 col-sm-4 col-md-3 col-lg-2" data-aos="zoom-in" data-aos-delay="350">
                  <div class="catcard" data-filter="desserts">
                     <img class="catimg" src="${url}/img/category/6.jpg" alt=""/>
                     <div class="catnm">Tráng Miệng</div>
                     <div class="catct">20 món</div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- ============================================================
         MENU HIỂN THỊ DỮ LIỆU TỪ DATABASE CỦA BẠN
         ============================================================ -->
      <section id="menu">
         <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
               <span class="slbl">Đang Được Phục Vụ</span>
               <h2 class="stitle">Thực Đơn <span>10 Món Mới Nhất</span></h2>
               <div class="sline"></div>
            </div>
            
            <div class="text-center mb-4" data-aos="fade-up">
               <button class="filtbtn active" data-f="all">Tất Cả</button>
            </div>
            
            <div class="row g-4" id="mgrid">
               <!-- VÒNG LẶP SẢN PHẨM TỪ CSDL -->
               <c:forEach items="${top10Products}" var="pro">
                   <div class="col-sm-6 col-lg-4 mwrap" data-c="all" data-aos="fade-up">
                      <div class="mcard" style="height: 100%; display: flex; flex-direction: column;">
                         <div class="mimg" style="height: 250px;">
                             <!-- Hiển thị ảnh (Kiểm tra Link Web hay Link Upload Cục bộ) -->
                             <c:choose>
                                 <c:when test="${pro.image.contains('http')}">
                                     <img src="${pro.image}" alt="${pro.name}" style="width: 100%; height: 100%; object-fit: cover;"/>
                                 </c:when>
                                 <c:otherwise>
                                     <img src="${pageContext.request.contextPath}/image?fname=${pro.image}" alt="${pro.name}" style="width: 100%; height: 100%; object-fit: cover;"/>
                                 </c:otherwise>
                             </c:choose>
                            <div class="mbdg new"><i class="fas fa-star"></i> Mới</div>
                            <div class="mhrt"><i class="far fa-heart"></i></div>
                         </div>
                         <div class="mbody" style="flex: 1; display: flex; flex-direction: column;">
                            <div class="mcat">Trà Sữa & Đồ Ăn</div>
                            <div class="mtit" style="font-size: 1.25rem;">${pro.name}</div>
                            <div class="mdesc" style="flex: 1;">Sản phẩm nổi bật được chế biến trong ngày đảm bảo hương vị tươi ngon nhất.</div>
                            <div class="mfoot" style="margin-top: auto;">
                               <div>
                                  <div class="mprice">${pro.price} VNĐ</div>
                               </div>
                               <!-- Nút xem chi tiết chuyển sang link Controller của bạn -->
                               <a href="${pageContext.request.contextPath}/product/detail?id=${pro.id}" class="madd" title="Xem Chi Tiết" style="display:flex; align-items:center; justify-content:center; text-decoration:none;"><i class="fas fa-eye"></i></a>
                            </div>
                         </div>
                      </div>
                   </div>
               </c:forEach>
               <!-- HẾT VÒNG LẶP -->
            </div>
            
            <!-- Nút Phân Trang -->
            <div class="text-center mt-5">
                <a href="${pageContext.request.contextPath}/product" class="btn-red">
                    <i class="fas fa-th-large"></i> Xem Tất Cả (Phân Trang)
                </a>
            </div>
         </div>
      </section>

      <!-- MENU DETAIL POPUP MODAL (Giữ lại để không lỗi JS template) -->
      <div id="menuPop">
         <div class="mpbox">
            <button class="mpclose" id="mpClose"><i class="fas fa-times"></i></button>
            <div class="mpimg"><img id="mpImg" src="" alt=""/></div>
            <div class="mpbody">
               <div id="mpCat"></div>
               <div id="mpTitle"></div>
               <div id="mpStars"></div>
               <div id="mpDesc"></div>
               <div id="mpPrice"></div>
               <div class="mpmeta" id="mpMeta"></div>
               <div class="mpqty">
                  <button class="mpqbtn" id="mpMinus">-</button>
                  <span class="mpqnum" id="mpQnum">1</span>
                  <button class="mpqbtn" id="mpPlus">+</button>
                  <span style="font-size:.82rem;color:#aaa;margin-left:9px;">phần</span>
               </div>
               <div class="mptags" id="mpTags"></div>
               <button class="mpaddcart" id="mpAddCart"><i class="fas fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</button>
            </div>
         </div>
      </div>

      <!-- GALLERY -->
      <section id="gallery">
         <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
               <span class="slbl">Thư Viện Ảnh</span>
               <h2 class="stitle">Hình Ảnh <span>Thực Tế</span></h2>
               <div class="sline"></div>
            </div>
            <div class="ggrid" data-aos="fade-up">
               <div class="gitem" data-gi="0" data-gimg="${url}/img/portfolio/work1.jpg" data-gtitle="Gourmet Burgers" data-gdesc="Bánh mì kẹp thịt bò hảo hạng.">
                  <img src="${url}/img/portfolio/work1.jpg" alt="Burgers"/>
                  <div class="gover"><span><i class="fas fa-expand-alt"></i> Gourmet Burgers</span></div>
               </div>
               <div class="gitem" data-gi="1" data-gimg="${url}/img/portfolio/work2.jpg" data-gtitle="Wood-Fired Pizza" data-gdesc="Pizza nướng lò củi truyền thống.">
                  <img src="${url}/img/portfolio/work2.jpg" alt="Pizza"/>
                  <div class="gover"><span><i class="fas fa-expand-alt"></i> Wood-Fired Pizza</span></div>
               </div>
               <div class="gitem" data-gi="2" data-gimg="${url}/img/portfolio/work3.jpg" data-gtitle="Crispy Fried Chicken" data-gdesc="Gà rán giòn rụm tẩm ướp gia vị bí truyền.">
                  <img src="${url}/img/portfolio/work3.jpg" alt="Chicken"/>
                  <div class="gover"><span><i class="fas fa-expand-alt"></i> Crispy Fried Chicken</span></div>
               </div>
               <div class="gitem" data-gi="3" data-gimg="${url}/img/portfolio/work4.jpg" data-gtitle="Sweet Desserts" data-gdesc="Các món tráng miệng ngọt ngào.">
                  <img src="${url}/img/portfolio/work4.jpg" alt="Desserts"/>
                  <div class="gover"><span><i class="fas fa-expand-alt"></i> Sweet Desserts</span></div>
               </div>
               <div class="gitem" data-gi="4" data-gimg="${url}/img/portfolio/work5.jpg" data-gtitle="Fresh Wraps &amp; Rolls" data-gdesc="Cuộn bánh tráng tươi ngon.">
                  <img src="${url}/img/portfolio/work5.jpg" alt="Wraps"/>
                  <div class="gover"><span><i class="fas fa-expand-alt"></i> Fresh Wraps &amp; Rolls</span></div>
               </div>
            </div>
         </div>
      </section>

      <!-- GALLERY POPUP -->
      <div id="galPop">
         <div class="gpbox">
            <button class="gpclose" id="gpClose"><i class="fas fa-times"></i></button>
            <img id="gpImg" src="" alt=""/>
            <div class="gpcap">
               <h5 id="gpTitle"></h5>
               <p id="gpDesc"></p>
            </div>
            <div class="gpnav">
               <button id="gpPrev"><i class="fas fa-chevron-left me-1"></i>Trở Lại</button>
               <button id="gpNext">Tiếp Theo <i class="fas fa-chevron-right ms-1"></i></button>
            </div>
         </div>
      </div>
      
      <!-- CONTACT FORM -->
      <section id="contact-section">
         <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
               <span class="slbl">Liên Hệ Ngay</span>
               <h2 class="stitle">Kết Nối Với <span>Chúng Tôi</span></h2>
               <div class="sline"></div>
               <p class="sdesc mx-auto" style="max-width:480px;">Nếu bạn có bất kỳ câu hỏi nào về thực đơn hoặc phản hồi, vui lòng gửi tin nhắn cho chúng tôi.</p>
            </div>
            <div class="row g-4">
               <div class="col-lg-4" data-aos="fade-right">
                  <div class="ctdark">
                     <h4>Thông Tin Liên Hệ</h4>
                     <p class="ctsub">Chúng tôi thường phản hồi trong vòng 2 giờ làm việc.</p>
                     <div class="ctitem">
                        <div class="cticon"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="ctinfo"><strong>Địa chỉ</strong><span>1 Võ Văn Ngân, Thủ Đức,<br/>TP. Hồ Chí Minh</span></div>
                     </div>
                     <div class="ctitem">
                        <div class="cticon"><i class="fas fa-phone-alt"></i></div>
                        <div class="ctinfo"><strong>Điện thoại</strong><span>+84 123 456 789</span></div>
                     </div>
                     <div class="ctitem">
                        <div class="cticon"><i class="fas fa-envelope"></i></div>
                        <div class="ctinfo"><strong>Email</strong><span>contact@student.hcmute.edu.vn</span></div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-8" data-aos="fade-left">
                  <div class="fcard">
                     <div class="row g-3">
                        <div class="col-sm-6"><label class="flbl">Tên của bạn *</label><input type="text" class="fctrl" placeholder="Nguyễn Văn A"/></div>
                        <div class="col-sm-6"><label class="flbl">Địa chỉ Email *</label><input type="email" class="fctrl" placeholder="you@email.com"/></div>
                        <div class="col-sm-6"><label class="flbl">Số điện thoại</label><input type="tel" class="fctrl" placeholder="0909 xxx xxx"/></div>
                        <div class="col-sm-6">
                           <label class="flbl">Chủ đề *</label>
                           <select class="fctrl">
                              <option>Câu hỏi chung</option>
                              <option>Đặt tiệc / Sự kiện</option>
                              <option>Phản hồi</option>
                           </select>
                        </div>
                        <div class="col-12"><label class="flbl">Lời nhắn *</label><textarea class="fctrl" rows="5" placeholder="Viết tin nhắn của bạn ở đây..."></textarea></div>
                        <div class="col-12"><button class="btn-red" id="ctcBtn"><i class="fas fa-paper-plane"></i>Gửi Tin Nhắn</button></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
    

</body>
</html>

