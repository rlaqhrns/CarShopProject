<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/vendors/nouislider/nouislider.min.js"></script>




<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	float: right;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input.default:checked+.slider {
	background-color: #444;
}

input.primary:checked+.slider {
	background-color: #2196F3;
}

input.success:checked+.slider {
	background-color: #8bc34a;
}

input.info:checked+.slider {
	background-color: #3de0f5;
}

input.warning:checked+.slider {
	background-color: #FFC107;
}

input.danger:checked+.slider {
	background-color: #f44336;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>


<body>



	<div class="row" style="margin: 20px 200px 20px 200px;">
		<div class="col-lg-12">
			<h1 class="page-header">상품 등록</h1>
		</div>
	</div>

	<div class="row" style="margin: 0px 200px 20px 200px;">
		<div class="col-lg-12">
			<div class="panel panel-default"></div>
			<div class="panel-body">
				<form action="productForm" role="form" method="post">
					<div class="col-xl-3 col-lg-4 col-md-5">
						<div class="sidebar-categories">
							<div class="head">카테고리</div>
							<ul class="main-categories">
								<c:forEach items="${cateParent }" var="cateParent">
									<li class="common-filter">
										<ul>
											<li class="filter-list"><input
												class="pixel-checkbox parts-radio" type="radio"
												id="${cateParent.c_no }" name="brand"
												onchange="setDisplay(this)" value="${cateParent.c_name }">
												<label for="front_parts"> <c:out
														value="${cateParent.c_name }" />

											</label></li>
										</ul>
								</c:forEach>
							</ul>
						</div>
						<div class="sidebar-filter">
							<div class="top-filter-head">하위 카테고리</div>
							<div class="common-filter parts_radio" style="display: none">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>상품명</label><input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>상품가격</label><input class="form-control" name="title"
							id="amount">
					</div>
					<div class="form-group">
						<label>남은수량</label><input class="form-control" name="title">
					</div>

					<div class="form-group">
						<label>상세설명</label>
						<textarea class="form-control" rows=3 name="content"></textarea>
					</div>
					<div class="form-group">
						<label>이미지</label> <input type="file" class="form-control"
							name="inputFile" id="imgInput"> <img id="image_section"
							src="#" alt="이미지">
					</div>
					<div class="col-md-6">
						<div class="card" style="margin: 50px 0">
							<!-- Default panel contents -->
							<div class="card-header">호환차량</div>
							<ul class="list-group list-group-flush" id="cheked">

								<li class="list-group-item">소나타 <label class="switch ">
										<input type="checkbox" class="info" value="소나타" id="check"
										name="check"> <span class="slider round"></span>
								</label>
								</li>
								<li class="list-group-item">그랜저<label class="switch ">
										<input type="checkbox" class="info" value="그랜저" id="check"
										name="check"> <span class="slider round"></span>
								</label>
								</li>
								<li class="list-group-item">카니발<label class="switch ">
										<input type="checkbox" class="info" value="카니발" id="check"
										name="check"> <span class="slider round"></span>
								</label>
								</li>
								<li class="list-group-item">소울<label class="switch ">
										<input type="checkbox" class="info" value="소울" id="check"
										name="check"> <span class="slider round"></span>
								</label>
								</li>
								<li class="list-group-item">마티즈<label class="switch ">
										<input type="checkbox" class="info" value="마티즈" id="check"
										name="check"> <span class="slider round"></span>
								</label>
								</li>
							</ul>
						</div>
					</div>
					<button type="button" class="btn btn-default" id="btnclick">전송
						버튼</button>
					<button type="reset" class="btn btn-default">초기화 버튼</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	// onchange 로 input 태그 클릭 시 이벤트 발생
	function setDisplay(obj) {
		console.log("obj : " + obj);
		let cateParent = $('#cateParent');
		// 상위카테고리 name
		let cateName = $(obj).val();
		console.log("objVal",cateName);
		// 하위카테고리 id
		let cateId = $(obj).attr('id');
		console.log(cateId);
		console.log(cateName);

		// ajax 
		$
				.ajax({
					// get방식으로 cateId(jquery객체화 시킨 하위카테고리 id)를 보낸다 dataType은 JSON방식
					// 성공시 해당 data(카테고리 를 부모카테고리no와 비교해서 key 와 value로 )에 담긴다
					url : 'cateChek?cateId=' + cateId,
					type : 'get',
					dataType : 'JSON',
					success : function(data) {
						console.log(" success 데이터 값 : ", data);
						let text = '';
						let radio = $(".parts_radio");
						// 비우기
						radio.empty();
						$
								.each(
										data,
										function(key, value) {
											console.log("key의 값 : " + key + " "
													+ "value의 값 : "
													+ value.c_name);
											text += '<ul class="front_parts"><li class="filter-list"><input class="pixel-radio"type="radio" id="'+value.c_no+'" name="'+value.c_no+'"value=""><label for="headlight">'
													+ value.c_name
													+ '</label></li></ul>';
										})
						radio.append(text);

						radio.show();

					},
					error : function() {
						console.log("통신실패");
					}
				})
	}

	$(document).ready(function() {

		// 이미지 미리보기
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		// 파일 업로드
		// 		$("#imgInput").on("click", function(e) {
		// 			let formData = new FormData();
		// 			let inputFile = $("input[name='uploadFile']");
		// 			console.log("여기서 inputFile은 무엇이길래 0번 인덱스를 가져올까 ? ", inputFile);
		// 			let files = inputFile[0].files;
		// 			console.log("file ? ", files);
		// 			// filedate를 formdata에 추가함
		// 			for (var i = 0; i < files.length; i++) {
		// 				formData.append("uploadFile", files[i]);
		// 			}
		// 			console.log("formData : ", formData.get("uploadFile"));
		// 			// 위의 formData를 ajax로 컨트롤러로 전송함
		// 			$.ajax({
		// 				url : '/uploadAjaxAction',
		// 				proceedData : false,
		// 				contentType : false,
		// 				data : formData,
		// 				type : 'POST',
		// 				success : function(result) {
		// 					alert("성공적으로 업로드 되었습니다");
		// 				},
		// 				errorr : function() {
		// 					console.log("통신실패");
		// 				}
		// 			})
		// 		});

		// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
		$("#imgInput").change(function() {
			readURL(this);
		});

		$('#btnclick').click(function(event) {
			console.log("클릭");
			let amount = $('#amount').val();
			console.log(amount);
			if (amount == null || amount != isNaN()) {
				alert("숫자만 입력");
			}
		})

	})
</script>

<%@ include file="../include/footer.jsp"%>
