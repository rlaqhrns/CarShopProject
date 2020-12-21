<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- ================ start banner area ================= -->
<script>
	$(function() {

		$("#btnDelete").click(function() {
			if (confirm("장바구니를 모두 비우시겠습니까?")) {
				location.href = "${path}/carshop/cart/deleteAll.do";
				// 모든 장바구니를 초기화 하는 쿼리문 작성 - 버튼 기능은 추후 구현 예정 
			}
		});
	});
</script>


<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>CART</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" aria-current="page">장바구니에
							담긴 상품은 10일 동안 보관됩니다.</li>
					</ol>
				</nav>
			</div>
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
						<tr>
							<th scope="col"><b>장바구니</b></th>
							<th scope="col">price</th>
							<th scope="col"><b>&emsp;&emsp;&emsp;수량</b></th>
							<th scope="col">&ensp;total</th>
							<th scope="col"><b>&emsp;&emsp;&emsp; 삭제 </b></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${map.count == 0 }">
  								  장바구니가 비었습니다.
  								  
    							</c:when>
							<!-- 장바구니가 0 비었을 때, 장바구니가 비었다고 뜬다. -->
							<c:otherwise>
								<!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
								<!-- form을 실행한다.  -->
								<!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동 -->
								<form id="form1" name="form1" method="post"
									action="${path}/carshop/cart/update.do">

									<!-- map에 있는 list출력하기 위해 forEach문을 사용해 row라는 변수에 넣는다. -->
									<c:forEach var="row" items="${map.list}">
										<tr align="center">
											<td>${row.pname}</td>

											<td><fmt:formatNumber value="${row.amount}"
													pattern="#,###,###" />원</td>
											<!-- fmt:formatNumber 태그는 숫자를 양식에 맞춰서 문자열로 변환해주는 태그이다 -->
											<!-- 여기서는 금액을 표현할 때 사용 -->
											<!-- ex) 5,000 / 10,000 등등등-->
											<!-- 물건의 개수 (quantity)를 fmt태그를 사용해서 패턴의 형식에 맞춰서 문자열로 변환함 -->
											<!--1,000 / 5,000 등등~  -->
											<td><input type="number" name="quantity"
												style="width: 30px;"
												value="<fmt:formatNumber value="${row.quantity}"
                      					      	pattern="#,###,###" " />

												<input type="hidden" name="pno" value="${row.pno}">
											</td>
											<td><fmt:formatNumber value="${row.total}"
													pattern="#,###,###" />원</td>

											<td><a
												href="${path}/carshop/cart/delete.do?pno=${row.pno}"
												type="button">삭제</a> <!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 pno (삭제하길원하는 장바구니 pno )를 보내서 삭제한다. -->
											</td>
										</tr>

									</c:forEach>
									<tr class="bottom_button">
										<td><a class="gray_btn" id="btnUpdate" href="#">Update</a>
											<a class="gray_btn ml-2" id="btnDelete" href="#">비우기</a></td>

										<!--btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다.  -->
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<h5>total</h5>
										</td>
										
										<td><fmt:formatNumber value="${map.total}"
														pattern="#,###,###" />원</td>
											
										</td>
									</tr>
									<tr class="shipping_area">
										<td class="d-none d-md-block"></td>


										<td></td>
										<td></td>

										<td>
											<h5>Shipping</h5>
										</td>
										<td>2,500원</td>
									</tr>
									<tr class="out_button_area">
										<td class="d-none-l"></td>
										<td class=""></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<div class="checkout_btn_inner d-flex align-items-center">
												<a class="gray_btn" href="#">쇼핑계속하기</a> <a
													class="primary-btn ml-2" href="#">전체상품주문</a>
											</div>
										</td>
									</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>

			</div>
		</div>
	</div>
</section>
<!--================End Cart Area =================-->

<%@ include file="../include/footer.jsp"%>
