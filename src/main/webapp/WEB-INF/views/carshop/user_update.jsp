<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">

<%@ include file="../include/header.jsp"%>

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
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">회원
									ID : </label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="u_id"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">비밀번호
									: </label>
								<div class="col-lg-9">
									<input class="form-control" type="password" name="u_pw">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">이름
									:</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">전화번호
									:</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="phone">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">이메일
									: </label>
								<div class="col-lg-9">
									<input class="form-control" type="email" name="email">
								</div>
							</div>
							<form name="form" id="form" method="post">

								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">주소
										: </label>
									<div class="col-lg-9">
										<input type="text" id="roadFullAddr" name="roadFullAddr"
											class="form-control" readonly="readonly" onclick="goPopup()"
											placeholder="클릭하세요" value="roadFullAddr"/>
									</div>
								</div>
							</form>
							<div class="form-group row" style="float: right">

								<input type="button" class="btn btn-primary" value="수정">
							</div>
						</div>
					</div>
					<!-- /form user info -->

				</div>
			</div>
		</div>
	</div>

</body>

<script>
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;

	}
</script>


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
</style>
<%@ include file="../include/footer.jsp"%>