<%@ include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.login_box_img:before{ /* 파란색 커버 지움 */
	display: none;
}
div.login_box_img {
	background: url('/resources/img/business.jpg');
	background-size: cover;
}
</style>
  
	<div class="row">
		<div class="container">
			<div class="cart_inner">
				<section class="login_box_area section-margin">
					<div class="container">
						<div class="row">
							<div class="col-lg-6">  <!-- 여기는 그냥 사진보여주는 박스 -->
								<div class="login_box_img">
									<div class="hover">
										<h4 style="color: olive;">My Business</h4>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="login_form_inner register_form_inner">
									<h3>Business Information</h3>
									<!-- 폼 시작, class명은 css가 적용되니 바꾸지 말것, 폼 전송 위해 제이쿼리객체 생성때는 id명으로 하기 -->
									<form class="row login_form" action="/carshop/updatebsns" id="" method="post">   
										
										<div class="col-md-12 form-group" style="text-align: left;">
											<label for="b_no">사업자번호</label><br>
											<input type="text" id="b_no" name="b_no" placeholder="${seller.b_no }"
												onfocus="this.placeholder = ''" onblur="nonbno()"><br> <!-- 클릭되면 기본값 없어지고 빠져나가면 bno입력됐는지 체크 -성연 2021.01.07 -->
											<div class="tip_massage_div">
												<input type="text" value="" style="border-bottom: none; width: 300px;"
													class="tip_massage" id="emptybno" tabindex="-1" readonly>
											</div>
											<label for="b_name">상호명</label><br>
											<input type="text" id="b_name" name="b_name" placeholder="${seller.b_name }"
												onfocus="this.placeholder = ''"
												onblur="nonbname()">
											<div class="tip_massage_div">
												<input type="text" value="" style="border-bottom: none; width: 300px;"
													class="tip_massage" id="emptybname" tabindex="-1" readonly>
											</div>
										</div>
											<!-- 전송 버튼 -->
										<div class="col-md-12 form-group">
											<button type="button" class="button button-register w-35" onclick="location.href='/carshop/mypage'" style="display: inline-block;">돌아가기</button>
											<button type="submit" value="submit"
												class="button button-register w-35" id="bsnsbtn" style="display: inline-block;">사업자 등록</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$("title").html("저기 카 | Business");
			
			console.log("사업자 콘솔로그");
			
			$("#bsnsbtn").on("click", function(e) {  //전송버튼 클릭되면
				e.preventDefault();
				var bno = $("#b_no").val();
				var bname = $("#b_name").val();
				
				if (bno.length == 0 || bname.length == 0) {  //빈칸 없는 지 확인하고 알림 or 전송 -성연 2021.01.07
					alert("빈칸없이 작성해 주세요");
				} else {
					$(".login_form").submit();
				}
				
				
				
				
			});
			
			
		});
		function nonbno(){  //bno가 빈칸일 때 -성연 2021.01.07
			var bno = $("#b_no").val();
			if(bno.length == 0){
				$("#emptybno").css("color","red");
				$("#emptybno").val("사업자번호는 필수로 입력해야 합니다.");
				$("#b_no").attr("placeholder", "사업자번호 입력");
			} else {
				$("#emptybno").val("");
			} 
		}
		
		function nonbname(){  //bname이 빈칸일 때 -성연 2021.01.07
			var bname = $("#b_name").val();
			if(bname.length == 0){
				$("#emptybname").css("color","red");
				$("#emptybname").val("상호명은 필수로 입력해야 합니다.");
				$("#b_name").attr("placeholder", "상호명 입력");
			} else {
				$("#emptybname").val("");
			} 
		}
		
		
	</script>
	<%@ include file="../include/footer.jsp"%>