<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Carshop MyPage</title>
<link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="/resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="/resources/css/style.css">
<link href='/resources/lib/main.css' rel='stylesheet' />
<!-- 달력 css -->
<script src='/resources/lib/main.js'></script>
<!-- 달력 js  -->
<script>
	/* 달력 실행을 위한 스크립트 */
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialDate : '2020-12-17',
			editable : true,
			selectable : true,
			businessHours : true,
			navLinks : true,
			dayMaxEvents : true, // allow "more" link when too many events
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridDay'
			},
			selectMirror : true,
			select : function(arg) {
				var title = prompt('일정 제목:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect()
			},
			eventClick : function(arg) {
				if (confirm('이 일정을 삭제하겠습니까?')) {
					arg.event.remove()
				}
			},
			events : [ {
				title : 'All Day Event',
				start : '2020-09-01'
			}, {
				title : 'Long Event',
				start : '2020-09-07',
				end : '2020-09-10'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-09-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2020-09-11',
				end : '2020-09-13'
			}, {
				title : 'Meeting',
				start : '2020-09-12T10:30:00',
				end : '2020-09-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2020-09-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2020-09-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2020-09-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2020-09-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2020-09-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2020-09-28'
			} ]
		});

		calendar.render();
	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar { /* 달력 크기 */
	max-width: 750px;
	margin: 0 auto;
}
</style>
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
							<li class="nav-item"><a class="button button-header"
								href="register">회원가입</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>My Page</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">마이</a></li>
							<li class="breadcrumb-item active" aria-current="page">페이지</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
					<div class="categories_post">
						<img class="card-img rounded-0"
							src="/resources/img/blog/cat-post/cat-post-3.jpg" alt="post">
						<div class="categories_details" onclick="location.href='/carshop/mycar'">
							<div class="categories_text">
								<!-- <a href="/carshop/mycar"> -->
									<h5>My Car</h5>
								<!--  </a> -->
								<div class="border_line"></div>
								<p>내 차 정보 관리하기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
					<div class="categories_post">
						<img class="card-img rounded-0"
							src="/resources/img/blog/cat-post/cat-post-2.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a href="/carshop/cart">
									<h5>장바구니</h5>
								</a>
								<div class="border_line"></div>
								<p>장바구니 관리하기</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
					<div class="categories_post">
						<img class="card-img rounded-0"
							src="/resources/img/blog/cat-post/cat-post-1.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a href="single-blog.html">
									<h5>주문 이력</h5>
								</a>
								<div class="border_line"></div>
								<p>교환/반품하기</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<div id='calendar'></div>
						<!-- 달력생성 -->
						<article class="row blog_item">
							<!-- 1대1문의 보여줌 -->
							<div>
								<h3 class="widget_title"
									style="padding-top: 20px; padding-bottom: 20px">Popular
									Posts</h3>
								<div class="media post_item">
									<img src="/resources/img/blog/popular-post/post1.jpg"
										alt="post">
									<div class="media-body">
										<a href="single-blog.html">
											<h3>여기에</h3>
										</a>
										<p>여기는</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="/resources/img/blog/popular-post/post2.jpg"
										alt="post">
									<div class="media-body">
										<a href="single-blog.html">
											<h3>1대1 문의 내용(일반회원, 판매자회원 모두)</h3>
										</a>
										<p>문의를</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="/resources/img/blog/popular-post/post3.jpg"
										alt="post">
									<div class="media-body">
										<a href="single-blog.html">
											<h3>들어갈</h3>
										</a>
										<p>넣은</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="/resources/img/blog/popular-post/post4.jpg"
										alt="post">
									<div class="media-body">
										<a href="single-blog.html">
											<h3>거예요</h3>
										</a>
										<p>시간</p>
									</div>
								</div>
								<div class="br"></div>
							</div>
						</article>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<!-- 회원프로필 -->
							<img class="author_img rounded-circle"
								src="/resources/img/blog/author.png" alt="">
							<h4>Charlie Barber</h4>
							<p>일반회원</p>
							<div class="social_icon">
								<a href="#"> <i class="fab fa-github"></i> 계정정보 수정하기
								</a> <a href="/carshop/like"> <i class="fab fa-behance"></i> 찜
									목록
								</a>
							</div>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<!-- best상품 창 -->
							<h3 class="widget_title">Best 상품 또 봐라</h3>
							<div class="media post_item">
								<img src="/resources/img/blog/popular-post/post1.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>상품1</h3>
									</a>
								</div>
							</div>
							<div class="media post_item">
								<img src="/resources/img/blog/popular-post/post2.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>상품2</h3>
									</a>
								</div>
							</div>
							<div class="media post_item">
								<img src="/resources/img/blog/popular-post/post3.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>상품3</h3>
									</a>
								</div>
							</div>
							<div class="media post_item">
								<img src="/resources/img/blog/popular-post/post4.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>상품4</h3>
									</a>
								</div>
							</div>
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!--================Instagram Area =================-->
	<section class="instagram_area">
		<div class="container box_1620">
			<div class="insta_btn">
				<a class="btn theme_btn" href="#">Follow us on instagram</a>
			</div>
			<div class="instagram_image row m0">
				<a href="#"><img src="/resources/img/instagram/ins-1.jpg" alt=""></a>
				<a href="#"><img src="/resources/img/instagram/ins-2.jpg" alt=""></a>
				<a href="#"><img src="/resources/img/instagram/ins-3.jpg" alt=""></a>
				<a href="#"><img src="/resources/img/instagram/ins-4.jpg" alt=""></a>
				<a href="#"><img src="/resources/img/instagram/ins-5.jpg" alt=""></a>
				<a href="#"><img src="/resources/img/instagram/ins-6.jpg" alt=""></a>
			</div>
		</div>
	</section>
	<!--================End Instagram Area =================-->


	<!--================ Start footer Area  =================-->
	<%@ include file="../include/footer.jsp"%>
</html>