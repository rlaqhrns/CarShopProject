<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


  <title>carshop - checkout</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">


	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>상품 구매 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Checkout</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
        <div class="billing_details">
            <div class="row">
                <div class="col-lg-8" style="padding-top:30px; padding-bottom:30px">
                	    <!-- 일반 유저 테이블 에서 실명, 아이디, 전화번호, 이메일, 주소(대분류), 상세주소(소분류), 차종 jstl로 가져오기 (2020.12.18 재원)  -->
                    <h3>구매자 정보</h3> 
                    <form class="row contact_form" action="buylist" method="post" novalidate="novalidate">
                        <div class="col-md-6 form-group p_star">받는사람
                            <input type="text" class="form-control" name="name" value='${pUser.name}' readonly="readonly">
                            <span class="placeholder" data-placeholder="First name"></span>                            
                        </div>
                        <div class="col-md-6 form-group p_star">아이디
                            <input type="text" class="form-control" id="last" name="id" value='${pUser.id}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Last name"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">전화 번호
                            <input type="text" class="form-control" id="number" name="phone" value='${pUser.phone}'>
                            <span class="placeholder" data-placeholder="Phone number"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">이메일
                            <input type="text" class="form-control" id="email" name="email" value='${pUser.email}'>
                            <span class="placeholder" data-placeholder="Email Address"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">주소
                            <input type="text" class="form-control" id="add1" name="main_address" value='${pUser.main_address}'>
                            <span class="placeholder" data-placeholder="Address line 01"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">상세 주소
                            <input type="text" class="form-control" id="add2" name="detail_address" value='${pUser.detail_address}'>
                            <span class="placeholder" data-placeholder="Address line 02"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">구매자 차종
                            <input type="text" class="form-control" id="city" name="cars" value='${pUser.cars}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Town/City"></span>
                        </div>                     
                    </form>
                </div>
                <div class="col-lg-4" style="padding-top:80px; padding-bottom:30px">
                    <div class="order_box">
                      <h2>결제 정보</h2>
                      <!-- 장바구니 테이블 에서 상품명, 상품번호, 상품수량, 상품 금액 jstl로 가져오기 (2020.12.18 재원)  -->
                       <c:forEach items="${cartList}" var ="cart" varStatus="status">
                        <ul class="list">
                            <li><c:out value="${cart.pname}"></c:out><c:out value="${cart.pno}"></c:out><span class="middle"><c:out value="${cart.quantity}"></c:out></span><span class="last"><c:out value="${cart.amount}"></c:out></span></li>
                        	<li><c:out value="${cart.pname}"></c:out><c:out value="${cart.pno}"></c:out><span class="middle"><c:out value="${cart.quantity}"></c:out></span><span class="last"><c:out value="${cart.amount}"></c:out></span></li>
                        	<li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                        </ul>
                        </c:forEach>
                        <hr>
                        <ul class="list list_2">
                            <li><a href="#">총 금액<span><c:out value="${cart.total}"></c:out></span></a></li>
                        </ul>
                        <!-- Todo : 결제 수단 (pay)가 구매이력 테이블에 들어가야함 (2020.12.18 재원) -->
                        <div class="payment_item">
                            <div class="radion_btn">
                                <input type="radio" id="f-option5" name="pay">
                                <label for="f-option5">신용카드</label>
                                <div class="check"></div>
                            </div>
                        </div>
                        <div class="payment_item active">
                            <div class="radion_btn">
                                <input type="radio" id="f-option6" name="pay">
                                <label for="f-option6">계좌이체</label>                                
                                <div class="check"></div>
                            </div>
                        </div>
                       	<div class="text-center">
                          <a class="button button-paypal" href="#">결제하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->



  <!--================ Start footer Area  =================-->	

<%@ include file="../include/footer.jsp"%>