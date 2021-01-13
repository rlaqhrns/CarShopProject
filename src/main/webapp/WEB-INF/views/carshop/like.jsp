<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<!-- ================ start banner area ================= -->
<title>저리카 | 찜목록</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">

<!-- hraet 아이콘 css 생성 2020.12.22 -->
<style>
.icon_heart_empty {
	width: 50px;
	height: 50px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_empty.png);
}

.icon_heart_red {
	width: 50px;
	height: 50px;
	background-position: center;
	background-size: cover;
	background-image: url(/resources/img/heart/heart_red.png);
	primary-btn: ml-2;
}

.icon_cart {
	width: 50px;
	height: 50px;
	background-position: center;
	background-size: cover;
	background-image: url(/resources/img/cart/cart_icon.png);
}
</style>
<!-- ===================== css 종료 ===========================-->





<!-- ================== start banner area =================== -->
<section class="blog-banner-area" id="category">
	<img class="img-fluid" src="/resources/img/like/like1.png" alt="like배너"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
	<!-- 정상 출력 안되면 like 문구 출 -->
	<div class="blog-banner">
		<div class="text-center">
			<h1 style="color: white">LIKE</h1>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active" aria-current="page"></li>
				</ol>
			</nav>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->






<!--================Cart Area =================-->
<section class="cart_area">
	<div class="container">
		<div class="cart_inner">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr align="center">
							<th scope="col"><b>상품명</b></th>
							<th scope="col"><b>price</b></th>
							<th scope="col"><b>장바구니 담기</b></th>
							<th scope="col"><b>삭제</b></th>
						</tr>
					</thead>
					
					
					
					<!-- like 리스트 반복문으로 출력 -->
					<tbody>
						<c:forEach items="${likeList_like}" var="like">
							<tr align="center">
								<td>${like.p_name}</td>
								<td><fmt:formatNumber value="${like.amount}" pattern="#,###,###" />원</td>
								<td><a href="${path}/carshop/like/update?p_no=${like.p_no}" class="icon_cart"></a></td>
								<td><a href="${path}/carshop/like_delete?u_id=${like.u_id}&p_no=${like.p_no}" class="icon_heart_red"></a></td>
								<!-- <td><a href="${path}/carshop/like/delete?p_no=${like.p_no}" class="icon_heart_red"></a></td> -->
								</tr>
						</c:forEach>
						<!-- 2021/01/08 yunhj 찜목록 삭제와 장바구니 연동 아이콘 저장 -->


							<!--btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다.  -->
						<tr class="out_button_area">
							<td class="d-none-l"></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<div class="checkout_btn_inner d-flex align-items-center">
									<a class="primary-btn ml-2" href="cart">장바구니</a>
									<a class="gray_btn ml-2" id="Delete" href="${path}/carshop/like_deleteAll?u_id=${u_id}">비우기</a>
								</div>
								
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<!--================End Cart Area =================-->
<%@ include file="../include/footer.jsp"%>




<!-- ============== 쿼리문 start =================== -->
<script>
	

	
$empty = $(".icon_heart_empty");

$empty.click(function(){
	$empty.toggleClass("icon_heart_empty");
	$empty.toggleClass("icon_heart_red");
})

	// like 동작 확인 출력 2020/01/05 yunhj
	$(document).ready(function(){
		console.log("like 동작 ");
	})
		
	
	let btnShoppingCart = $(".btn-shopping-cart");
	btnShoppingCart.click(function(){
		
		let quantity = $(".product_count").children("input").val();
		addCartEvent(p_no,quantity);
	})
}
	
	
		
</script>