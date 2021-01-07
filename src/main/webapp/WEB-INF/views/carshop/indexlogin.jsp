<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="index.html"><img
						src="/resources/img/logo2.png" alt="로고"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>					
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item active"><a class="nav-link"
								href="index.html">Home</a></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">MyPage</a>
							<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
						</ul>

						<ul class="nav-shop">

							<li class="nav-item"><button>
									<i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span>
								</button></li>
							<li class="nav-item2"><a class="button button-header"
								href="index">logout</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>

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
<!-- ================ offer section end ================= --> <!-- ================ Best Selling item  carousel ================= -->


<section class="section-margin calc-60px">
	<div class="container">
		<div class="section-intro pb-60px">
			<h2>
				Best <span class="section-intro__style">Sellers</span> <img
					src="/resources/img/home/1111.png" alt="">
			</h2>
		</div>
		<div class="owl-carousel owl-theme" id="bestSellerCarousel">
			<c:forEach items="${list}" var="list">

				<div class="card text-center card-product">
					<div class="card-product__img">
						<img class="img-fluid"
							src="/resources/img/upload/<c:out value="${list.img}" />" alt="">
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



<!--================ Hero Carousel end =================--> <!-- ================ trending product section start ================= -->
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
							src="/resources/img/upload/<c:out value="${list2.img}" />" alt="">
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
								<a href="single-product.html"><c:out value="${list2.p_name}" /></a>
							</h4>
							<p class="card-product__price"><c:out value="${list2.amount}" /></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- ================ trending product section end ================= -->


<!-- ================ offer section start ================= -->
<section class="offer" id="parallax-1" data-anchor-target="#parallax-1"
	data-300-top="background-position: 20px 30px"
	data-top-bottom="background-position: 0 20px">
	<div class="container">
		<div class="row">
			<div class="col-xl-5">
				<div class="offer__content text-center">
					<h3>Up To 50% Off</h3>
					<h4>Winter Sale</h4>
					<p>Him she'd let them sixth saw light</p>
					<a class="button button--active mt-3 mt-xl-4" href="#">Shop Now</a>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- ================ Blog section start ================= -->
<section class="blog">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				Latest <span class="section-intro__style">News</span>
			</h2>
		</div>

		<div class="row">
			<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
				<div class="card card-blog">
					<div class="card-blog__img">
						<img class="card-img rounded-0"
							src="/resources/img/blog/blog1.png" alt="">
					</div>
					<div class="card-body">
						<ul class="card-blog__info">
							<li><a href="#">By Admin</a></li>
							<li><a href="#"><i class="ti-comments-smiley"></i> 2
									Comments</a></li>
						</ul>
						<h4 class="card-blog__title">
							<a href="single-blog.html">The Richland Center Shooping News
								and weekly shooper</a>
						</h4>
						<p>Let one fifth i bring fly to divided face for bearing
							divide unto seed. Winged divided light Forth.</p>
						<a class="card-blog__link" href="#">Read More <i
							class="ti-arrow-right"></i></a>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
				<div class="card card-blog">
					<div class="card-blog__img">
						<img class="card-img rounded-0"
							src="/resources/img/blog/blog2.png" alt="">
					</div>
					<div class="card-body">
						<ul class="card-blog__info">
							<li><a href="#">By Admin</a></li>
							<li><a href="#"><i class="ti-comments-smiley"></i> 2
									Comments</a></li>
						</ul>
						<h4 class="card-blog__title">
							<a href="single-blog.html">The Shopping News also offers
								top-quality printing services</a>
						</h4>
						<p>Let one fifth i bring fly to divided face for bearing
							divide unto seed. Winged divided light Forth.</p>
						<a class="card-blog__link" href="#">Read More <i
							class="ti-arrow-right"></i></a>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
				<div class="card card-blog">
					<div class="card-blog__img">
						<img class="card-img rounded-0"
							src="/resources/img/blog/blog3.png" alt="">
					</div>
					<div class="card-body">
						<ul class="card-blog__info">
							<li><a href="#">By Admin</a></li>
							<li><a href="#"><i class="ti-comments-smiley"></i> 2
									Comments</a></li>
						</ul>
						<h4 class="card-blog__title">
							<a href="single-blog.html">Professional design staff and
								efficient equipment you’ll find we offer</a>
						</h4>
						<p>Let one fifth i bring fly to divided face for bearing
							divide unto seed. Winged divided light Forth.</p>
						<a class="card-blog__link" href="#">Read More <i
							class="ti-arrow-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ================ Blog section end ================= --> <!-- ================ Subscribe section start ================= -->

<!-- ================ Subscribe section end ================= --> </main>


<!--================ Start footer Area  =================-->
<%@ include file="../include/footer.jsp"%>

