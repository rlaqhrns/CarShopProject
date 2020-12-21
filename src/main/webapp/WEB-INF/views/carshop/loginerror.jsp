<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<script src="https://kit.fontawesome.com/faeeff50dd.js" crossorigin="anonymous"></script>
<style>
.blog-banner .text-center .row {
	display : flex;
	flex-direction : row;
	justify-content : center;
}
.blog-banner .text-center .row .login_form_inner{
	display : flex;
	flex-direction : column;
}
</style>
	<!--================ End Header Menu Area =================-->
	
	
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h3>ID 또는 비밀번호를 다시 확인해주세요:-)</h3>
					<h1></h1>
					<h1></h1>
					<form class="row login_form" action="loginerror.html" id="contactForm" method="post">
					<div class="login_form_inner" style="width: 230px; height: 120px;" >
						<h2>Login Again!</h2>
						<form class="row login_form" action="login.html" id="contactForm" method="post">
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">Log In <i class="fas fa-chevron-right"></i></button>
							</div>
						</form>
					</div>
					</form>
					<nav aria-label="breadcrumb" class="banner-breadcrumb"></nav>
				</div>
			</div>	
	</section>
	<!-- ================ end banner area ================= -->
	
<%@ include file="../include/footer.jsp"%>