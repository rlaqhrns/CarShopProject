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
								<c:forEach items="${cateParent }" var="cateParent">
									<ul>
										<li class="filter-list"><input
											class="pixel-radio parts-radio parent-radio" type="radio"
											id="${cateParent.c_no }" name="brand"
											value="${cateParent.c_no }"> <label
											for="${cateParent.c_no }"> <c:out
													value="${cateParent.c_name }" />
										</label></li>
									</ul>
								</c:forEach>
							</form>
						</li>
					</ul>
				</div>
				<div class="sidebar-categories">
					<div class="head">상세부품선택</div>
					<div class="common-filter parts_radio">
						<!-- 전면부품 체크시 나타날 radio -->
						<form action="#">
							<ul class="main-categories" id="details-parts">
								
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
					<div class="sorting" id="sortingAmountOrName">
						<select>
							<option value="1">정렬 순서</option>
							<option value="amountASC">가격 낮은 순</option>
							<option value="amountDESC">가격 높은 순</option>
							<option value="nameASC">이름 순(a-z)</option>
							<option value="nameDESC">이름 순(z-a)</option>
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
							<input type="text" id="search-input-box" placeholder="Search">
							<div class="input-group-append">
								<button type="button" id="search-btn">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row" id="product-list-area">
						<!-- list forEach start-->
						<c:forEach items="${list}" var="product">
							<%-- <div class="product-area" data-product-amount="${product.amount }" data-product-name="${product.p_name }"> --%>
							<div class="col-md-6 col-lg-4 product-area" data-product-amount="${product.amount }" data-product-name="${product.p_name }">
							<input type="hidden" value="${product.p_no}">
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
											<li><button class="btn_shopping-cart" value="${product.p_no }">
													<i class="ti-shopping-cart"></i>
												</button></li>
											<li><button class="btn_like_toggle" value="${product.p_no }">
													<i class="ti-heart"></i>
												</button></li>
										</ul>
									</div>
									<div class="card-body">

										<p>Accessories</p>
										<h4 class="card-product__title">
											<a href="/carshop/product/details?p_no=${product.p_no}">${product.p_name}</a>
										</h4>
										<p class="card-product__price"><fmt:formatNumber type="number" value="${product.amount}"/>원</p>

									</div>
								</div>
							</div>
							<!-- </div> -->
						</c:forEach>
						<!-- list forEach end -->

					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Button trigger modal -->

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
		let userId = "user1";

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
	function addLikeEvent(p_no,$obj) { //찜목
		//console.log("상품번호 : " + p_no);
		
		$.ajax({
			url : '/carshop/product/addlike',
			type : 'POST',
			data : {
				"u_id" : "user1",
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$obj.children(".ti-heart").addClass("heart_white_full");								
				$(".modal-body").html("찜 목록에 넣었습니다.");
				$('#notice').modal('show');
			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	function removeLikeEvent(p_no,$obj) { //찜목
		//console.log("상품번호 : " + p_no);
		
		$.ajax({
			url : '/carshop/product/removeLiked',
			type : 'POST',
			data : {
				"u_id" : "user1",
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$obj.children(".ti-heart").removeClass("heart_white_full");
				$(".modal-body").html("찜 목록에서 삭제되었습니다.");
				$('#notice').modal('show');
			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	
	function checkLiked(){
		$(".btn_like_toggle").each(function(index){
			let $obj = $(this);
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

						$obj.children(".ti-heart").addClass("heart_white_full");					
					}
					
				},
				error : function() {
					console.log("통신실패");
				}
			})
		});
		
	} 
	
	function setDisplay(obj) { //카테고리창
		let cateId = obj.attr('id');

		$.ajax({
					url : '/carshop/cateChek?cateId=' + cateId,
					type : 'get',
					dataType : 'JSON',

					success : function(data) {
						//console.log(" success 데이터 값 : ", data);
						let text = '';
						let details = $("#details-parts");
						// 비우기
						details.empty();
						$.each(data,function(key, value) {
											//상세카테고리 html 작성
											text += '<li class="filter-list"><input class="pixel-radio"type="radio" id="'
													+ value.c_no+'" name="details-parts" value="'
													+ value.c_no+'"><label for="'
													+ value.c_no+'">'
													+ value.c_name
													+ '</label></li>';
										})
						details.append(text);

						details.show();
						categoryDetailChange(); //상세카테고리 작성후 이벤트 등

					},
					error : function() {
						console.log("통신실패");
					}
				})
	}
	function setProductList($obj,url) { //카테고리 함수 파라미터로 url을 입력받는다.
		let categoryNum = $obj.val();

		// ajax 
		$.ajax({
					url : url,
					type : 'Post',
					data : {
						"categoryNum" : categoryNum //파라미터로 받은 객체의 value값을 전송한다.
					},
					dataType : 'JSON',

					success : function(data) {
						//console.log(" success 데이터 값 : ", data);
						let text = '';
						let $productListArea = $("#product-list-area");
						$productListArea.empty();
						$.each(data,function(key, product) {
							//백틱으로 처음부터 끝까지 해결하려했으나 태그 다음에 오류 ex) `src="${product.img}"`동작 안함
											  text += `<div class="col-md-6 col-lg-4 product-area" data-product-amount="`;
											  	text += product.amount;
												text +=`" data-product-name="`;
												text += product.p_name;
												text += `"> 
												<div class="card text-center card-product">
												<div class="card-product__img">
													<img class="card-img" src="`;
												text += product.img;
												text += `" onClick="location.href='/carshop/product/details?p_no='`;
												text += product.p_no;
												text += ` ">
													<ul class="card-product__imgOverlay">
														<li><button
																onClick="location.href='/carshop/product/details?p_no=`;
												text += product.p_no;
												text += `'">
																<i class="ti-search"></i>
															</button></li>
														<li><button class="btn_shopping-cart" value="`
												text += product.p_no;
												text += `">
																<i class="ti-shopping-cart"></i>
															</button></li>
														<li><button class="btn_like_toggle" value="`;
												text += product.p_no;
												text += `">
																<i class="ti-heart"></i>
															</button></li>
													</ul>
												</div>
												<div class="card-body">

													<p>Accessories</p>
													<h4 class="card-product__title">
														<a href="/carshop/product/details?p_no=`;
												text += product.p_no;
												text += `">`;
												text += product.p_name;
												text += `</a>
													</h4>
													<p class="card-product__price">`;
												text += product.amount;
												text += `원</p></div></div></div>`;
													
										})
						$productListArea.append(text);

						$productListArea.show();
						 //리스트 새로불러왔으니까 다시 이벤트 등록
						checkLiked(); //찜리스트인지 확인
						clickEvent(); //장바구니, 찜리스트 클릭이벤트 등록
						search();
						

					},
					error : function() {
						console.log("통신실패");
					}
				})
	}
	
	function clickEvent(){ //클릭 이벤
		//console.log("click!!!");
		$(".btn_like_toggle").click(function(){ //찜목록 추가 삭제
			let $obj = $(this);
			//console.log("하트클래스 포함여부 : " + $obj.children().hasClass("heart_white_full"));
			if($obj.children().hasClass("heart_white_full")){
				//console.log("removeLike함수 호출됨");
				removeLikeEvent($(this).val(),$obj);
			}
			else {
				addLikeEvent($(this).val(),$obj);
				//console.log("addLike함수 호출됨");
			}
		});
		$(".btn_shopping-cart").click(function(){ //장바구니 add
			//console.log($(this).val());
			addCartEvent($(this).val());
		})
		
	}
	function categoryParentChange(){ //라디오버튼이 바뀔때의 함수 -- 처음에는 클릭이벤트와 같이있었지만 마지막에 클릭이벤트를 다시등록해줄때에 루프를 돌아서 따로 분리하였다.
		$("input[type=radio][name=brand]").change(function(){
			var $obj = $(this);
			setProductList($obj,'/carshop/product/list');
			setDisplay($obj);
		})
	}
	function categoryDetailChange(){
		$("input[type=radio][name=details-parts]").change(function(){
			//console.log("상세 동작");
			var $obj = $(this);
			setProductList($obj,'/carshop/product/detailList');
		})
	}
	function search(){ //검색
		let searchInputBox = $("#search-input-box");
		let searchBtn = $("#search-btn");
		let productArea = $(".product-area");
		searchInputBox.keyup(function(){
			//console.log("검색시");
			let text = $(this).val();
			productArea.hide();
			let obj = $(".product-area[data-product-name]:contains('"+text+"')");
			$(obj).show();
		})
		
	}
	function sortOption(){ //정렬 버튼
		let sortingAmountOrName = $("#sortingAmountOrName");
		sortingAmountOrName.change(function(){
			let dataNm = $("option:selected",this).val(); 
			//console.log("정렬 함수 this.val() : " + dataNm);
			if(dataNm === 'amountASC'){
				listSort('productAmount','ASC');
			}else if(dataNm === 'amountDESC'){
				listSort('productAmount','DESC');
				
			}else if(dataNm === 'nameASC'){
				//console.log('name 오름차순');
				listSort('productName','ASC');
				
			}else if(dataNm === 'nameDESC'){
				//console.log('name 내림차순');
				listSort('productName','DESC');
				
			}
		})
	}
	function listSort(dataNm,direction){ //정렬 함수
		
		let listArea = $("#product-list-area"); //상품목록출력 공간
		listArea.html(
			listArea.children(".product-area").sort(function(a,b){
				return direction === 'ASC' ? $(a).data(dataNm) > $(b).data(dataNm) ? 0 : -1 :  $(a).data(dataNm) <= $(b).data(dataNm) ? 0 : -1;
			})		
		);
		
	}
	function init(){ //이벤트함수 init
		checkLiked(); //초기에 리스트 출력할때에 찜목록을 확인하여 하트에 불이 들어온다.
		clickEvent(); //클릭이벤트 
		categoryParentChange(); //부모카테고리 값이 바뀌면 동작하는 이벤 
		sortOption();
		search();
	}
	$(document).ready(function() {
		init();
		//listSort("productName");
	})
</script>
