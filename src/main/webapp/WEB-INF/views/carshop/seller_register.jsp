
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!--================ End Header Menu Area =================-->
<link rel="stylesheet" href="/resources/css/register.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<!-- 이메일 보내는 js -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
<!-- 주소 api를 위한 js -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/seller_register.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center" style="text-align: center !important;">
				<h1>Register</h1>

			</div>
		</div>
		<div class="register_type">
			<input type="button" value="user register" class="register_type_btn"
				id="user_type" onClick="location.href='register'"> <input type="button"
				value="seller register" class="register_type_btn" id="seller_type"
				onClick="#">
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
						<br> <a class="button button-account" href="login.html">Login
							Now</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-log-6_registerForm">
				<div class="login_form_inner register_form_inner">
					<h3>seller register</h3>
					<form class="row login_form" action="onseller_register" id="register_form" method="post"
						onsubmit="return finalcheck()">
						<div class="registerForm1" id="registerForm1"
							style="position: relative; visibility: visible; background: 'white';">
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="userid"
									name="s_id" placeholder="User ID"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'User ID'"> <input
									type="button" value="중복확인" class="check_btn" id="id_check">
							</div>
							<div class="tip_massage_div">
								<input type="text" value="" class="tip_massage" id="mid" style="width:250px"
									tabindex="-1" readonly>
							</div>
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="password"
									onkeyup="pwdcheck()" name="s_pw" placeholder="Password"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Password'">
							</div>
							<div class="tip_massage_div">
								<input type="text" value="" style="width: 300px"
									class="tip_massage" id="mpwd" tabindex="-1" readonly>
							</div>
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="username"
									onkeyup="namecheck()" name="name" placeholder="User Name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'User Name'">
							</div>
							<div class="tip_massage_div">
								<input type="text" value="" class="tip_massage" id="mname"
									tabindex="-1" readonly>
							</div>
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="e-mail" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'e-mail'"> <input
									type="button" value="이메일 인증" class="check_btn" id="email_send">
							</div>
							<div class="tip_massage_div">
								<input type="text" value="" style="width: 300px"
									class="tip_massage" id="memail" tabindex="-1" readonly>
							</div>
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="emailcode"
									name="emailcode"> <input type="button" value="확인"
									class="check_btn" id="email_check">
							</div>
							<div class="tip_massage_div">
								<input type="text" value="" class="tip_massage" id="memailcode"
									tabindex="-1" readonly>
							</div>
							<div
								class="col-md-12 form-group register_btn_div register_next_btn">
								<input type="button" value="다음"
									class="button button-register w-100 register_btn"
									onclick="document.getElementById('registerForm1').style.visibility='hidden';document.getElementById('registerForm2').style.visibility='visible';">
							</div>
						</div>


						<div class="registerForm2" id="registerForm2"
							style="position: relative; width: 100%; height: 610px; background-color: transparent; min-height: 1px; padding-left: 15px; top: -610px; left: 570px; visibility: hidden">
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="phone"
									onkeyup="phonecheck()" name="phone" placeholder="phone number"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'phone number'">
							</div>
							<div class="tip_massage_div">
								<input type="text" value="" style="width: 300px" tabindex="-1"
									class="tip_massage" id="mphone" readonly>
							</div>
							<div
								class="col-md-12 form-group registerForm_input register_juso_div">
								<div style="display: flex">
									<input type="text" id="sample2_postcode"
										style="width: 200px; margin-bottom: 10px" placeholder="우편번호">
									<input type="button" onclick="sample2_execDaumPostcode()"
										value="우편번호 찾기" class="check_btn"><br>
								</div>
								<input type="text" name="addr"
									style="width: 300px; margin-bottom: 10px" id="sample2_address"
									placeholder="주소"> <input type="hidden" name="juso2"
									style="width: 300px; margin-bottom: 10px"
									id="sample2_detailAddress" placeholder="상세주소"> <input
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

								<div class="col-md-12 form-group registerForm_input" style="margin-top:20px;">
									<input type="text" class="form-control" id="b_no" name="b_no" placeholder="Business license number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Business license number'">
								</div>
								<div class="col-md-12 form-group registerForm_input" style="margin-top:20px;">
									<input type="text" class="form-control" id="b_name" name="b_name" placeholder="Name of business name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name of business name'">
								</div>
							
							
							
							<div class="col-md-12 form-group register_btn_div" style="margin-top:20px;">
								<input type="button" value="이전"
									class="register_btn_pre button button-register w-100 register_btn"
									onclick="document.getElementById('registerForm2').style.visibility='hidden';document.getElementById('registerForm1').style.visibility='visible';">
								<button type="submit" value="submit" id="submit"
									class="register_btn_submit button button-register w-100 register_btn">가입완료</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript" src="/resources/js/register_addrAPI.js"></script>
<!--================End Login Box Area =================-->
<%@ include file="../include/footer.jsp"%>
