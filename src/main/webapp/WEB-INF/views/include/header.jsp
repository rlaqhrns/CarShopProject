<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>저기 카</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
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
					<a class="navbar-brand logo_h" href="index.html"><img src="/resources/img/logo3.png" alt="로고" style= "width: 70px; height: 70px;"></a>
					<!-- yun.hj 2020.01.07 logo img change & 규격이 상이해서 style 추가 함 -->
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
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
							<li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button></li>
							<li class="nav-item"><a class="button button-header" href="login">login</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>