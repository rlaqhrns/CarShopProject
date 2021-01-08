<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>저기 카</title>

<style>
.searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 60px;
	background-color: #353b48;
	border-radius: 30px;
	padding: 10px;
}

.search_input {
	color: white;
	border: 0;
	outline: 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 40px;
	transition: width 0.4s linear;
}

.searchbar:hover>.search_input {
	padding: 0 10px;
	width: 450px;
	caret-color: red;
	transition: width 0.4s linear;
}

.searchbar:hover>.search_icon {
	background: white;
	color: #e74c3c;
}

.search_icon {
	height: 40px;
	width: 40px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
	text-decoration: none;
}

</style>

<link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="/resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="/resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="/resources/css/style.css">




</head>

<body>
	<!--================ Start Header Menu Area =================-->
	

<!--================ End Header Menu Area =================-->
<div class="container h-100">
	<div class="d-flex justify-content-center h-100">
		<div class="searchbar">
			<input class="search_input" type="text" name=""
				placeholder="Search..."> <a href="#" class="search_icon"><i
				class="fas fa-search"></i></a>
		</div>
	</div>
</div>

<main class="site-main"> <!--================ Hero banner start =================-->
<section class="hero-banner">
	<div class="container">
		<div class="row no-gutters align-items-center pt-60px">
			<div class="col-5 d-none d-sm-block">
				<div class="hero-banner__img">
					<img class="img-fluid" src="/resources/img/home/hero-banner.png"
						alt="">
				</div>
			</div>
			<div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
				<div class="hero-banner__content">
					<h4>Shop is fun</h4>
					<h1>Browse Our Premium Product</h1>
					<p>Us which over of signs divide dominion deep fill bring
						they're meat beho upon own earth without morning over third. Their
						male dry. They are great appear whose land fly grass.</p>
					<a class="button button-hero" href="#">Browse Now</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================ Hero banner start =================--> <!--================ Hero Carousel start =================-->






<section class="section-margin mt-0">
	<div class="owl-carousel owl-theme hero-carousel">
		<div class="hero-carousel__slide">
			<img src="/resources/img/home/front.png" alt="" class="img-fluid">
			<a href="home" class="hero-carousel__slideOverlay">
				<h3>전면상품</h3>
				<p>전체보기</p>
			</a>
		</div>
		<div class="hero-carousel__slide">
			<img src="/resources/img/home/side.png" alt="" class="img-fluid">
			<a href="#" class="hero-carousel__slideOverlay">
				<h3>측면상품</h3>
				<p>전체보기</p>
			</a>
		</div>
		<div class="hero-carousel__slide">
			<img src="/resources/img/home/back.png" alt="" class="img-fluid">
			<a href="#" class="hero-carousel__slideOverlay">
				<h3>후면상품</h3>
				<p>전체보기</p>
			</a>
		</div>
		<div class="hero-carousel__slide">
			<img src="/resources/img/home/inside.png" alt="" class="img-fluid">
			<a href="#" class="hero-carousel__slideOverlay">
				<h3>실내/전장/의장</h3>
				<p>전체보기</p>
			</a>
		</div>
		<div class="hero-carousel__slide">
			<img src="/resources/img/home/engine.png" alt="" class="img-fluid">
			<a href="#" class="hero-carousel__slideOverlay">
				<h3>엔진/하체</h3>
				<p>전체보기</p>
			</a>
		</div>
	</div>
</section>

<!--================ Start footer Area  =================-->
<%@ include file="../include/footer.jsp"%>

