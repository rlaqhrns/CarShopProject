<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<title>CarShop - Product Details</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<style>
.icon_heart_empty {
	margin: 0;
	width: 50px;
	height: 50px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_empty.png);
}

.icon_heart_red {
	margin: 0;
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
						<li class="breadcrumb-item active" aria-current="page">Shop
							Single</li>
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
						<img class="img-fluid" src="/resources/img/category/s-p1.jpg"
							alt="">
					</div>

				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">

				<div class="s_product_text">
					<h3>
						<c:out value="${product.p_name}" />
					</h3>
					<h2>
						<fmt:formatNumber type="number" value="${product.amount}" />
						원
					</h2>
					<ul class="list">
						<li><span>카테고리 </span> : 사이드미러</li>
						<li><span>재고 상태 </span> : 재고 있음</li>
					</ul>
					<p>여러분들이 가고 싶은 무대에는 이미 그린 수료생들이 꿈을 이루고 있습니다. 직장인을 위한 환급제도 과정을
						운용, 최대 80%까지 환급받으실 수 있게 해드리며 그 외에도 공무원 가산점인정, 학점은행제 등을 시행하여 여러분이
						가고 싶은 무대로 더 빨리 갈 수 있게 도와드립니다.</p>
					<div class="card_area d-flex align-items-center">
						<div class="product_count"
							style="margin-top: 20px; float: left; vertical-align: middle;">
							<label for="qty" style="float: left">수량 : </label> <input
								type="number" name="qty" id="sst" size="2" maxlength="12"
								value="1" title="Quantity:" class="input-text qty"
								style="float: left"> <label for=""
								style="margin-left: 15px; float: left">찜 : </label>
							<div class="icon_heart_empty" style="float: left"></div>

							<a class="button primary-btn" href="#" style="margin-left: 30px">장바구니</a>
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
			<li class="nav-item"><a class="nav-link" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">상세설명</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">상품정보(규격)</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">상품문의</a></li>
			<li class="nav-item"><a class="nav-link active" id="review-tab"
				data-toggle="tab" href="#review" role="tab" aria-controls="review"
				aria-selected="false">리뷰</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<p>[ PASSION ] 여러분들이 가고 싶은 무대에는 이미 그린 수료생들이 꿈을 이루고 있습니다. 직장인을 위한
					환급제도 과정을 운용, 최대 80%까지 환급받으실 수 있게 해드리며 그 외에도 공무원 가산점인정, 학점은행제 등을
					시행하여 여러분이 가고 싶은 무대로 더 빨리 갈 수 있게 도와드립니다.</p>
				<p>[ EMOTION ] 진심으로 사람과 사람을 연결합니다. 정규교육과정을 수료한 수강생에게 본사 취업지원실에서
					취업을 성실하게 도와드리고 있습니다.</p>
				<p>[ JOY ] 그린만의 수강할인과 기막힌 혜택이 있습니다. 지역문제로 강의를 들을 수 없는 분들을 위한 무료
					온라인강좌, 수능수험생, 대학생, 국가유공자, 공무원 및 교직원 등을 위한 각종 할인제도를 시행, 협약된 병원, 음식점,
					휘트니스, 미용실, 어학원 출력소 등을 통한 할인혜택을 받을 수 있습니다. (*할인혜택은 지점마다 상이할 수 있습니다.)</p>

			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
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
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="">
					<div class="review_box">
						<h4>상품문의</h4>
						<div class="col-md-12">
							제목  <input type="text" id="ask_title" class="form-control">

							<div class="form-group">
								내용 
								<textarea class="form-control" name="" id="p_ask" cols="30"
									rows="5"></textarea>
							</div>
						</div>
						<div class="col-md-12 text-right">
							<button type="button" id="product_ask" class="btn primary-btn">작성</button>
						</div>
					</div>
				</div>
					<div class="ask" id="ask">
				<c:forEach items="${askList }" var="list">
						<div class="comment_list">
							<div class="review_item" >
								<div class="media">
									<div class="media-body">
										<h4>
											유저 ID :
											<c:out value="${list.u_id }" />
										</h4>
										<h5>
											<small><c:out value="${list.ask_date }" /></small>
										</h5>
										<c:if test="${user.seller == 'Y' }">
										<a class="reply_btn" id="askReply" data-ask_no="${list.ask_no }">Reply</a>
										</c:if>
									</div>
								</div>
								<p>
									문의 제목 :
									<c:out value="${list.ask_title }" />
								</p>
								<h6>
									문의 내용 :
									<c:out value="${list.ask_content }" />
								</h6>
								<div id="ask${list.ask_no }">
								<c:if test="${list.ask_reply != null}">
							<strong>답글 : <c:out value="${list.ask_reply }"></c:out></strong>
								</c:if>
								</div>									
								<br>
							</div>
						</div>
					</c:forEach>
					</div>					
				</div>
	   <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
               <div class="">
                  <div class="col-lg-12">
                     <div class="review_box">
                        <h4>상품리뷰 작성</h4>
                        <form action="replyForm" class="form-contact form-review mt-3" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="u_id" value="${user.id }">
                        <input type="hidden" name="p_no" value="${product.p_no }">
                        <input type="hidden" name="s_id" value="${product.s_id }">
                           <div class="form-group">
                       	    제목  <input type="text" id="ask_title" class="form-control" name="r_title">
          	                            내용  <textarea class="form-control different-control w-100" name="r_content"
                                 id="textarea" cols="30" rows="5"></textarea>
                           </div>
                           <div class="form-group text-center text-md-right mt-3">
                              <input type="file" name="img" multiple="multiple" class="form-control" onchange="setThumbnail(event);">
                              <div id="image_container"></div>
                              <button type="submit" class="button button--active button-review">등록</button>
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="col-lg-12">
                     <div class="review_list">
                     <c:forEach items="${replyList }" var="reply_list">
                        <div class="review_item">
                           <div class="media">
                              <div class="media-body">
                                 <h4>유저 ID :<c:out value="${reply_list.u_id }"></c:out></h4>
								<small><c:out value="${reply_list.r_date }" /></small>
								제목 : <small><c:out value="${reply_list.r_title }" /></small>
										
                              </div>
                           </div>
                           <p><c:out value="${reply_list.r_content }"></c:out></p>
                           <c:if test="${reply_list.r_img1 != null}" >
                           <img src="/resources/img/replyUpload/${reply_list.r_img1 }" width="150px;" height="200px;" onclick="fnImgPop(this.src)" alt="잘못된 이미지 입니다">
                           </c:if>
                           <c:if test="${reply_list.r_img2 != null}" >
                           <img src="/resources/img/replyUpload/${reply_list.r_img2 }" width="150px;" height="200px;" onclick="fnImgPop(this.src)" alt="잘못된 이미지 입니다">
                           </c:if>
                           <c:if test="${reply_list.r_img3 != null}" >
                           <img src="/resources/img/replyUpload/${reply_list.r_img3 }" width="150px;" height="200px;" onclick="fnImgPop(this.src)" alt="잘못된 이미지 입니다">
                       	   </c:if>
                        </div>  
                        </c:forEach>                    
                     </div>
                  </div>
               </div>
			</div>
      </div>
    </div>
</section>
					<!--  Modal -->
  		  	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">답글달기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용</label>
						<textarea class="form-control" id="message-text" name="content"></textarea>
					</div>
			        </form>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary" id="ask_replyBtn">답글달기</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div> 
					<!-- /.modal -->

<!--================End Product Description Area =================-->

<%@ include file="../include/topproduct.jsp"%>
<%@ include file="../include/footer.jsp"%>
<script>
	$empty = $(".icon_heart_empty");

	$empty.click(function() {
		$empty.toggleClass("icon_heart_red");
	})

		$(document).ready(function() {
						let u_id = "${user.id}";
						let seller ="${user.seller}";
						let seller_id = "${product.s_id}";
						let p_no = "${product.p_no}";
						let s_id = "${product.s_id}";
						let list = $("#ask");
						let text = '';
						
		$(document).on("click","#product_ask",function() {
							list.empty();
							let ask_title = $("#ask_title").val();
							let ask_content = $("#p_ask").val();
					// 상품 문의 댓글 ajax 처리
						$.ajax({url : "product_ask",
								data : {
										"p_no" : p_no,
										"u_id" : u_id,
										"s_id" : s_id,
										"ask_title" : ask_title,
										"ask_content" : ask_content},

								dataType : "JSON",
									type : "POST",
								 success : function(data) {
						$.each(data,function(index,value) {
										text =  '<div class="comment_list">';
										text += '<div class="review_item">';
										text += '<div class="media">';
										text += '<div class="media-body">';
										text += '<h4>유저 ID : '+ value.u_id +'</h4>';
										text += '<small><h5>' +value.ask_date + '</h5></small>';
										
										if(seller == 'Y'){
										text += '<a class="reply_btn" id="askReply">Reply</a>';
										}
										
										text += '</div></div>';
										text += '<p>문의 제목 : ' +value.ask_title+ '</p>';
										text += '<h6>문의 내용 : ' +value.ask_content+ '</h6>';
										text += '<div id="ask'+value.ask_no+'">'
										if(value.ask_reply !=null){
										text +='<strong>답글 : '+value.ask_reply+'</strong>'
										}
										text +='</div><br></div></div>';
										list.append(text);

								})	
								},error : function() {
										console.log("통신실패");
														}

													})

										})
				let ask_no ='';
				// reply(답글) 클릭 시 modal 이벤트 발생						
				$(document).on("click","#askReply",function(){
					ask_no = $(this).data("ask_no");
					// 모달 
					$("#exampleModalCenter").modal();
					

					
						})
				// modal 에서 작성 버튼 누를 시 이벤트 발생
				$(document).on("click","#ask_replyBtn",function(){
					let ask_reply = $("#message-text").val();
 					let msg = "";
 					
					$.ajax({
						url : "product_ask_reply",
						data : {"ask_no" : ask_no,
								"ask_reply" : ask_reply,
								"p_no" : p_no},
						dataType:"JSON",
						type:"POST",
						success : function(data){
 						$("#ask"+ask_no).empty();
						$("#ask"+ask_no).append('<strong>답글 : '+ ask_reply +'</strong>');
						console.log("#ask"+ask_no);	 
						},error : function(request,error){
							console.log("통신실패", request.status,"\n",request.responseText);
						}
					})			
 					
				})

			

			
				
	})
	// 이미지 미리보기
	function setThumbnail(event) {

		$("#image_container").empty();
		let size = event.target.files.length;
		if(size>=4){
			alert("최대 3개까지 가능합니다");
			$("#image").val("");
			return false;
		}
		for (var image of event.target.files) { 
			var reader = new FileReader();
			reader.onload = function(event) { 
				var img = document.createElement("img");				
				img.setAttribute("src", event.target.result); 
				img.setAttribute("width", "150px;"); 
				img.setAttribute("height", "200px;"); 
				document.querySelector("div#image_container").appendChild(img)
				}; 
				console.log(image); reader.readAsDataURL(image); } 

				
			}
	//이미지 클릭시 팝업에서 이미지 보기
	 function fnImgPop(url){
			  var img=new Image();
			  img.src=url;
			  var img_width=img.width;
			  var win_width=img.width+25;
			  var img_height=img.height;
			  var win=img.height+30;
			  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
			  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
			 }	
</script>
