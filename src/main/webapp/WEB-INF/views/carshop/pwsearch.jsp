<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/headerNoLogin.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<script src="https://kit.fontawesome.com/faeeff50dd.js" crossorigin="anonymous"></script>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " ></script>     <!-- sweetAlert -->
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script type="text/javascript"></script>
<script>
//이메일 유효성 검사
function email_check(email){  
	var mail = email;                                              
    var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(regex.test(mail) == false) {
		return false;
	};
	return true;
}; 
</script>

<script>
function sendFormUsingAjax(){

	var queryString = $('#email').val();              
	
	//이메일체크
	if (!email_check(queryString)) {
		console.log(email_check(queryString));
		swal("Oops", "이메일 형식에 맞게 작성해주세요", "error");
		return ;
	}else {
		console.log("정상동작");
	}
	
	console.log(queryString);
	$.ajax({
			url: '/carshop/pwsearch',
			type : 'post',
			dataType : "json",
		    contentType: "application/json; charset=utf-8",
		    data : JSON.stringify({'email' : queryString}),
		    
			success:function(data){
				if(data){
					swal("Good job", "가입한 이메일주소로 pw재설정 메일보내드렸어요:-)", "success");
				}else {
					swal("Oops", "이메일주소를 다시확인해주세요! :-(", "error");
				}
			},
			error :function(){
				console.log("실패함");
			}
	})
}
</script>

<style>
.container .box{
	border : 1px solid lightgray;
}
.container .box {
	margin-top : 100px;
	margin-bottom : 100px;
	border : 1px solid #dcdcdc;
}
.container .box .text-box .size-20 {
	font-size : 20px;
	margin-top : 30px;
	margin-left : 30px;
	margin-bottom : 50px;
	
}
.container .box .text-box hr {
	margin-top : 50px;
	width : 630px;
}
.container .box .sendemail {
	margin-top : 30px;
	margin-left : 30px;
}
.container .box .sendemail .row .form-group .col-md-12 .email {
	color : black;
	font-weight : bold;
}
.container .box .sendemail .row .form-group .col-md-12 .writeemail {
	color : blue;
	width : 400px;
	height : 35px;
	font-size : 15px;
	border : 2px solid #dcdcdc;
}
.container .box .sendemail .row .form-group .col-md-12 input::placeholder {
	color : #c8c8c8;
}
.container .box .sendemail .row2 {
	margin-top : 50px;
	margin-left : 20px;
	margin-bottom : 60px;
	
}
.container .box .sendemail .row2 .btn {
	color : white;
	font-weight : bold;
	height : 45px;
	
}
@media screen and (min-width:1200px) {
	.container .box .text-box hr {
		width : 100%;
	}
}
@media screen and (min-width:768px) {
	.container .box .text-box hr {
		width : 100%;
	}
}
@media screen and (min-width:480px) {
	.container .box .text-box hr {
		width : 100%;	
	}
}
@media screen and (max-width:480px) {
	.container .box .sendemail .row .form-group .col-md-12 .writeemail {
		width : 100%;
	}
}
</style>
	<!--================ End Header Menu Area =================-->

	<!--================Password Search Area =================-->
<body>
	<section>
		<div class="container">
			<div class="box">
				<div class="text-box">
					<h2 class="size-20">비밀번호 찾기</h2>
					<hr class="hr">
				</div>
				<form class="sendemail" id="sendmail" method="post" action="">
					<fieldset>
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label class="email" >이메일<br>
									<input class="writeemail" id="email"  name="email" type="email" style="border:1 solid light-gray;" placeholder="  가입하신 이메일을 입력해주세요" required>
									</label>
								</div>
							</div>
						</div>
					</fieldset>
					<div class="row2">
						<button class="btn" type="button" onclick="sendFormUsingAjax()" style="background-color : #2ed5e5;">
						<i class="fa fa-check"></i>
						인증 메일 받기
						</button>
					</div>

				</form>
			</div>
		</div>
	</section>
</body>

	<!--================End Password Search Area =================-->

<%@ include file="../include/footer.jsp"%>