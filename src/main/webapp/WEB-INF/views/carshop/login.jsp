<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	<!--================ End Header Menu Area =================-->
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>Document</title>
<script src="https://kit.fontawesome.com/faeeff50dd.js" crossorigin="anonymous"></script>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " ></script>     <!-- sweetAlert -->
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script type="text/javascript"></script>	
<script>
function showSwal(){

	var id = $('#id').val();   
	var pw = $('#pw').val();  
	
	console.log("정상동작");
	console.log(id + pw);
	$.ajax({
			url: '/carshop/login',
			type : 'post',
			dataType : "json",
		    contentType: "application/json; charset=utf-8",
		    data : JSON.stringify({
		    	'id' : id,
		    	'pw' : pw,
		    	}),
			success:function(data){
				if(data == "-1"){
					$('#idmessage').attr("type","text").css("color","red");
					$('#pwmessage').attr("type","text").css("color","red");
				}else {
					console.log("정상종료");
					location.href="indexlogin"
				}
			},
			error :function(){
				console.log("실패함");
			}
	})
}	
</script>	
<style>
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message {
	margin-left : 260px;
	margin-top : -23px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message .idmessage{

	width : 130px;
	color : red;
	border : none;
	border-radius : 10px;
	font-size : 12px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message2 {
	margin-left : 260px;
	margin-top : -23px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message2 .pwmessage{

	width : 130px;
	color : red;
	border : none;
	border-radius : 10px;
	font-size : 12px;
}

</style>

  <!-- ================ start banner area ================= -->	
  <body>
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Login</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Login</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>New to our website?</h4>
							<a class="button button-account" href="register.html">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form" action="" id="contactForm" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="UserID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'UserID'">
							</div>
							<div class="message">
								<input type="hidden" id="idmessage" class="idmessage" tabindex="-1" value="ID를 확인해주세요" readonly>
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							<div class="message2">
								<input type="hidden" id="pwmessage" class="pwmessage" tabindex="-1" value="pw를 확인해주세요" readonly>
							</div>
							<div class="col-md-12 form-group">

							</div>
							<div class="col-md-12 form-group">
								<button type="button" onclick="showSwal()" class="button button-login w-100">Log In</button>
								<a href="pwsearch">Forgot Password?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
	<!--================End Login Box Area =================-->


	
<%@ include file="../include/footer.jsp"%>