<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="../include/header.jsp"%>
<title>저리카 | 회원정보 수정 </title>
<body>

	<div class="content py-5  bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<span class="anchor" id="formUserEdit"></span>
					<!-- form user info -->
					<div class="card card-outline-secondary">
						<div class="card-header">
							<h3 class="mb-0">회원 정보 수정</h3>
						</div>
						<div class="card-body">
							<c:choose>
								<c:when test="${userType == 'user' }">
									<form method="post" action="user_updateok"
										onsubmit="return finalcheck()">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label form-control-label">회원
												ID : </label>
											<div class="col-lg-9">
												<input class="form-control" type="text" name="u_id"
													value="<c:out value="${user.u_id}"></c:out>"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group row" style="margin-bottom: 0.1rem">
											<label class="col-lg-3 col-form-label form-control-label">비밀번호
												: </label>
											<div class="col-lg-9">
												<input class="form-control" type="text" name="u_pw" id="pwd"
													value="<c:out value="${user.u_pw}"></c:out>">
												<div class="tip_massage_div">
													<input type="text" value="" class="tip_massage" id="mpwd"
														style="width: 250px" tabindex="-1" readonly>
												</div>
											</div>
										</div>
								</c:when>
								<c:when test="${userType == 'seller' }">
									<form method="post" action="seller_updateok"
										onsubmit="return finalcheck()">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label form-control-label">회원
												ID : </label>
											<div class="col-lg-9">
												<input class="form-control" type="text" name="s_id"
													value="<c:out value="${user.s_id}"></c:out>"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group row" style="margin-bottom: 0.1rem">
											<label class="col-lg-3 col-form-label form-control-label">비밀번호
												: </label>
											<div class="col-lg-9">
												<input class="form-control" type="text" name="s_pw" id="pwd"
													value="<c:out value="${user.s_pw}"></c:out>">
												<div class="tip_massage_div">
													<input type="text" value="" class="tip_massage" id="mpwd"
														style="width: 250px" tabindex="-1" readonly>
												</div>
											</div>
										</div>
								</c:when>
							</c:choose>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">이름
									:</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="name" id="name"
										value="<c:out value="${user.name}"></c:out>">
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="mname"
											style="width: 250px" tabindex="-1" readonly>
									</div>
								</div>
							</div>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">전화번호
									:</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="phone" id="phone"
										value="<c:out value="${user.phone}"></c:out>">
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="mphone"
											style="width: 250px" tabindex="-1" readonly>
									</div>
								</div>
							</div>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">이메일
									: </label>
								<div class="col-lg-9">
									<input class="form-control" type="email" name="email"
										id="email" value="<c:out value="${user.email}"></c:out>">
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="memail"
											style="width: 250px" tabindex="-1" readonly>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">주소
									: </label>
								<div class="col-lg-9">
									<div style="display: flex">
										<input type="text" id="sample2_postcode" class="form-control"
											style="width: 200px; margin-bottom: 10px" placeholder="우편번호">
										<input type="button" onclick="sample2_execDaumPostcode()"
											value="우편번호 찾기" class="addr_search_btn"><br>
									</div>
									<input type="text" name="addr" class="form-control"
										style="width: 300px; margin-bottom: 10px" id="sample2_address"
										placeholder="주소" value="<c:out value="${user.addr}"></c:out>">
									<input type="text" name="addr2" class="form-control"
										style="width: 300px; margin-bottom: 10px"
										id="sample2_detailAddress" placeholder="상세주소"
										value="<c:out value="${user.addr2}"></c:out>"> <input
										type="hidden" name="juso3"
										style="width: 250px; margin-bottom: 10px"
										id="sample2_extraAddress" placeholder="참고항목">

									<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
									<div id="layer"
										style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
											id="btnCloseLayer"
											style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
											onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>



								</div>
							</div>

							<div class="form-group row" style="float: right">

								<input type="submit" class="btn btn-primary" value="수정">
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

<script type="text/javascript" src="/resources/js/register_addrAPI.js"></script>
<script type="text/javascript" src="/resources/js/user_update.js"></script>

<style>

/************* GENERIC  *****************/
a {
	color: #696969;
}

img {
	width: 100%;
}

.twhite {
	color: #fff !important;
}

.twhite a {
	color: #fff !important;
}
/************* Background ****************/
.bglight1 {
	background: #f2f2f2;
}
/************* TOP-HEAD *****************/
.top-head ul li {
	padding-right: 8px;
}
/****************** Navigation **************/
.navbar-toggler {
	border-color: #dd0000;
}

.navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgb(221, 0, 0, 0.7)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
}
/**************** Banner Slider Carousel **************/
.carousel-inner img {
	width: 100%;
}

.carousel-caption {
	color: #000;
	top: 110px;
	bottom: auto;
	text-align: left;
}

.carousel-caption h1 {
	color: #dd0000;
	background-color: #;
}
/************ Services **************/
.most-car-box:hover {
	background:;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}
/*********** TABS *******/
.nav-tabs {
	border-bottom: 1px solid #ccc;
}

.nav-tabs .nav-link.active {
	border-bottom: 1px solid #dd0000;
	border-radius: 0px;
}
/**************** Social ICONS ***************/
.social-icons {
	margin: 0;
	padding: 0;
	font-size: 8px;
}

.social {
	margin: 7px 7px 7px 0px;
}

#social-fb:hover {
	color: #3B5998;
	transition: all .25s;
}

#social-tw:hover {
	color: #4099FF;
	transition: all .25s;
}

#social-gp:hover {
	color: #d34836;
	transition: all .25s;
}

#social-em:hover {
	color: #f39c12;
	transition: all .25s;
}

#btnCloseLayer {
	width: 20px !important;
	height: 20px;
}

.addr_search_btn {
	width: 110px;
	height: 30px;
	margin: 5px;
	font-size: 14px;
}

/* 툴팁 실패 -> 인풋박스 밑에 만든 div. 이 안에 인풋있음 */
.tip_massage_div {
	font-size: 12px;
	float: left;
}
/* div안에 있는 인풋들 */
.tip_massage {
	border: none;
	color: red;
}
</style>
<%@ include file="../include/footer.jsp"%>