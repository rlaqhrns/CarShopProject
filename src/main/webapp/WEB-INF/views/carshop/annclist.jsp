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
					<h1>공지 목록</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">공지사항 목록</a></li>
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
      <p class="text-center billing-alert">공지 목록</p>

      <div class="order_details_table">
        <h2>상세정보</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
              	<th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">등록날짜</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${annc}" var ="login" varStatus="status">
                    <tr>
                      <td><c:out value="${annc.rownum}"></c:out></td>                    
                      <td><c:out value="${annc.title}"></c:out></td>
                      <td><c:out value="${annc.writer}"></c:out></td>
                      <td><c:out value="${annc.date}"></c:out></td>
                   </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
  <!--================End Order Details Area =================-->

	
	

<%@ include file="../include/footer.jsp"%>