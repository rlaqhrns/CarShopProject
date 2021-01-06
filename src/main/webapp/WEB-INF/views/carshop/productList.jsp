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
							<ul>
								<!-- default값으로 value = 0 을 설정, 전체 상품목록을 조회할때 사용한다 -->
								<li style="display: none" class="filter-list">
									<input
										class="pixel-radio parts-radio parent-radio" type="radio"
										name="brand"
										id="cateParentDefault"
										value="0" checked>
									<label for="cateParentDefault">전체보기</label>
								</li>
								<!-- 카테고리를 each문으로 출력 -->
								<c:forEach items="${cateParent }" var="cateParent">
									<li class="filter-list">
										<input
											class="pixel-radio parts-radio parent-radio" type="radio"
											id="${cateParent.c_no}" name="brand"
											value="${cateParent.c_no}">
										 <label for="${cateParent.c_no}"> 
										 	<c:out value="${cateParent.c_name}" />
										</label>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
				<div class="sidebar-categories">
					<div class="head">상세부품선택</div>
					<div class="common-filter parts_radio">
						<!-- 전면부품 체크시 나타날 radio -->
						<ul class="main-categories" id="details-parts">
							<li class="filter-list">
								<input class="pixel-radio"type="radio"name="details-parts" value="0" id="detailDefault" checked>
								<label for="detailDefault">전체보기</label>
							</li>
						</ul>
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
					<div class="row" id="product-list-area">
						<!-- 상품 리스트가 들어갈 곳이다. -->
					</div>
					<!-- 페이지  -->
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
<script type="text/javascript" src="/resources/js/productList.js"></script>
