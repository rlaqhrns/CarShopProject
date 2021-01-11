<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!--================ End Header Menu Area =================-->
<!--
 <div class="container h-100">
	<div class="d-flex justify-content-center h-100">
		<div class="searchbar">
			<input class="search_input" type="text" name=""
				placeholder="Search..."> <a href="#" class="search_icon"><i
				class="fas fa-search"></i></a>
		</div>
	</div>
 </div>
 -->
 <!-- yun.hj 2020/01/07 search icon 화면상단부에서 지웠음 -->

<main class="site-main">

	<!--================ Hero banner start =================-->
	<section class="blog-banner-area" id="category">		
		 <img class="img-fluid" src="/resources/img/home/main1.png"
			alt="main배너"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%"/>
			
	</section>
<!-- yun.hj 2020/01/07 main1 img change , 메인 배너 이미지 수정  -->
	<!--================ Hero banner end =================-->

	<!--================ Hero Carousel start =================-->
	<section class="section-margin mt-0">
		<div class="owl-carousel owl-theme hero-carousel">
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/front.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=1&click=Y" class="hero-carousel__slideOverlay">
					<h3>전면상품</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/side.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=2&click=Y" class="hero-carousel__slideOverlay">
					<h3>측면상품</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/back.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=3&click=Y" class="hero-carousel__slideOverlay">
					<h3>후면상품</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/inside.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=4&click=Y" class="hero-carousel__slideOverlay">
					<h3>실내/전장/의장</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/engine.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=5&click=Y" class="hero-carousel__slideOverlay">
					<h3>엔진/하체</h3>
					<p>전체보기</p>
				</a>
			</div>
		</div>
	</section>
	<!-- ================ offer section end ================= -->
	<!-- ================ Best Selling item  carousel ================= -->


	<section class="section-margin calc-60px">
		<div class="container">
			<div class="section-intro pb-60px">
				<h2>
					Best <span class="section-intro__style">Sellers</span> <img
						src="/resources/img/home/1111.png" alt="" onerror="this.src='/resources/img/noimage.gif'">
				</h2>
			</div>
			<div class="owl-carousel owl-theme" id="bestSellerCarousel">
				<c:forEach items="${list}" var="list">

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid"
								src="/resources/img/upload/<c:out value="${list.img1}" />" onerror="this.src='/resources/img/noimage.gif'">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>상품</p>
							<h4 class="card-product__title">
								<a href="single-product.html"><c:out value="${list.p_name}" />
								</a>
							</h4>
							<p class="card-product__price">
								<c:out value="${list.amount }" />
							</p>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>

	<!-- ================ Best Selling item  carousel end ================= -->



	<!--================ Hero Carousel end =================-->
	<!-- ================ trending product section start ================= -->
	<section class="section-margin calc-60px">
		<div class="container">
			<div class="section-intro pb-60px">
				<h2>
					<span class="section-intro__style">최신 상품</span>
				</h2>
			</div>
			<div class="row">
				<c:forEach items="${list2}" var="list2">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="img-fluid"
									src="/resources/img/upload/<c:out value="${list2.img1}" />"
									onerror="this.src='/resources/img/noimage.gif'">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>상품</p>
								<h4 class="card-product__title">
									<a href="single-product.html"><c:out
											value="${list2.p_name}" /></a>
								</h4>
								<p class="card-product__price">
									<c:out value="${list2.amount}" />
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- ================ trending product section end ================= -->



	<!-- ================ offer event section start ================= -->
	<section class="offer" id="parallax-1" data-anchor-target="#parallax-1"
		data-300-top="background-position: 20px 30px"
		data-top-bottom="background-position: 0 20px">
		<img class="img-fluid" src="/resources/img/home/event1.png"
			alt="event배너" />
	</section>
	<!-- yun.hj 2020.01.07 : event1 img change 이밴트 배너 수정  -->



	<!-- ================ Blog section start ================= -->
	<section class="blog">
		<div class="container">
			<div class="section-intro pb-60px">
				
				<h2>
					공지 사항
				</h2>
			</div>

		<div class="row">
		 <c:forEach items="${annc }" var="annc">
			<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
				<div class="card card-blog">
<!-- 					<div class="card-blog__img"> -->
<!-- 						<img class="card-img rounded-0" -->
<!-- 							src="/resources/img/blog/news1.png" alt=""> -->
<!-- 					</div> -->
					<div class="card-body">
						<ul class="card-blog__info">
							<li><c:out value="${annc.annc_date }"></c:out> </li>
						</ul>
						<h4 class="card-blog__title">
							<c:out value="${annc.title }"></c:out>
						</h4>
						<p> <c:out value="${annc.content }"/></p>
					</div>
				</div>
			</div>
		</c:forEach>
			</div>
		</div>
	</section>
	<!-- ================ Blog section end ================= -->
	<!-- ================ Subscribe section start ================= -->

	<!-- ================ Subscribe section end ================= -->
</main>


<!--================ Start footer Area  =================-->
<%@ include file="../include/footer.jsp"%>
