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
					<h1>블랙리스트</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">불량판매자를 조회합니다.</a></li>
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
      <p class="text-center billing-alert">불량판매자 블랙리스트</p>

      <div class="order_details_table">
        <h2>상세정보</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
              	<th scope="col">번호</th>
                <th scope="col">판매자</th>
                <th scope="col">날짜</th>
                <th scope="col">리스트내리기</th>
                <th scope="col">계정삭제</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${black}" var ="login" varStatus="status">
                    <tr>
                      <td><c:out value="${black.rownum}"></c:out></td>                    
                      <td><c:out value="${black.s_id}"></c:out></td>
                      <td><c:out value="${black.date}"></c:out></td>
                      <td><button class="" onclick="location.href='블랙리스트에서/delete'">내리기</button></td>
                      <td><button class="" onclick="location.href='계정/delete'">삭제</button></td>
                   </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
  <!--================End Order Details Area =================-->

	
	

<%@ include file="../include/footer.jsp"%>