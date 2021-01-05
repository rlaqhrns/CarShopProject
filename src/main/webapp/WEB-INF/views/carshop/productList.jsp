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
									<li style="display: none" class="filter-list"><input
											class="pixel-radio parts-radio parent-radio" type="radio"
											name="brand"
											id="cateParentDefault"
											value="0" checked> <label
											for="cateParentDefault" > 전체보기
									</label></li>
									<c:forEach items="${cateParent }" var="cateParent">
										<li class="filter-list"><input
												class="pixel-radio parts-radio parent-radio" type="radio"
												id="${cateParent.c_no }" name="brand"
												value="${cateParent.c_no }"> <label
												for="${cateParent.c_no }"> <c:out
														value="${cateParent.c_name }" />
										</label></li>
									</c:forEach>
								</ul>
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
								<li style="display:none" class="filter-list"><input class="pixel-radio"type="radio"name="details-parts" value="0" id="detailDefault" checked><label for="detailDefault">
													전체보기
													</label></li>
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
							<option value="" selected disabled>정렬 순서</option>
							<option value="amountASC">가격 낮은 순</option>
							<option value="amountDESC">가격 높은 순</option>
							<option value="nameASC">이름 순(a-z)</option>
							<option value="nameDESC">이름 순(z-a)</option>
						</select>
					</div>
					<div class="sorting mr-auto" id="viewProduct">
						<select>
							<option value="6" selected>6개씩 보기</option>
							<option value="9">9개씩 보기</option>
							<option value="12">12개씩 보기</option>
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
						<!-- 리스트를 그냥 ajax로 받아오기로 통일 ( 페이징 처리 위해서 ) -->
						<%-- <c:forEach items="${list}" var="product">
							<div class="product-area" data-product-amount="${product.amount }" data-product-name="${product.p_name }">
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
						</c:forEach> --%>
						 <!-- pagination-sm,lg로 크기 정할 수 있 -->
					<!-- <div id="pagination-div"><ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul></div> -->
						<!-- list forEach end -->

					</div>
					<div id="pagination-parent">
						<div id='pagination-div'></div>
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
<script type="text/javascript" src="/resources/js/twbsPagination.js"></script>
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
						$.each(data,function(index, value) {
											//상세카테고리 html 작성
											if(index == 0){
												text += `<li class="filter-list"><input class="pixel-radio"type="radio"name="details-parts" value="0" id="detailDefault" checked><label for="detailDefault">
													전체보기
													</label></li>`;
											}
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
	//function setProductList(category,url,obj,direction) { //카테고리 함수 파라미터로 url을 입력받는다.
	function setProductList() { //카테고리 함수 파라미터로 url을 입력받는다.
		
		
		let categoryParent; //부모카테고리
		let categoryChild;// 자식카테고리
		let url;// 부모카테고리와 자식카테고리에 따라서 변화될url //부모가 0 자식이 0 이면 전체리스트, 부모가 0이아니고 자식이 0이면 부모카테고flurl, 자식이 0이아니면 자식카테고url
				
		let sortingAmountOrName =  $("#sortingAmountOrName option:selected").val();
		let obj = ''; //정렬 방식 이름, 가격
		let direction = ''; //정렬 방향 asc,desc
		
		categoryParents = $("input[type=radio][name=brand]:checked").val(); //부모 카테고리의 값 default 0
		categoryDetails = $("input[type=radio][name=details-parts]:checked").val(); //자식 카테고리의 값 default 0
		
	/* 	if(categoryParents == 0 && categoryDetails == 0){
			url = "/carshop/product/defaultCategory"; 
		}else if(categoryParents != 0 && categoryDetails == 0){
		 */	
			url = "/carshop/product/selectCategory";
		/* }else if(categoryParents != 0 && categoryDetails != 0){
			url = "/carshop/product/selectCategoryDetail";
		} */
		
		if(sortingAmountOrName == 'amountASC'){
			obj = 'amount ASC';
			direction = "amount ASC";
			
		}else if(sortingAmountOrName == 'amountDESC'){
			obj = 'amount DESC';
			direction = "amount DESC";
			
		}else if(sortingAmountOrName == 'nameASC'){
			obj = 'p_name ASC';
			direction = "p_name ASC";
			
		}else if(sortingAmountOrName == 'nameDESC'){
			obj = 'p_name DESC';
			direction = "p_name DESC";
		}
		
		
		//console.log(categoryParents+", " + categoryDetails+", "+ url +", " + obj + ", " + direction);
		
		
		/* let categoryNum = category;
		if(category != 0){
			categoryNum = category.val();
		}else{
			url = '/carshop/product/defaultCategory';
		}
		// ajax  */
		$.ajax({
					url : url,
					type : 'Post',
					data : {
						"categoryParents" : categoryParents, //파라미터로 받은 객체의 value값을 전송한다.
						"categoryDetails" : categoryDetails, //파라미터로 받은 객체의 value값을 전송한다.
						"object" : obj,	//정렬할 객체
						"direction" : direction,//정렬 방향
					},
					dataType : 'JSON',

					success : function(data) {
						//console.log(" success 데이터 값 : ", data);
						let text;
						let totalProductCnt = 0;
						let $productListArea = $("#product-list-area");
						$productListArea.empty();
						$.each(data,function(index, product) {
							text = '';
							productView = 6;
							//console.log(index);
							//pageNum = Math.floor(index/productView) +1;
							productNum = index +1;
							productCnt = index + 1;
												//백틱으로 처음부터 끝까지 해결하려했으나 태그 다음에 오류 ex) `src="${product.img}"`동작 안함
											  	text += `<div class="`;
												//text +=`page`+ pageNum;
												
												text += ` col-md-6 col-lg-4 product-area" data-product-amount="`;
											  	text += product.amount;
												text +=`" data-product-name="`;
												text += product.p_name;
												text += `" id ="product`
												text += productNum + `"> 
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
												$productListArea.append(text);//상품 출력
												
										})
						$("#pagination-parent").empty();				
						$("#pagination-parent").html("<div id= 'pagination-div'></div>");
						$productListArea.show();
						 //리스트 새로불러왔으니까 다시 이벤트 등록
						checkLiked(); //찜리스트인지 확인
						clickEvent(); //장바구니, 찜리스트 클릭이벤트 등록
						search();
						//console.log("productCnt : " + productCnt);
						
						pagingEvent();
						//ProductViewEvent(); //totalProductCnt 상품 총 개수
						

					},
					error : function() {
						console.log("상품출력 통신실패");
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
			//console.log($obj.val() + "부모카테고리 넘버");
			if($obj.val() != 0){
				setDisplay($obj);
				setProductList();
			}else{
				setProductList();
			}
		})
	}
	function categoryDetailChange(){
		$("input[type=radio][name=details-parts]").change(function(){
			//console.log("상세 동작");
			var $obj = $(this);
			setProductList();
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
			$(obj).css('display','inline');
		
		})
	}
	function sortOption(){ //정렬 버튼
		let sortingAmountOrName = $("#sortingAmountOrName");
		sortingAmountOrName.change(function(){
			setProductList();
		})
	}
	/* function listSort(dataNm,direction){ //정렬 함수
		
		let listArea = $("#product-list-area"); //상품목록출력 공간
		listArea.html(
			listArea.children(".product-area").sort(function(a,b){
				return direction === 'ASC' ? $(a).data(dataNm) > $(b).data(dataNm) ? 0 : -1 :  $(a).data(dataNm) <= $(b).data(dataNm) ? 0 : -1;
			})		
		);
		
	} */
	function ProductViewEvent(){
		$("#viewProduct").change(function(){
			setProductList();
		
		})
	
	
	}
	function pagingEvent(){
		//$('#pagination-div').empty();
		//$('#pagination-div').twbsPagination('destroy');
		//document.getElementById('pagination-parent').innerHtml = "<div id= 'pagination-div'></div>";
		let pageCnt = 1;
		let productArea = $(".product-area");
		let totalProductCnt = 0;
		let viewProduct =  $("#viewProduct option:selected").val();
		//console.log("몇페이"+Math.ceil(totalProductCnt/viewProduct));
		
		
		productArea.each(function(index,item){
			
			
			totalProductCnt++;
			//$(item).removeClass(":contains('page')");
   			//$(item).addClass("page"+pageCnt);
    		if((index+1)%viewProduct == 0){
    			pageCnt++;
    			
    		}
    		
    	})
    	//console.log("총 페이지 : " + totalProductCnt);
		let totalPages = Math.ceil(totalProductCnt/viewProduct);
		let visiblePages = totalPages > 5 ? 5 : totalPages;
		productArea.hide();
		$('.page1').show();
		$('#pagination-div').twbsPagination({
		    totalPages: totalPages,	// 총 페이지 번호 수
		    visiblePages: visiblePages,	// 하단에서 한번에 보여지는 페이지 번호 수
		    startPage : 1, // 시작시 표시되는 현재 페이지
		    initiateStartPageClick: true,	// 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
		    first : "<<",	// 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
		    prev : "이전",	// 이전 페이지 버튼에 쓰여있는 텍스트
		    next : "다음",	// 다음 페이지 버튼에 쓰여있는 텍스트
		    last : ">>",	// 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
		    nextClass : "page-item next",	// 이전 페이지 CSS class
		    prevClass : "page-item prev",	// 다음 페이지 CSS class
		    lastClass : "page-item last",	// 마지막 페이지 CSS calss
		    firstClass : "page-item first",	// 첫 페이지 CSS class
		    pageClass : "page-item",	// 페이지 버튼의 CSS class
		    activeClass : "active",	// 클릭된 페이지 버튼의 CSS class
		    disabledClass : "disabled",	// 클릭 안된 페이지 버튼의 CSS class
		    anchorClass : "page-link",	//버튼 안의 앵커에 대한 CSS class
		    
		    onPageClick: function (event, page) {
		    	//클릭 이벤트
		    	//console.log("page : " + page);
		    	//$(".product-area").hide();
		    	//pageClass = ".page" + page;
		    	//$(pageClass).show();
		    	/* for(let i = 0;i<viewProduct;i++){
			    	productNum ='product'+ i + (page*viewProduct);
		    		
		    	} */
		    	paging(page,totalProductCnt,totalPages);
		    	
		    }
		});
		
	}
	 function paging(page,totalProductCnt,totalPages) {
		$(".product-area").hide();
		let pageSize = $("#viewProduct option:selected").val(); //한 페이지당 보여줄 게시물의 갯수
		let totalCount = totalProductCnt; // 게시물 총 갯수
		//let visibleBlock = 13; // 출력할 page 블럭의 갯수
		//let totalPages;
		
		var startRow = (page - 1) * pageSize; // + 1 list는 0부터 시작하니깐;
		var endRow = page * pageSize;
		if (endRow > totalCount) 
		{
			endRow = totalCount;
		}  
		/* var startPage = ((page - 1)/visibleBlock) * visibleBlock + 1;
		var endPage = startPage + visibleBlock - 1;
		if(endPage > totalPages) {    //
		  endPage = totalPages;
		} */
		for (var j = startRow+1; j <= endRow; j++) 
		{	
			//console.log("j : " + j);
			$("#product" + j).show();
		}
		//console.log("총 페이지 : " + $("#pagination-div").twbsPagination("getTotalPages"));
		
	}
	function init(){ //이벤트함수 init		checkLiked(); //초기에 리스트 출력할때에 찜목록을 확인하여 하트에 불이 들어온다.
		clickEvent(); //클릭이벤트 
		categoryParentChange(); //부모카테고리 값이 바뀌면 동작하는 이벤 
		sortOption();
		search();
		setProductList(); // 최초 상품목록 불러오기
		ProductViewEvent();
		
	}
	$(document).ready(function() {
		init();
		 //pagingEvent();
		 //paging();
		//listSort("productName");
	})
</script>
