<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	<!--================ End Header Menu Area =================-->
  
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Register</li>
            </ol>
          </nav>
				</div>
			</div>
			<div class="register_type">
				<input type="button" value="user register" class="register_type_btn" id="user_type" onClick="#"> 
				<input type="button" value="seller register" class="register_type_btn" id="seller_type" onClick="location.href='seller_register'"> 
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
							<h4>Already have an account?</h4>
							<br>
							<a class="button button-account" href="login.html">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" action="#/" id="register_form" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userid" name="UserID" placeholder="User ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User ID'">
								<input type="button" value="중복확인" class="check_btn" id="id_check">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="password" name="Password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="username" name="User Name" placeholder="User Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="e-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'e-mail'">
								<input type="button" value="이메일 인증" class="check_btn" id="email_send">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email_check" name="email_check">
								<input type="button" value="확인" class="check_btn" id="email_check">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label> <!-- 이건 무슨 기능???? -->
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">Register</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" action="#/" id="register_form" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userid" name="UserID" placeholder="User ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User ID'">
								<input type="button" value="중복확인" class="check_btn" id="id_check">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="password" name="Password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="username" name="User Name" placeholder="User Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="e-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'e-mail'">
								<input type="button" value="이메일 인증" class="check_btn" id="email_send">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email_check" name="email_check">
								<input type="button" value="확인" class="check_btn" id="email_check">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label> <!-- 이건 무슨 기능???? -->
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
<%@ include file="../include/footer.jsp"%>
