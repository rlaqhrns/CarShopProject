<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<c:set var="now" value="<%= new java.util.Date() %>"></c:set>
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm" /> </c:set>

<div class="content py-5  bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<span class="anchor" id="formUserEdit"></span>
				<!-- form user info -->
				<div class="card card-outline-secondary">
					<div class="card-header">
						<h3 class="mb-0">신고글 작성</h3>
					</div>
					<div class="card-body">
						<form method="post" action="/carshop/reportsubmit">
							<div class="media post_item">
								<img class="prod_pic" src="/resources/img/upload/${prod.img1 }" alt="post" style="width: 100px; height: 60px;">
								<div class="media-body">
									<p><c:out value="${prod.p_name }"></c:out></p>
									<p><c:out value="${prod.amount }"></c:out>원</p>
									<input class="form-control" type="hidden" value="${prod.s_id }" name="s_id">
									<input class="form-control" type="hidden" value="${prod.p_no }" name="p_no">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">신고사유
									: </label>
								<div class="col-lg-9">
									<textarea class="form-control" cols="80" rows="5" name="content"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">신고자
									ID : </label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="u_id"
										value="<c:out value="${u_id}"></c:out>"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">신고날짜 : </label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="date"
										value="<c:out value="${today}"></c:out>"
										readonly="readonly">
								</div>
							</div>

							<div class="form-group row" style="float: right">

								<input type="submit" class="btn btn-primary" value="신고">
							</div>
						</form>
					</div>
				</div>
				<!-- /form user info -->

			</div>
		</div>
	</div>
</div>

</body>

<%@ include file="../include/footer.jsp"%>