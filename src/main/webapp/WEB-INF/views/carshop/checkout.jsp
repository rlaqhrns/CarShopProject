<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


  <title>carshop - checkout</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">


	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Product Checkout</h1>
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
                	
                    <h3>구매자 정보</h3> 
                    <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                        <div class="col-md-6 form-group p_star">받는사람
                            <input type="text" class="form-control" name="name" value='' readonly="readonly">
                            <span class="placeholder" data-placeholder="First name"></span>                            
                        </div>
                        <div class="col-md-6 form-group p_star">아이디
                            <input type="text" class="form-control" id="last" name="id" value='' readonly="readonly">
                            <span class="placeholder" data-placeholder="Last name"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">전화 번호
                            <input type="text" class="form-control" id="number" name="phone" value=''>
                            <span class="placeholder" data-placeholder="Phone number"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">이메일
                            <input type="text" class="form-control" id="email" name="email" value=''>
                            <span class="placeholder" data-placeholder="Email Address"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">주소
                            <input type="text" class="form-control" id="add1" name="add1" value=''>
                            <span class="placeholder" data-placeholder="Address line 01"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">상세 주소
                            <input type="text" class="form-control" id="add2" name="add2" value=''>
                            <span class="placeholder" data-placeholder="Address line 02"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">구매자 차종
                            <input type="text" class="form-control" id="city" name="city" value='' readonly="readonly">
                            <span class="placeholder" data-placeholder="Town/City"></span>
                        </div>                     
                    </form>
                </div>
                <div class="col-lg-4" style="padding-top:80px; padding-bottom:30px">
                    <div class="order_box">
                        <h2>결제 정보</h2>
                        <ul class="list">
                            <li><a href="#"><h4>구매물품<span>상품금액</span></h4></a></li>
                            <li><a href="#"> <span class="middle"></span> <span class="last"></span></a></li>
                            <li><a href="#"> <span class="middle"></span> <span class="last"></span></a></li>
                            <li><a href="#"> <span class="middle"></span> <span class="last"></span></a></li>
                        </ul>
                        <hr>
                        <ul class="list list_2">
                            <li><a href="#">총 금액<span></span></a></li>
                        </ul>
                            <div class="radion_btn">
                                <input type="radio" id="f-option5" name="selector" onchange="setDisplay()">
                                <label>카드선택</label>
                                <div class="check"></div>
                            </div>
                        <div class="payment_item active">
                            <div class="radion_btn">
                                <input type="radio" id="f-option6" name="selector">
                                <label for="f-option6">계좌이체</label>                                
                                <div class="check"></div>
                            </div>
                        </div>
                       	<div class="text-center">
                          <a class="button button-paypal" href="#">Proceed to Paypal</a>
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