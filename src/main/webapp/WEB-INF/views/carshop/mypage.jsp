<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
var modal = document.getElementById('modalEvent');
var schdtitle = "";
var schdstart = "";
var schdend = "";
var calendar = null;
const open = () => {
    document.querySelector(".modalc").classList.remove("hiddenc");
  }

  const close = () => {
    document.querySelector(".modalc").classList.add("hiddenc");
  }
  
	
		 /* 달력 실행을 위한 스크립트 */
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			calendar = new FullCalendar.Calendar(calendarEl, {
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
					console.log("arg start: " + arg.start);
					console.log("arg end: " + arg.end);
					console.log("arg allday: " + arg.allDay);
					
					var syear = arg.start.getFullYear();
					var smonth = arg.start.getMonth() + 1;
					var sday = arg.start.getDate();
					var stime = arg.start.toTimeString().substring(0,8);
					
					schdstart = syear+ "-" + smonth + "-" + sday + " " + stime;
					schdend = arg.end;
					
					console.log(schdstart);
					schdstart
					document.getElementById('schdstart').value = schdstart;
					document.getElementById('schdtitle').value = '';
					
					
					  open();
					  
						document.querySelector(".bgc").addEventListener("click", close);
						calendar.unselect()
				},
				eventClick : function(arg) {
					console.log('선택된 일정 제목: ' + arg.event.title);
					var evttitle = arg.event.title;
					if (confirm('이 일정을 삭제하겠습니까?')) {
						console.log("주소: " + "/carshop/delschd?u_id=<c:out value='${idcal}' />&schdtitle=" +  evttitle);
						location.replace("/carshop/delschd?u_id=<c:out value='${idcal}' />&schdtitle=" +  evttitle);
						//arg.event.remove();
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
			document.querySelector(".closeBtnc").addEventListener("click", function() {
				  schdtitle = document.getElementById('schdtitle').value;
				  /* schdtitle = document.getElementById('schdtitle').value;
				  schdtitle = document.getElementById('schdtitle').value; */
				  var schdstart2 = schdstart.substring(0,10) + "T" + schdstart.substring(11);
				  schdtitle = document.getElementById('schdtitle').value;
				  
				  schdend = document.getElementById('cal_year').value + "-" + document.getElementById('cal_month').value
				  				+ "-" + document.getElementById('cal_day').value + "T" + "23:59:59"; 
				  
					console.log(schdtitle);
					console.log("arg2 start: " + schdstart2);
					console.log("arg2 end: " + schdend);
					console.log("arg2 allday: " + true);
/* 					var syear = schdstart.getFullYear();
					var smonth = schdstart.getMonth() + 1;
					var sday = schdstart.getDate();
					var stime = schdstart.toTimeString().substring(0,8);
					
					console.log("syear:" + schdstart);
					console.log("smonth:" + schdstart);
					console.log("sday:" + schdstart);
					console.log("stime:" + schdstart); */
					
					
					if (schdtitle) {
						calendar.addEvent({
							title : schdtitle,
							start : schdstart2,
							end : schdend
						});
						console.log("스케쥴 start:" + schdstart);
						console.log("스케쥴 end: " + schdend);
						
						
					}
					
					
					calendar.unselect();
					close();
					
			});
		});
		 
		 $(document).ready(function() {
			 
			 
			 
			 <c:forEach items='${schedules}' var="schd">
			 	calendar.addEvent({
					title : "<c:out value='${schd.schdtitle}' />",
					start : "<c:out value='${schd.schdstart}' />",
					end : "<c:out value='${schd.schdend}' />"
				});
			 </c:forEach>

			console.log("제이쿼리 되는거냥");
			
/* 			$(document).on("click", ".closeBtn", function(e) {
				console.log("제이쿼리 클릭 됨");
			}); */
			
/* 			$(document).on("click", ".fc-daygrid-event-harness", function(e) {
				console.log("스케쥴 삭제 클릭 됨");
				var title = $(this).children('.fc-event-title').text();
				console.log(title);
			}); */
			
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

button {
	background-color: #F9B514;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
}

.modalc {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 5;
}

.modalc .bgc {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}

.modalBoxc {
	position: absolute;
	background-color: #fff;
	width: 400px;
	height: 200px;
	padding: 15px;
}

.modalBoxc button {
	display: block;
	width: 80px;
	margin: 0 auto;
}

.hiddenc {
	display: none;
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
								role="button" aria-haspopup="true" aria-expanded="false">MyPage</a></li>
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
<!--  Modal -->
	<div class="modalc hiddenc">
		<div class="bgc"></div>
		<div class="modalBoxc">
			<p>모달창입니다.</p>
			<form action="/carshop/insert" method="post" id="calform">
				<input type="hidden" name="u_id" value='<c:out value="${idcal }" />'>
				일정 제목: <input type="text" name="schdtitle" id="schdtitle"><br>
				시작일: <input type="text" name="schdstart" id="schdstart" readonly><br>
				마감일:<br>
				<select name="cal_year" id="cal_year">
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
				</select>
				<select name="cal_month" id="cal_month">
					<option value="01">Jan</option>
					<option value="02">Feb</option>
					<option value="03">Mar</option>
					<option value="04">Apr</option>
					<option value="05">May</option>
					<option value="06">Jun</option>
					<option value="07">Jul</option>
					<option value="08">Aug</option>
					<option value="09">Sep</option>
					<option value="10">Oct</option>
					<option value="11">Nov</option>
					<option value="12">Dec</option>
				</select>
				<select name="cal_day" id="cal_day">
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
				 <br>
				<button class="closeBtnc" type="submit">입력</button>
			</form>



		</div>
	</div>
	<!-- /.modal -->

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
	<footer class="footer">
	<div class="footer-area">
		<div class="container">
			<div class="row section_gap">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget tp_widgets">
						<h4 class="footer_title large_title">집콕코딩단</h4>
						<p>Green Academy 출신, 7명의 수석 개린이들이 창단한 집콕코딩단. 창의적인 아이디어와 실력을
							겸비하여 '저리카SHOP' 기획, 개발했다.</p>

					</div>
				</div>
				<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget tp_widgets">
						<h4 class="footer_title">Quick Links</h4>
						<ul class="list">
							<li><a href="#">Home</a></li>
							<li><a href="#">Shop</a></li>
							<li><a href="#">MyPage</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget instafeed">
						<h4 class="footer_title">member</h4>
						<ul class="list instafeed d-flex flex-wrap">
							<li><img src="/resources/img/gallery/r1.png" alt=""
								style="width: 70px; hight: 70px;"></li>
							<li><img src="/resources/img/gallery/r1.png" alt=""
								style="width: 70px; hight: 70px;"></li>
							<li><img src="/resources/img/gallery/r1.png" alt=""
								style="width: 70px; hight: 70px;"></li>
							<li><img src="/resources/img/gallery/r1.png" alt=""
								style="width: 70px; hight: 70px;"></li>
							<li><img src="/resources/img/gallery/r1.png" alt=""
								style="width: 70px; hight: 70px;"></li>
							<li><img src="/resources/img/gallery/r1.png" alt=""
								style="width: 70px; hight: 70px;"></li>
						</ul>
					</div>
				</div>
				<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget tp_widgets">
						<h4 class="footer_title">Contact Us</h4>
						<div class="ml-40">
							<p class="sm-head">
								<span class="fa fa-location-arrow"></span> Head Office
							</p>
							<p>경기도 성남시 JIP.CO.K codingdan company 2층</p>

							<p class="sm-head">
								<span class="fa fa-phone"></span> INSTAGRAM
							</p>
							<p>
								@jipcok <br> tel.031-1234-5678
							</p>

							<p class="sm-head">
								<span class="fa fa-envelope"></span> Email
							</p>
							<p>
								findme0@naver.com <br> www.jipcokcodingdan.com
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-bottom">
		<div class="container">
			<div class="row d-flex">
				<p class="col-lg-12 footer-text text-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with by JIPCOK 
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</div>
</footer>
<!--================ End footer Area  =================-->
<script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/vendors/skrollr.min.js"></script>
<script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/resources/vendors/mail-script.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>