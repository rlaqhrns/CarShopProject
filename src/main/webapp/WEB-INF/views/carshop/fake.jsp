<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	
	<title>CarShop - Product Details</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
	
	
	<style>
		.icon_heart_empty{
			margin:0;
			width: 50px;
			height: 50px;
			background-size: cover;
			background-position: center;
			background-image: url(/resources/img/heart/heart_empty.png);
			
		}
		.icon_heart_red{
			margin:0;
			width: 50px;
			height: 50px;
			background-position: center;
			background-size: cover;
			background-image: url(/resources/img/heart/heart_red.png);
		}
	</style>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Single</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop Single</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="/resources/img/category/s-p1.jpg" alt="">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="/resources/img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="/resources/img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>그린컴퓨터 학원 이용권</h3>
						<h2>200,000원</h2>
						<ul class="list">
							<li><span>카테고리 </span> : 사이드미러</li>
							<li><span>재고 상태 </span> : 재고 있음</li>
						</ul>
						<p>
							여러분들이 가고 싶은 무대에는
							이미 그린 수료생들이 꿈을 이루고 있습니다.
							직장인을 위한 환급제도 과정을 운용, 최대 80%까지 환급받으실 수 있게 해드리며 그 외에도 공무원 가산점인정, 학점은행제 등을 시행하여 여러분이 가고 싶은 무대로
							더 빨리 갈 수 있게 도와드립니다.</p>
						<div class="card_area d-flex align-items-center">
							<div class="product_count" style="margin-top:20px;float: left;">
								<label for="qty">수량 : </label>
								
								<input type="number" name="qty" id="sst" size="2" maxlength="12" value="1" title="Quantity:"
									class="input-text qty">
								<div class="icon_heart_empty"></div>
								
								<a class="button primary-btn" href="#" style="margin-left:30px">장바구니</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">상세설명</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">상품정보(규격)</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false">상품문의</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab"
						aria-controls="review" aria-selected="false">리뷰</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>[ PASSION ]
						여러분들이 가고 싶은 무대에는
						이미 그린 수료생들이 꿈을 이루고 있습니다.
						직장인을 위한 환급제도 과정을 운용, 최대 80%까지 환급받으실 수 있게 해드리며 그 외에도 공무원 가산점인정, 학점은행제 등을 시행하여 여러분이 가고 싶은 무대로 더 빨리
						갈 수 있게 도와드립니다.</p>
					<p>[ EMOTION ]
						진심으로 사람과 사람을 연결합니다.
						정규교육과정을 수료한 수강생에게 본사 취업지원실에서 취업을 성실하게 도와드리고 있습니다.</p>
					<p>[ JOY ]
						그린만의 수강할인과 기막힌 혜택이 있습니다.
						지역문제로 강의를 들을 수 없는 분들을 위한 무료 온라인강좌, 수능수험생, 대학생, 국가유공자, 공무원 및 교직원 등을 위한 각종 할인제도를 시행, 협약된 병원, 음식점,
						휘트니스, 미용실, 어학원 출력소 등을 통한 할인혜택을 받을 수 있습니다.
						(*할인혜택은 지점마다 상이할 수 있습니다.)</p>

				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>Width</h5>
									</td>
									<td>
										<h5>128mm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Height</h5>
									</td>
									<td>
										<h5>508mm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Depth</h5>
									</td>
									<td>
										<h5>85mm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Weight</h5>
									</td>
									<td>
										<h5>52gm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Quality checking</h5>
									</td>
									<td>
										<h5>yes</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Freshness Duration</h5>
									</td>
									<td>
										<h5>03days</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>When packeting</h5>
									</td>
									<td>
										<h5>Without touch of hand</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Each Box contains</h5>
									</td>
									<td>
										<h5>60pcs</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="">
						<div class="review_box">
							<h4>상품문의</h4>
							<form class="row contact_form" action="contact_process.php" method="post" id="contactForm"
								novalidate="novalidate">
								<div class="col-md-12">
									<div class="form-group">
										<textarea class="form-control" name="message" id="message"  cols="30" rows="5"
											placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-md-12 text-right">
									<button type="submit" value="submit" class="btn primary-btn">Submit Now</button>
								</div>
							</form>
						</div>
					</div>
					<div class="">
						<div class="comment_list">
							<div class="review_item">
								<div class="media">
									<div class="d-flex">
										<img src="/resources/img/product/review-1.png" alt="">
									</div>
									<div class="media-body">
										<h4>Blake Ruiz</h4>
										<h5>12th Feb, 2018 at 05:56 pm</h5>
										<a class="reply_btn" href="#">Reply</a>
									</div>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
									incididunt ut labore et
									dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
									laboris nisi ut aliquip ex ea
									commodo</p>
							</div>
							<div class="review_item">
								<div class="media">
									<div class="d-flex">
										<img src="/resources/img/product/review-2.png" alt="">
									</div>
									<div class="media-body">
										<h4>Blake Ruiz</h4>
										<h5>12th Feb, 2018 at 05:56 pm</h5>
										<a class="reply_btn" href="#">Reply</a>
									</div>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
									incididunt ut labore et
									dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
									laboris nisi ut aliquip ex ea
									commodo</p>
							</div>
							<div class="review_item">
								<div class="media">
									<div class="d-flex">
										<img src="/resources/img/product/review-3.png" alt="">
									</div>
									<div class="media-body">
										<h4>Blake Ruiz</h4>
										<h5>12th Feb, 2018 at 05:56 pm</h5>
										<a class="reply_btn" href="#">Reply</a>
									</div>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
									incididunt ut labore et
									dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
									laboris nisi ut aliquip ex ea
									commodo</p>
							</div>
						</div>
					</div>

				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="">
						<div class="col-lg-12">
							<div class="review_box">
								<h4>상품리뷰 작성</h4>
								<form action="#/" class="form-contact form-review mt-3">
									<div class="form-group">
										<textarea class="form-control different-control w-100" name="textarea"
											id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
									</div>
									<div class="form-group text-center text-md-right mt-3">
										<button type="submit" class="button button--active button-review">등록</button>
									</div>
								</form>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="/resources/img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
										incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
										laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="/resources/img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
										incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
										laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="/resources/img/product/review-3.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
										incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
										laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!--================End Product Description Area =================-->

	<%@ include file="../include/footer.jsp"%>
	<script>
		$empty = $(".icon_heart_empty");

		$empty.click(function(){
			$empty.toggleClass("icon_heart_red");
		})

	</script>