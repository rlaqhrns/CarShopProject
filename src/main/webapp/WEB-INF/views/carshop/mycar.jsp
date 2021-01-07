<%@ include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.login_box_img:before{ /* 파란색 커버 지움 */
	display: none;
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
										<h4>My Car</h4>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="login_form_inner register_form_inner">
									<h3>Choose My Car</h3>
									<!-- 폼 시작, class명은 css가 적용되니 바꾸지 말것, 폼 전송 위해 제이쿼리객체 생성때는 id명으로 하기 -->
									<form class="row login_form" action="/carshop/updatemycar" id="mycar_form" method="post">   
										<label for="cars">model</label>
										<div class="col-md-12 form-group">
											<select name="cars" id="cars" id="carselect">
												<option value="소나타">소나타</option>
												<option value="그랜저">그랜저</option>
												<option value="카니발">카니발</option>
												<option value="소울">소울</option>
												<option value="마티즈">마티즈</option>
											</select>
										</div>
										<!-- 로그인 된 사용자의 다른 정보는 hidden, value는 jstl로 나중에 가져오기 -->
<!-- 										<div class="col-md-12 form-group">
											<input type="hidden" name="u_id" value="">
											<input type="hidden" name="u_pw" value="">
											<input type="hidden" name="name" value="">
											<input type="hidden" name="phone" value="">
											<input type="hidden" name="email" value="">
											<input type="hidden" name="addr" value="">
										</div> -->
											<!-- 전송 버튼 -->
										<div class="col-md-12 form-group">
											<button type="submit" value="submit"
												class="button button-register w-100">my car 등록</button>
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
			var model = '${usercar}';  //페이지가 로드되면 현재 유저의 자동차 정보 가져옴 -성연 2021.01.07
			changepic(model); //유저차에 따른 이미지와 셀렉트 기본값 변화 -성연 2021.01.07

			$("select").change(function() {  //select의 값이 바꼈을때(차종이 선택됐을때)
				let model = $(this).val();
				changepic(model);
			});
			
			function changepic(model) {  //선택 된 차에 따른 이미지 변화 -성연 2021.01.07
				if(model == "소나타"){
					$("div.login_box_img").css({
						'background' : 'url(/resources/img/sonata.jpg)',
						'background-size' : 'cover'
					});
					$("option[value='소나타']").attr("selected", true);
				} else if (model == "그랜저"){
					$("div.login_box_img").css({
						'background' : 'url(/resources/img/grandeur.jpg)',
						'background-size' : 'cover'
					});
					$("option[value='그랜저']").attr("selected", true);
				} else if (model == "카니발"){
					$("div.login_box_img").css({
						'background' : 'url(/resources/img/carnival.jpg)',
						'background-size' : 'cover'
					});
					$("option[value='카니발']").attr("selected", true);
				} else if (model == "소울"){
					$("div.login_box_img").css({
						'background' : 'url(/resources/img/soul.jpg)',
						'background-size' : 'cover'
					});
					$("option[value='소울']").attr("selected", true);
				} else if (model == "마티즈"){
					$("div.login_box_img").css({
						'background' : 'url(/resources/img/matiz.jpg)',
						'background-size' : 'cover'
					});
					$("option[value='마티즈']").attr("selected", true);
				}
			}
		});
	</script>
	<%@ include file="../include/footer.jsp"%>