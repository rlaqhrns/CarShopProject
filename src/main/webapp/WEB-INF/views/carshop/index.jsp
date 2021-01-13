<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.card-product__imgOverlay li button:hover .ti-heart {
	margin: 0;
	width: 15px;
	height: 15.2px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_white_full.png);
}

.heart_white_full {
	margin: 0;
	width: 15px;
	height: 15.2px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_white_full.png);
}

/* event 배너 css start 2021.01.13 YHJ*/
body {
	font-size: 11pt;
	padding: 0;
	margin: 0;
	text-align: center;
}

h3 {
	color: #85144b;
	font-size: 14pt;
	margin: 10 auto;
	padding: 10px;
}

.contents {
	width: 800px;
	height: 400px;
	background-color: #d6d6d6;
	margin: 0 auto;
}

/* banner */
.banner {
	position: relative;
	width: 1519px;
	height: 380px;
	top: 50px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 2114pxpx;
	height: 498px;
	margin: 0;
	padding: 0;
}
/* event css end */
</style>
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
<title>저리카 | Home</title>

<main class="site-main">

	<!--================ Hero banner start =================-->
	<section class="blog-banner-area" id="category">
		<img class="img-fluid" src="/resources/img/home/main1.png"
			alt="main배너"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; padding-bottom: 30px" />

	</section>
	<!-- yun.hj 2020/01/07 main1 img change , 메인 배너 이미지 수정  -->
	<!--================ Hero banner end =================-->

	<!--================ Hero Carousel start =================-->
	<section class="section-margin mt-0">
		<div class="owl-carousel owl-theme hero-carousel">
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/front.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=1&click=Y"
					class="hero-carousel__slideOverlay">
					<h3>전면상품</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/side.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=2&click=Y"
					class="hero-carousel__slideOverlay">
					<h3>측면상품</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/back.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=3&click=Y"
					class="hero-carousel__slideOverlay">
					<h3>후면상품</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/inside.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=4&click=Y"
					class="hero-carousel__slideOverlay">
					<h3>실내/전장/의장</h3>
					<p>전체보기</p>
				</a>
			</div>
			<div class="hero-carousel__slide">
				<img src="/resources/img/home/engine.png" alt="" class="img-fluid">
				<a href="/carshop/product/list?cate_no=5&click=Y"
					class="hero-carousel__slideOverlay">
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
						src="/resources/img/home/1111.png" alt=""
						onerror="this.src='/resources/img/noimage.gif'">
				</h2>
			</div>
			<div class="owl-carousel owl-theme" id="bestSellerCarousel">
				<c:forEach items="${list}" var="list">

					<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="img-fluid"
								src="/resources/img/upload/<c:out value="${list.img1}" />"
								onerror="this.src='/resources/img/noimage.gif'"
								style="width: 450px; height: 300px;"> <img
								class="img-fluid"
								src="/resources/img/upload/<c:out value="${list.img1}" />"
								onerror="this.src='/resources/img/noimage.gif'">
							<ul class="card-product__imgOverlay">
								<li><button
										onClick="location.href='/carshop/product/details?p_no=${list.p_no}'">
										<i class="ti-search"></i>
									</button></li>
								<li><button class="btn_shopping-cart" value="${list.p_no }">
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button class="btn_like_toggle" value="${list.p_no }">
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>상품</p>
							<h4 class="card-product__title">
								<a href="/carshop/product/details?p_no=${list.p_no}"><c:out
										value="${list.p_name}" /> </a>
							</h4>
							<p class="card-product__price">
								<c:out value="${list.amount }" />
								원
							</p>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>

	<!-- ================ Best Selling item  carousel end ================= -->




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
									onerror="this.src='/resources/img/noimage.gif'"
									style="width: 450px; height: 300px;">
								<ul class="card-product__imgOverlay">
									<li><button
											onClick="location.href='/carshop/product/details?p_no=${list2.p_no}'">
											<i class="ti-search"></i>
										</button></li>
									<li><button class="btn_shopping-cart"
											value="${list2.p_no }">
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button class="btn_like_toggle" value="${list2.p_no }">
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>상품</p>
								<h4 class="card-product__title">
									<a href="/carshop/product/details?p_no=${list2.p_no}"><c:out
											value="${list2.p_name}" /></a>
								</h4>
								<p class="card-product__price">
									<c:out value="${list2.amount}" />
									원
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
	<!-- <section class="offer" id="parallax-1" data-anchor-target="#parallax-1"
		data-300-top="background-position: 20px 30px"
		data-top-bottom="background-position: 0 20px"> -->
	<!-- <img class="img-fluid" src="/resources/img/home/event1.png"
			alt="event배너" />-->

	<!-- event 배너 start -->
	<section>
		<div class="banner">
			<ul>
				<li><img src="/resources/img/home/event1.png" width="1519px" height="380px"></li>
				<li><img src="/resources/img/home/event2.png" width="1519px" height="380px"></li>
				<li><img src="/resources/img/home/event3.png" width="1519px" height="380px"></li>
				<li><img src="/resources/img/home/event4.png" width="1519px" height="380px"></li>
				<li><img src="/resources/img/home/event5.png" width="1519px" height="380px"></li>
				<!-- 이벤트 배너 하나 더 만들기 -->
			</ul>
		</div>

	</section>
	<!-- </section> -->
	<!-- yun.hj 2020.01.07 : event1 img change 이밴트 배너 수정  -->



	<!-- ================ Blog section start ================= -->
	<section class="blog">
		<div class="container">
			<div class="section-intro pb-60px">

				<h2>공지 사항</h2>
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
									<li><c:out value="${annc.annc_date }"></c:out></li>
								</ul>
								<h4 class="card-blog__title">
									<c:out value="${annc.title }"></c:out>
								</h4>
								<p>
									<c:out value="${annc.content }" />
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- ================ Blog section end ================= -->

	<!-- ================ Subscribe section end ================= -->
</main>
<!-- Modal -->
<div class="modal fade" id="notice" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">알림</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				<div id="cart-btn-area"></div>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->

<!--================ Start footer Area  =================-->
<%@ include file="../include/footer.jsp"%>
<script>
function getUserId(){ //유저 아이디를 가져온다.
	let u_id = "${user.id}";
	return u_id;
}

function getSellerCheck(){ //판매자인지 판단.
	let sellerCheck = "${user.seller}"
	if(sellerCheck === 'N'){
		return false;
	}else if(sellerCheck === 'Y') {
		return true;
	}
}
function sessoinExistenceChecked(){ //비회원인지 판단.
	let userId = getUserId();
	if(userId === "" || typeof userId === "undefined" || userId === null){
		
		return true;
	}
	return false;
	}
	function loginTypeCheck(){

	let result = false;
	if(sessoinExistenceChecked()){ //비회원
		$("#notice .modal-body").html("로그인 후 이용해주세요.");
		$('#notice').modal('show');
		result = true;
	}else if(getSellerCheck()){//판매자
		$("#notice .modal-body").html("판매자는 이용할수 없습니다. 일반유저 로그인 후 이용해주세요.");
		$('#notice').modal('show');
		result = true;
	}
	return result;
	}

function addCartEvent(p_no,quantity) { //장바구니
	let userId = getUserId();
	if(loginTypeCheck()){ // 비회원, 판매자 아이디면 각각상황에 따른 모달창을 띄워준다.
		return false;
	}
	

	$.ajax({
		url : '/carshop/product/addcart',
		type : 'POST',
		data : {
			"u_id" : userId,
			"p_no" : p_no,
			"quantity":quantity
		},
		dataType : 'JSON',
		success : function(stats) {
			$(".modal-body").html("\""+userId + "\"님 장바구니에 넣었습니다.");
			$("#cart-btn-area").empty().append(`<button type="button" onClick="location.href='/carshop/cart'"
				class="btn btn-primary" data-dismiss="modal">장바구니로 이동</button>`);
			$('#notice').modal('show');

		},
		error : function() {
			console.log("장바구니 통신실패");
		}
	})
}

function addLikeEvent(p_no,$obj) { //찜목록추가
	let userId = getUserId();
	if(loginTypeCheck()){ // 비회원, 판매자 아이디면 각각상황에 따른 모달창을 띄워준다.
		return false;
	}
	
	$.ajax({
		url : '/carshop/product/addlike',
		type : 'POST',
		data : {
			"u_id" : userId,
			"p_no" : p_no
		},
		dataType : 'JSON',
		success : function(stats) {
			$(".icon_heart_empty").addClass("icon_heart_red");								
			$("#notice .modal-body").html("\""+ userId + "\"님 찜 목록에 넣었습니다.");
			$('#notice').modal('show');
		},
		error : function() {
			console.log("통신실패");
			}
		})
}


function removeLikeEvent(p_no,$obj) { //찜목록삭제
	//console.log("상품번호 : " + p_no);
	let userId = getUserId();
	if(loginTypeCheck()){ // 비회원, 판매자 아이디면 각각상황에 따른 모달창을 띄워준다.
		return false;
	}
	$.ajax({
		url : '/carshop/product/removeLiked',
		type : 'POST',
		data : {
			"u_id" : userId,
			"p_no" : p_no
		},
		dataType : 'JSON',
		success : function(stats) {
			$obj.children(".ti-heart").removeClass("heart_white_full");
			$(".modal-body").html("\""+getUserId() + "\"님 찜 목록에서 삭제되었습니다.");
			$('#notice').modal('show');
		},
		error : function() {
			console.log("통신실패");
		}
	})
}
function checkLiked(){
	let userId = getUserId();
	if(sessoinExistenceChecked() || getSellerCheck()){
		return false;
	}

	$(".btn_like_toggle").each(function(index){
		let $obj = $(this);
		let p_no = $(this).val();
		$.ajax({
			url : '/carshop/product/checkLiked',
			type : 'POST',
			data : {
				"u_id" : userId, //나중에 로그인완성되면 넣을것!
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(data) {
				if(data){
					$obj.children(".ti-heart").addClass("heart_white_full");					
				}
			},
			error : function() {
				console.log("통신실패");
			}
		})
	});
} 
function clickEvent(){ // 클릭이벤트(찜목록 추가삭제, 장바구니)
	let likeToggle = $(".btn_like_toggle");
	let shoppingCart = $(".btn_shopping-cart");
	likeToggle.off("click");
	shoppingCart.off("click");
		console.log("click!!");
	likeToggle.click(function(){ //찜목록 추가 삭제
		let $obj = $(this);
		console.log("click!!");
		//하트클래스 포함여부
		if($obj.children().hasClass("heart_white_full")){
			removeLikeEvent($(this).val(),$obj);
		}
		else {
			addLikeEvent($(this).val(),$obj);
		}
	});
	shoppingCart.click(function(){ //장바구니 add
		addCartEvent($(this).val(),1);
	})
	
}
function init(){
	clickEvent();
	checkLiked();
	
}
$(document).ready(function(){
	init();
})


// 이벤트 배너 자동 슬라이드 쿼리 2021.01.13 YHJ
$(document).ready(function() {
		
		var $banner = $(".banner").find("ul"); //사용할 배너

		var $bannerWidth = $banner.children().outerWidth();// 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $bannerLength = $banner.children().length;//배너 이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행 
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차

		banner.mouseover(function(){
			//중지
			clearInterval(rollingId);
			$(this).css("cursor", "pointer");
		});
		//마우스 아웃되면 다시 시작
		banner.mouseout(function(){
			rollingId = setInterval(function() { rollingStart(); }, 3000);
			$(this).css("cursor", "default");
		});

		function rollingStart() {
			$banner.css("width", $bannerWidth * $bannerLength + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	}); 

$banner.mouseover(function(){
	
	
	clearInterval(rollingId);
	$(this).css("cursor", "pointer");
});

$banner.mouseout(function(){
	rollingId = setInterval(function() { rollingStart(); }, 3000);
	$(this).css("cursor", "default");
});



</script>