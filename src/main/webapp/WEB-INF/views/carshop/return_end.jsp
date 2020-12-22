<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%@ include file="../include/header.jsp"%>


<title>Aroma Shop</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/vendors/nouislider/nouislider.min.css">

<body>
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
								<th scope="col"><strong>주문번호</strong></th>
								<th scope="col"><strong>구매자</strong></th>
								<th scope="col"><strong>상품명</strong></th>
								<th scope="col"><strong>사유</strong></th>
								<th scope="col"><strong>날짜</strong></th>
								<th scope="col"><strong>결제수단</strong></th>
								<th scope="col"><strong>교환/환불</strong></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="list">
								<tr>
									<td scope="col" id="ono"><c:out value="${list.ono}" /></td>
									<td scope="col" id="u_id"><c:out value="${list.u_id}" /></td>
									<td scope="col" id="p_name"><c:out value="${list.pname}" /></td>
									<td scope="col" id="content" data-content="${list.content }"
										data-toggle="modal" data-target="#myModal"><c:choose>
											<c:when test="${fn:length(list.content) > 2 }">
												<c:out value="${fn:substring(list.content,0,2	) }" />...	
											</c:when>
											<c:otherwise>
												<c:out value="${list.content}" />
											</c:otherwise>

										</c:choose> <%-- 	<input type="hidden" value="${list.content }" id="content_hidden"> --%>
									</td>

									<td scope="col" id="order_date"><c:out
											value="${list.order_date}" /></td>
									<td scope="col" id="pay"><c:out value="${list.pay}" /></td>
									<td scope="col" class="span1" id=""><button
											class="btn btn-success">
											<span><strong>교환/반품</strong></span>
										</button></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!--  Modal -->
					<div id="myModal" class="modal fade in">
						<div class="modal-dialog">
							<div class="modal-content">
									<div class="modal-header">
										<a class="btn btn-default" data-dismiss="modal"><span
											class="glyphicon glyphicon-remove"></span></a>
										<h4 class="modal-title">Modal Heading</h4>
									</div>
									<div class="modal-body" id="modal_conten">
									</div>
									<div class="modal-footer">
										<div class="btn-group">
											<button class="btn btn-primary" data-dismiss="modal" id="modalbtn">
												<span class="glyphicon glyphicon-remove"></span> 확인
											</button>
										</div>
									</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dalog -->
					</div>
					<!-- /.modal -->


				</div>
			</div>
		</div>
	</section>
</body>
<script>
	$(document).ready(function() {
		$("td#content").click(function() {

			// 			let parent = $(this).parent();
			// 			console.log(parent.find("#ono").text());
			// 			console.log(parent.find("#content_hidden").val());
			let content = $(this).data("content");
			console.log("data  :", content);
			let conten =  $('#modal_conten');
			conten.append('<p>'+content+'</p>');
			
		})
		
		$('#modalbtn').click(function(){
			console.log("클릭확인");
			$('#modal_conten').empty();
		})

		

			
			
	})
</script>


<!--================End Order Details Area =================-->




<%@ include file="../include/footer.jsp"%>