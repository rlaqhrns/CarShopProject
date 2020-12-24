<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<title>Aroma Shop - Category</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/vendors/nouislider/nouislider.min.css">
<style>
.card-product__imgOverlay li button:hover .ti-heart {
	margin: 0;
	width: 15px;
	height: 15.2px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_white_full.png);
}
 .heart_white_full{
      margin: 0;
	width: 15px;
	height: 15.2px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_white_full.png);
	}
</style>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Shop Category</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Shop
							Category</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->


<!-- ================ category section start ================= -->
<section class="section-margin--small mb-5">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">부품선택</div>
					<ul class="main-categories">
						<li class="common-filter">
							<form action="#">
								<ul>
									<li class="filter-list"><input
										class="pixel-checkbox parts-radio" type="checkbox"
										id="front_parts" name="brand" onchange="setDisplay()"><label
										for="front_parts">&nbsp전면부품<span> (3600)</span></label></li>
									<li class="filter-list"><input
										class="pixel-checkbox parts-radio" type="checkbox"
										id="side_parts" name="brand" onchange="setDisplay()"><label
										for="side_parts">&nbsp측면부품<span> (3600)</span></label></li>
									<li class="filter-list"><input
										class="pixel-checkbox parts-radio" type="checkbox"
										id="rear_parts" name="brand" onchange="setDisplay()"><label
										for="rear_parts">&nbsp후면부품<span> (3600)</span></label></li>
									<li class="filter-list"><input
										class="pixel-checkbox parts-radio" type="checkbox" id="etc"
										name="brand" onchange="setDisplay()"><label for="etc">&nbsp실내/전장/의장<span>
												(3600)</span></label></li>
									<li class="filter-list"><input
										class="pixel-checkbox parts-radio" type="checkbox"
										id="engine_lower_body" name="brand" onchange="setDisplay()"><label
										for="engine_lower_body">&nbsp엔진/하체<span> (3600)</span></label></li>
								</ul>
							</form>
						</li>
					</ul>
				</div>
				<div class="sidebar-filter">
					<div class="top-filter-head">상세부품선택</div>
					<div class="common-filter parts_radio" style="display: none">
						<!-- 전면부품 체크시 나타날 radio -->
						<form action="#">
							<ul class="front_parts">
								<div class="head">전면부품</div>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="headlight" name="brand"><label
									for="headlight">헤드램프<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="turn_signal" name="brand"><label
									for="turn_signal">방향지시등<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="for_lights" name="brand"><label
									for="for_lights">안개등<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="day_lights" name="brand"><label
									for="day_lights">데이라이트<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="front_bumper" name="brand"><label
									for="front_bumper">프론트범퍼<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="wiper" name="brand"><label for="wiper">와이퍼<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="bonnet" name="brand"><label
									for="bonnet">본넷<span>(29)</span></label></li>
							</ul>
						</form>
						<!-- 측면부품 체크시 나타날 radio -->
						<form action="#">
							<ul class="side_parts">
								<div class="head">측면부품</div>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="front_door" name="brand"><label
									for="front_door">프론트도어<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="rear_door" name="brand"><label
									for="rear_door">리어도어<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="side_mirror" name="brand"><label
									for="side_mirror">사이드미러<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="fender" name="brand"><label
									for="fender">펜더<span>(29)</span></label></li>

							</ul>
						</form>
						<!-- 후면부품 체크시 나타날 radio -->
						<form action="#">
							<ul class="rear_parts">
								<div class="head">후면부품</div>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="combination_lamp" name="brand"><label
									for="combination_lamp">컴비네이션램프<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="spoiler" name="brand"><label
									for="spoiler">스포일러<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="antenna" name="brand"><label
									for="antenna">안테나<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="rear_bumper" name="brand"><label
									for="rear_bumper">리어범퍼<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="bumper_rail" name="brand"><label
									for="bumper_rail">범퍼레일<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="back_door" name="brand"><label
									for="back_door">백도어<span>(29)</span></label></li>
							</ul>
						</form>
						<!-- 실내/전장/의장 체크시 나타날 radio -->
						<form action="#">
							<ul class="etc">
								<div class="head">실내/전장/의장</div>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="av_system" name="brand"><label
									for="heaav_systemdlight">AV시스템<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="ECU" name="brand"><label for="ECU">ECU<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="lnstrument_penel" name="brand"><label
									for="lnstrument_penel">계기판<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="pedal" name="brand"><label for="pedal">페달<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="fuse_box" name="brand"><label
									for="fuse_box">퓨즈박스<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="sun_visor" name="brand"><label
									for="sun_visor">햇빛가리개(썬바이저)<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="room_mirror" name="brand"><label
									for="room_mirror">룸미러<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="dashboard" name="brand"><label
									for="dashboard">대쉬보드<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="sheet" name="brand"><label for="sheet">시트<span>(29)</span></label></li>
							</ul>
						</form>
						<!-- 엔진/하체 체크시 나타날 radio -->
						<form action="#">
							<ul class="engine_lower_body">
								<div class="head">엔진/하체</div>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="ABS" name="brand"><label for="ABS">ABS<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="air_flow_sensor" name="brand"><label
									for="air_flow_sensor">Air Flow Sensor<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="rear_brake_caliper" name="brand"><label
									for="rear_brake_caliper">리어 브레이크 캘리퍼<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="radiator" name="brand"><label
									for="radiator">라디에이터<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="battery" name="brand"><label
									for="battery">배터리<span>(29)</span></label></li>
							</ul>
						</form>
					</div>

					<div class="common-filter">
						<div class="head">가격</div>
						<div class="price-range-area">
							<div id="price-range"></div>
							<div class="value-wrapper d-flex">
								<div class="price">가격:</div>
								<div id="lower-value"></div>
								<span>원</span>
								<div class="to">to</div>
								<div id="upper-value"></div>
								<span>원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">가격 낮은 순</option>
							<option value="1">가격 높은 순</option>
							<option value="1">이름 순(a-z)</option>
							<option value="1">이름 순(z-a)</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">12개씩 보기</option>
							<option value="1">30개씩 보기</option>
							<option value="1">90개씩 보기</option>
						</select>
					</div>
					<div>
						<div class="input-group filter-bar-search">
							<input type="text" placeholder="Search">
							<div class="input-group-append">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- list forEach start-->
						<c:forEach items="${list}" var="product">
							<input type="hidden" value="${product.p_no}">
							<div class="col-md-6 col-lg-4">
								<div class="card text-center card-product">
									<div class="card-product__img">
										<img class="card-img" src="${product.img } "
											onClick="location.href='/carshop/product/details?p_no=${product.p_no}'"
											alt="">
										<ul class="card-product__imgOverlay">
											<li><button
													onClick="location.href='/carshop/product/details?p_no=${product.p_no}'">
													<i class="ti-search"></i>
												</button></li>
											<li><button onClick="addCartEvent('${product.p_no}')">
													<i class="ti-shopping-cart"></i>
												</button></li>
											<li><button class="product_pno_check" onClick="addLikeEvent('${product.p_no}')"  value="${product.p_no }">
													<i class="ti-heart"></i>
												</button></li>
										</ul>
									</div>
									<div class="card-body">

										<p>Accessories</p>
										<h4 class="card-product__title">
											<a href="/carshop/product/details?p_no=${product.p_no}">${product.p_name}</a>
										</h4>
										<p class="card-product__price">${product.amount}원</p>

									</div>
								</div>
							</div>
						</c:forEach>
						<!-- list forEach end -->

					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModalCenter">Launch demo modal</button>

			</div>
		</div>
	</div>
</section>
<!-- ================ category section end ================= -->
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
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->


<%@ include file="../include/topproduct.jsp"%>
<%@ include file="../include/footer.jsp"%>

<script src="/resources/vendors/nouislider/nouislider.min.js"></script>
<script src="/resources/js/shopproduct.js"></script>
<script>
	function addCartEvent(p_no) { //장바구니
		let ran = Math.floor(Math.random() * 10) + 1; //userID test(나중에 지울것!)
		let userId = "user" + ran;

		$.ajax({
			url : '/carshop/product/addcart',
			type : 'POST',
			data : {
				"u_id" : userId,
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$(".modal-body").html("장바구니에 넣었습니다.");
				$('#notice').modal('show');

			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	function addLikeEvent(p_no) { //찜목
		//let ran = Math.floor(Math.random() * 10) + 1; //userID test(나중에 지울것!)
		//let userId = "user" + ran;
		//console.log(this);

		$.ajax({
			url : '/carshop/product/addlike',
			type : 'POST',
			data : {
				"u_id" : "user1",
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$(".modal-body").html("찜 목록에 넣었습니다.");
				$('#notice').modal('show');
			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	function setDisplay(obj) { //카테고리창
		console.log("obj : " + obj);
		let cateParent = $('#cateParent');
		// 상위카테고리 name
		let cateName = $(obj).val();
		console.log("objVal", cateName);
		// 하위카테고리 id
		let cateId = $(obj).attr('id');
		console.log(cateId);
		console.log(cateName);

		// ajax 
		$.ajax({
					// get방식으로 cateId(jquery객체화 시킨 하위카테고리 id)를 보낸다 dataType은 JSON방식
					// 성공시 해당 data(카테고리 를 부모카테고리no와 비교해서 key 와 value로 )에 담긴다
					url : 'cateChek?cateId=' + cateId,
					type : 'get',
					// dataType 을 JSON으로 하지 않으면 html로 리턴된다
					dataType : 'JSON',

					success : function(data) {
						console.log(" success 데이터 값 : ", data);
						let text = '';
						let radio = $(".parts_radio");
						// 비우기
						radio.empty();
						$
								.each(
										data,
										function(key, value) {
											console.log("key의 값 : " + key + " "
													+ "value의 값 : "
													+ value.c_name);
											console.log("data 길이");
											text += '<ul class="front_parts"><li class="filter-list"><input class="pixel-radio"type="radio" id="'+value.c_no+'" name="'+value.c_no+'"value=""><label for="headlight">'
													+ value.c_name
													+ '</label></li></ul>';
										})
						radio.append(text);

						radio.show();

					},
					error : function() {
						console.log("통신실패");
					}
				})
	}
	function checkLiked(){
		$(".product_pno_check").each(function(index){
			let obj = $(this);
			let p_no = $(this).val();
			$.ajax({
				url : '/carshop/product/checkLiked',
				type : 'POST',
				data : {
					"u_id" : "user1", //나중에 로그인완성되면 넣을것!
					"p_no" : p_no
				},
				dataType : 'JSON',
				success : function(data) {
					if(data){
						console.log(obj);
						$(obj).children(".ti-heart").addClass("heart_white_full");					
					}
					console.log(data);
				},
				error : function() {
					console.log("통신실패");
				}
			})
		});
		
	} 
	function clickEvent(){
		console.log("click!!!");
		$(".product_pno_check").click(function(){
			checkLiked();
			console.log("체크함수 호출됨");
		});
	}
	$(document).ready(function() {
		checkLiked();
		clickEvent();
	})
</script>
