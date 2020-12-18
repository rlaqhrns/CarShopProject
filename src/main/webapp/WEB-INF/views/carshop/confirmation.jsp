<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


	<title>Aroma Shop</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
	<link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">
	
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>주문 확인서</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">구매이력을 조회합니다.</a></li>
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
      <p class="text-center billing-alert">감사합니다 주문상세정보를 확인하세요.</p>

      <div class="order_details_table">
        <h2>주문 상세정보</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
              	<th scope="col">구매날짜</th>
                <th scope="col">구매물품</th>
                <th scope="col">상품수량</th>
                <th scope="col">상품가격</th>
                <th scope="col">결제수단</th>
                <th scope="col">교환</th>
                <th scope="col">환불</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${list}" var ="login" varStatus="status">
                    <tr>
                      <td><c:out value="${login.free_id}"></c:out></td>                    
                      <td><c:out value="${login.free_name}"></c:out></td>
                      <td><c:out value="${login.free_password}"></c:out></td>
                      <td><c:out value="${login.main_address}"></c:out></td>
                      <td><c:out value="${login.detail_address}"></c:out></td>
                      <td><c:out value="${login.cellphone}"></c:out></td>
                      <td><c:out value="${login.invoice}"></c:out></td>
                   </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
  <!--================End Order Details Area =================-->

	
	

<%@ include file="../include/footer.jsp"%>