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
.container .box .sendpw {
	margin-top : 30px;
	margin-left : 30px;
}
.container .box .sendpw .row {
	
}
.container .box .sendpw .row .form-group .col-md-12 .pw {
	color : black;
	font-weight : bold;
}
.container .box .sendpw .row .form-group .col-md-12 .writepw {
	color : black;
	width : 400px;
	height : 35px;
	font-size : 15px;
	border : 2px solid #dcdcdc;
}
.container .box .sendpw .row .form-group .col-md-12 input::placeholder {
	color : #c8c8c8;
}
.container .box .sendpw .row2 {
	margin-top : 50px;
	margin-left : 20px;
	margin-bottom : 60px;
	
}
.container .box .sendpw .row2 .btn {
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
            <h2 class="size-20">비밀번호 재설정</h2>
            <hr class="hr">
          </div>
          <form class="sendpw" method="post" action="pwsetting2">
            <fieldset>
              <div class="row">
                <div class="form-group">
                  <div class="col-md-12">
                    <label class="pw" >비밀번호　<input class="writepw" id="pw1" type="password" style="border:1 solid light-gray;" placeholder=" 영문.숫자.특수기호 8자리 이상" name="pw1"  required>
                    </label>
                          </div>
                          <br>
                          <div class="col-md-12">
                    <label class="pw" >비번확인　<input class="writepw" id="pw2" type="password" style="border:1 solid light-gray;" placeholder=" 한번 더 입력해주세요" name="pw2"  required>
                    </label>
                    <input type="hidden" name="email" value='<c:out value="${email}"/>' /> 
                  </div>
                </div>
              </div>
            </fieldset>
            <div class="row2">
              <button class="btn" type="submit"  style="background-color : #2ed5e5;">
                <i class="fas fa-lock"></i>
                  비밀번호 재설정
              </button>
            </div>
          </form>
        </div>
      </div>
    </section>
  </body>
<script> <!--비번이 잘못되었는지 확인하는 함수 -->
function ValidatePW(pw1) {
    var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
    return regExpPw.test(pw1);
};  
</script>
<script> <!--"비번재설정"클릭시 실행되는 함수 -->
$(document).ready(function(){
	$(".btn").click(function(){
		 var pw1 = $('#pw1').val();
	     var pw2 = $('#pw2').val();
	      console.log("1111111111")
		//비번이 제대로 입력이 되지않은경우
		if(pw1==' ' || pw2==' ') {
			console.log("2222222")
			swal("Please write", "Password를 기입해주세요!", "info");
			return;
		}
		//이메일 유효성 검사
		if (!ValidatePW(pw1)) {
			console.log("333333333")
	        swal("Oops", "영문,숫자,특수기호포함 8자 이상 기입해주세요", "error");
	         return
	    }
	    if(pw1 != pw2) {
	    	console.log("444444")
	    	swal("Oops", "Password가 일치하지않아요:-(", "error");
			return
	    }	
	});
});
// function pwcheckAjax(){
// 	 var pw1 = $('#pw1').val();
//      var pw2 = $('#pw2').val();
//       console.log("1111111111")
// 	//비번이 제대로 입력이 되지않은경우
// 	if(pw1==' ' || pw2==' ') {
// 		console.log("2222222")
// 		swal("Please write", "Password를 기입해주세요!", "info");
// 		return;
// 	}
// 	//이메일 유효성 검사
// 	if (!ValidatePW(pw1)) {
// 		console.log("333333333")
//         swal("Oops", "영문,숫자,특수기호포함 8자 이상 기입해주세요", "error");
//          return
//     }
//     if(pw1 != pw2) {
//     	console.log("444444")
//     	swal("Oops", "Password가 일치하지않아요:-(", "error");
// 		return
//     }	
    //위의 조건이 모두 만족하면 pwsetting2로 돌아가는방법
    //location.href=""
    
// 	$.ajax({
// 		url: '/carshop/pwsetting2',
// 		type : 'post',
// 		dataType : "json",
// 	    contentType: "application/json; charset=utf-8",
// 	    data : JSON.stringify({
// 	    	'pw1' : pw1,
// 	    	'pw2' : pw2,
// 	    }),
	    
// 		success:function(data){
// 			if(data == "0"){
// 				console.log("성공함");
// 			}else {
// 				console.log("모냐이거");
// 			}
// 		},
// 		error :function(){
// 			console.log("실패함");
// 		}
// 	})
// }	
</script>
  

	<!--================End Password Search Area =================-->
<%@ include file="../include/footer.jsp"%>