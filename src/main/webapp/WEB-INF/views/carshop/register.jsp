<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	<!--================ End Header Menu Area =================-->
  <link rel="stylesheet" href="/resources/css/register.css">
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center" style = "text-align: center!important;">
					<h1>Register</h1>
					<!--<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Register</li>
            </ol>
          </nav> -->
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
				<div class="col-lg-6 col-log-6_registerForm" >
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" action="#/" id="register_form" >
						<div class="registerForm1" id="registerForm1" style="position: relative;visibility:visible;background:'white';">
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="userid" name="UserID" placeholder="User ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User ID'">
								<input type="button" value="중복확인" class="check_btn" id="id_check">
							</div>
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="password" name="Password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
              				</div>
              				<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="username" name="User Name" placeholder="User Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'">
              				</div>
              				<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="email" name="email" placeholder="e-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'e-mail'">
								<input type="button" value="이메일 인증" class="check_btn" id="email_send">
							</div>
							<div class="col-md-12 form-group registerForm_input">
								<input type="text" class="form-control" id="email_check" name="email_check">
								<input type="button" value="확인" class="check_btn" id="email_check">
							</div>
							<div class="col-md-12 form-group register_btn_div register_next_btn">
							<input type="button" value="다음" class="button button-register w-100 register_btn" onclick="document.getElementById('registerForm1').style.visibility='hidden';document.getElementById('registerForm2').style.visibility='visible';">
							</div>		
						</div>
					
							
							<div class="registerForm2" id="registerForm2" style="position: relative;width: 100%;height: 610px; background-color: transparent;min-height: 1px;padding-right: 15px;padding-left: 15px;top: -610px;left: 570px;visibility:hidden">
								<div class="col-md-12 form-group registerForm_input">
									<input type="text" class="form-control" id="phone" name="phone" placeholder="phone number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'phone number'">
								</div>
								
	              				<div class="col-md-12 form-group registerForm_input register_juso_div">
		              				<!-- <div style="display:flex">
										<input type="text" id="sample2_postcode" placeholder="우편번호">
										<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
		              				</div>
		              				<div>
										<input type="text" name="juso1" id="sample2_address" placeholder="주소"><br>
										<input type="text" name="juso2" id="sample2_detailAddress" placeholder="상세주소">
										<input type="text" name="juso3" id="sample2_extraAddress" placeholder="참고항목">
		              				</div>  -->
		              				<div style="display:flex">
										<input type="text" id="sample2_postcode" placeholder="우편번호">
										<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" class="check_btn"><br>
									</div>
										<input type="text" name="juso1" style="width:250px;" id="sample2_address" placeholder="주소"><br>
										<input type="text" name="juso2" style="width:250px;" id="sample2_detailAddress" placeholder="상세주소">
										<input type="text" name="juso3" style="width:250px;" id="sample2_extraAddress" placeholder="참고항목">
									
									<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
									<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
									
									<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
									    // 우편번호 찾기 화면을 넣을 element
									    var element_layer = document.getElementById('layer');
									
									    function closeDaumPostcode() {
									        // iframe을 넣은 element를 안보이게 한다.
									        element_layer.style.display = 'none';
									    }
									
									    function sample2_execDaumPostcode() {
									        new daum.Postcode({
									            oncomplete: function(data) {
									                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
									
									                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
									                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									                var addr = ''; // 주소 변수
									                var extraAddr = ''; // 참고항목 변수
									
									                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									                    addr = data.roadAddress;
									                } else { // 사용자가 지번 주소를 선택했을 경우(J)
									                    addr = data.jibunAddress;
									                }
									
									                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									                if(data.userSelectedType === 'R'){
									                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
									                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
									                        extraAddr += data.bname;
									                    }
									                    // 건물명이 있고, 공동주택일 경우 추가한다.
									                    if(data.buildingName !== '' && data.apartment === 'Y'){
									                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									                    }
									                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									                    if(extraAddr !== ''){
									                        extraAddr = ' (' + extraAddr + ')';
									                    }
									                    // 조합된 참고항목을 해당 필드에 넣는다.
									                    document.getElementById("sample2_extraAddress").value = extraAddr;
									                
									                } else {
									                    document.getElementById("sample2_extraAddress").value = '';
									                }
									
									                // 우편번호와 주소 정보를 해당 필드에 넣는다.
									                document.getElementById('sample2_postcode').value = data.zonecode;
									                document.getElementById("sample2_address").value = addr;
									                // 커서를 상세주소 필드로 이동한다.
									                document.getElementById("sample2_detailAddress").focus();
									
									                // iframe을 넣은 element를 안보이게 한다.
									                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
									                element_layer.style.display = 'none';
									            },
									            width : '100%',
									            height : '100%',
									            maxSuggestItems : 5
									        }).embed(element_layer);
									
									        // iframe을 넣은 element를 보이게 한다.
									        element_layer.style.display = 'block';
									
									        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
									        initLayerPosition();
									    }
									
									    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
									    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
									    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
									    function initLayerPosition(){
									        var width = 300; //우편번호서비스가 들어갈 element의 width
									        var height = 400; //우편번호서비스가 들어갈 element의 height
									        var borderWidth = 5; //샘플에서 사용하는 border의 두께
									
									        // 위에서 선언한 값들을 실제 element에 넣는다.
									        element_layer.style.width = width + 'px';
									        element_layer.style.height = height + 'px';
									        element_layer.style.border = borderWidth + 'px solid';
									        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
									        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
									        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
									    }
									</script>
								</div>
								<div class="col-md-12 form-group registerForm_input register_model_div">
								<p style="padding: 10px 30px;">car model</p>
									<label for="cars"></label>
									<select name="cars" id="cars" style="min-width:300px !important;"> <!-- 자동차 정보 수정 -->
										<option value="소나타">소나타</option>
										<option value="그린저">그린저</option>
										<option value="카니발">카니발</option>
										<option value="소울">소울</option>
										<option value="마티즈">마티즈</option>
									</select>
									
								</div>
								<div class="col-md-12 form-group register_btn_div">
									<input type="button" value="이전" class="button button-register w-100 register_btn" onclick="document.getElementById('registerForm2').style.visibility='hidden';document.getElementById('registerForm1').style.visibility='visible';">
									<button type="submit" value="submit" class="button button-register w-100 register_btn">가입완료</button>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
<%@ include file="../include/footer.jsp"%>
