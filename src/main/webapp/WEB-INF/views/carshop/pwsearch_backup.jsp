<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
<script> <!--이메일이 잘못되었는지 확인하는 함수 -->
	function email_check(email){                                                 
	    var regex = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(regex.text(email) == false) {      
			return false;
		}
		return true;
	} 
</script>
<script> <!--"인증메일받기"클릭시 실행되는 함수 -->
$(document).ready(function(){
		
		$(".btn").click(function(e){
			var email = $('#email').val();
			//e.preventDefault();
			//이메일이 제대로 입력이 되지않은경우
			if(email==''){
				swal("Please write", "이메일주소를 기입해주세요!", "info");
				return;
			}
			//이메일 유효성 검사
			if (!ValidateEmail(email)) {
				swal("Oops", "이메일주소를 다시확인해주세요!", "error");
        	}else {
        		
        		$.ajax({
        			url: '/carshop/pwsearch',
        			type : 'post',
        			dataType : 'JSON',
        			success:function(result){
        				if(result == "0"){
        					alert("일치하는 이메일정보가 없습니다");
        				}
        			}
        		})
        		
        		
        		
        		//메일발송
            	swal("Good job", "가입한 이메일주소로 pw재설정 메일보내드렸어요:-)", "success");  
        	}
		});	
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var a = "<c:out value="${message1}" />";
	alert(a);
})
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
				<form class="sendemail" method="post" action="pwsearch">
					<fieldset>
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label class="email" >이메일<br>
									<input class="writeemail" id="email" type="email" style="border:1 solid light-gray;" placeholder="  가입하신 이메일을 입력해주세요" name="email" required>
									</label>
								</div>
							</div>
						</div>
					</fieldset>
					<div class="row2">
						<button class="btn" type="submit" style="background-color : #2ed5e5;">
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