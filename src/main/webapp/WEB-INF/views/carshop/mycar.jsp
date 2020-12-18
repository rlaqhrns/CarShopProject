<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 미완성페이지 -->

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>저기 카</title>

<style>
.login_box_img:before{
	display: none;
}
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
							<li class="nav-item"><a class="button button-header"
								href="register">회원가입</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<div class="row">
		<div class="container">
			<div class="cart_inner">
				<section class="login_box_area section-margin">
					<div class="container">
						<div class="row">
							<div class="col-lg-6">
								<div class="login_box_img">
									<div class="hover">
										<h4>My Car</h4>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="login_form_inner register_form_inner">
									<h3>Choose My Car</h3>
									<form class="row login_form" action="#/" id="mycar_form">
										<label for="cars">model</label>
										<div class="col-md-12 form-group">
											<select name="cars" id="cars" id="carselect">
												<option value="소나타">소나타</option>
												<option value="그린저">그린저</option>
												<option value="카니발">카니발</option>
												<option value="소울">소울</option>
												<option value="마티즈">마티즈</option>
											</select>
										</div>
										<div class="col-md-12 form-group">
											<input type="hidden" name="u_id" value=""> <input
												type="hidden" name="u_pw" value=""> <input
												type="hidden" name="name" value=""> <input
												type="hidden" name="phone" value=""> <input
												type="hidden" name="email" value=""> <input
												type="hidden" name="addr" value="">
										</div>

										<div class="col-md-12 form-group">
											<button type="submit" value="submit"
												class="button button-register w-100">my car 등록</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- <form action="">
					로그인 되어있는 회원의 나머지 받아서 정보는 hidden으로 보냄
					<input type="hidden" name="u_id" value="">
					<input type="hidden" name="u_pw" value="">
					<input type="hidden" name="name" value="">
					<input type="hidden" name="phone" value="">
					<input type="hidden" name="email" value="">
					<input type="hidden" name="addr" value="">
					<label for="cars">model</label>
					<select name="cars" id="cars" id="carselect">
						자동차 정보 수정
						<option value="소나타">소나타</option>
						<option value="그린저">그린저</option>
						<option value="카니발">카니발</option>
						<option value="소울">소울</option>
						<option value="마티즈">마티즈</option>
					</select>
				</form> -->
			</div>
		</div>
	</div>
	<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$("div.login_box_img").css({
				'background' : 'url(/resources/img/sonata.jpg)'
				
			});

			$("select").change(function() {
				
			});
		});
	</script>
	<%@ include file="../include/footer.jsp"%>