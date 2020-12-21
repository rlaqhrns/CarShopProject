<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<title>Aroma Shop</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/vendors/nouislider/nouislider.min.css">

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>교환/환불</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">판매자 전용 페이지입니다.</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->

<!--================Order Details Area =================-->
<section class="order_details section-margin--small">
	<div class="container">
		<p class="text-center billing-alert">교환/반품 신청정보를 확인하세요.</p>

		<div class="order_details_table">
			<h2>교환/반품 정보</h2>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">구매자</th>
							<th scope="col">상품명</th>
							<th scope="col">사유</th>
							<th scope="col">날짜</th>
							<th scope="col">결제수단</th>
							<th scope="col">교환</th>
							<th scope="col">환불</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach items="${list }" var="list">
								<th scope="col"><c:out value="${list.ono}" /></th>
								<th scope="col"><c:out value="${list.u_id}" /></th>
								<th scope="col"><c:out value="${list.p_id}" /></th>
								<th scope="col"><c:out value="${list.content}" /></th>
								<th scope="col"><c:out value="${list.date}" /></th>
<%-- 								<th scope="col"><c:out value="${list.pay}" /></th> --%>

							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<!--================End Order Details Area =================-->




<%@ include file="../include/footer.jsp"%>