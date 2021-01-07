function addCartEvent(p_no) { //장바구니
		let userId = "user1";

		$.ajax({
			url : '/carshop/product/addcart',
			type : 'POST',
			data : {
				"u_id" : userId,
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$(".modal-body").html("장바구니에 넣었습니다.");
				$('#notice').modal('show');

			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	function addLikeEvent(p_no,$obj) { //찜목록추가

		$.ajax({
			url : '/carshop/product/addlike',
			type : 'POST',
			data : {
				"u_id" : "user1",
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$obj.children(".ti-heart").addClass("heart_white_full");								
				$(".modal-body").html("찜 목록에 넣었습니다.");
				$('#notice').modal('show');
			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	function removeLikeEvent(p_no,$obj) { //찜목록삭제
		//console.log("상품번호 : " + p_no);
		
		$.ajax({
			url : '/carshop/product/removeLiked',
			type : 'POST',
			data : {
				"u_id" : "user1",
				"p_no" : p_no
			},
			dataType : 'JSON',
			success : function(stats) {
				$obj.children(".ti-heart").removeClass("heart_white_full");
				$(".modal-body").html("찜 목록에서 삭제되었습니다.");
				$('#notice').modal('show');
			},
			error : function() {
				console.log("통신실패");
			}
		})
	}
	
	function checkLiked(){
		$(".btn_like_toggle").each(function(index){
			let $obj = $(this);
			let p_no = $(this).val();
			$.ajax({
				url : '/carshop/product/checkLiked',
				type : 'POST',
				data : {
					"u_id" : "user1", //나중에 로그인완성되면 넣을것!
					"p_no" : p_no
				},
				dataType : 'JSON',
				success : function(data) {
					if(data){
						$obj.children(".ti-heart").addClass("heart_white_full");					
					}
				},
				error : function() {
					console.log("통신실패");
				}
			})
		});
	} 
	
	function setDisplay(obj) { //카테고리창
		let cateId = obj.attr('id');
		$.ajax({
					url : '/carshop/cateChek?cateId=' + cateId,
					type : 'get',
					dataType : 'JSON',
					success : function(data) {
						//console.log(" success 데이터 값 : ", data);
						let text = '';
						let details = $("#details-parts");
						// 비우기
						details.empty();
						$.each(data,function(index, value) {
											//상세카테고리 html 작성
											if(index == 0){
												text += `<li class="filter-list">
															<input class="pixel-radio"type="radio"name="details-parts" value="0" id="detailDefault" checked>
															<label for="detailDefault">전체보기</label></li>`;
											}
											text += '<li class="filter-list"><input class="pixel-radio"type="radio" id="'
													+ value.c_no+'" name="details-parts" value="'
													+ value.c_no+'"><label for="'
													+ value.c_no+'">'
													+ value.c_name
													+ '</label></li>';
										})
						details.append(text);
						details.show();
						categoryDetailChange(); //상세카테고리 작성후 이벤트 등록

					},
					error : function() {
						console.log("통신실패");
					}
				})
	}
	// 처음에는 파라미터로 각 옵션들을 넘겨받았으나 기능이 더해질 수록 코드가 지저분해지고 꼬여감에 따라서 함수 안에서 직접 값을 부르는 형식으로 코드 변
	//function setProductList(category,url,obj,direction) { //카테고리 함수 파라미터로 url을 입력받는다.
	function setProductList() { //상품을 그려주는 함수
		
		let categoryParent; //부모카테고리
		let categoryChild;// 자식카테고리
		let url;//url을 담을 변수
				
		let sortingAmountOrName =  $("#sortingAmountOrName option:selected").val(); //정렬 순서 select option의 값을 저장
		let sorting = ''; //정렬 객체와 방향
		
		categoryParents = $("input[type=radio][name=brand]:checked").val(); //부모 카테고리의 값
		categoryDetails = $("input[type=radio][name=details-parts]:checked").val(); //자식 카테고리의 값
		
	
		url = "/carshop/product/selectCategory"; // 컨트롤러 주소
		
		//정렬 순서 select option의 값에 따라서 order by 문으로 들어갈 문자가 정해진다.
		if(sortingAmountOrName == 'amountASC'){
			sorting = "amount ASC";
			
		}else if(sortingAmountOrName == 'amountDESC'){
			sorting = "amount DESC";
			
		}else if(sortingAmountOrName == 'nameASC'){
			sorting = "p_name ASC";
			
		}else if(sortingAmountOrName == 'nameDESC'){
			sorting = "p_name DESC";
		}
		
		$.ajax({
					url : url,
					type : 'Post',
					data : {
						"categoryParents" : categoryParents, //부모 카테고리의 값을 전송한다.
						"categoryDetails" : categoryDetails, //자식 카테고리의 값을 전송한다.
						"sorting" : sorting,//정렬 객체와 방향
					},
					dataType : 'JSON',

					success : function(data) {
						let text; //append 할 html문을 저장한다. 
						let totalProductCnt = 0; //총 상품의 갯수를 저장할 변수이다.
						let $productListArea = $("#product-list-area");//상품을 그려넣을 장소
						$productListArea.empty(); //append하기전 비워준다.
						$.each(data,function(index, product) {
							text = '';
							productNum = index +1; //상품아이디 product + productNum 의 형식으로 아이디 지
												//text는 백틱으로 처음부터 끝까지 해결하려했으나 태그 다음에 오류 ex) `src="${product.img}"`동작 안함
											  	text += `<div class="`;
												text += ` col-md-6 col-lg-4 product-area" data-product-amount="`;
											  	text += product.amount;
												text +=`" data-product-name="`;
												text += product.p_name;
												text += `" id ="product`
												text += productNum + `"> 
												<div class="card text-center card-product">
												<div class="card-product__img">
													<img class="card-img" src="`;
												text += product.img;
												text += `" onClick="location.href='/carshop/product/details?p_no='`;
												text += product.p_no;
												text += ` ">
													<ul class="card-product__imgOverlay">
														<li><button
																onClick="location.href='/carshop/product/details?p_no=`;
												text += product.p_no;
												text += `'">
																<i class="ti-search"></i>
															</button></li>
														<li><button class="btn_shopping-cart" value="`
												text += product.p_no;
												text += `">
																<i class="ti-shopping-cart"></i>
															</button></li>
														<li><button class="btn_like_toggle" value="`;
												text += product.p_no;
												text += `"><i class="ti-heart"></i></button></li></ul></div><div class="card-body">
															<h4 class="card-product__title">
															<a href="/carshop/product/details?p_no=`;
												text += product.p_no;
												text += `">`;
												text += product.p_name;
												text += `</a></h4><p class="card-product__price">`;
												text += product.amount;
												text += `원</p></div></div></div>`;
												$productListArea.append(text);//상품 출력
												
										})
						
						$productListArea.show();
						 //리스트 새로불러왔으니까 다시 이벤트 등록
						checkLiked(); //찜리스트인지 확인
						clickEvent(); //장바구니, 찜리스트 클릭이벤트 등록
						search(); // 검색이벤트 등록
						pagingEvent(); //페이지 이벤트 등록
						
					},
					error : function() {
						console.log("상품출력 통신실패");
					}
				}) 
	}
	
	function clickEvent(){ //찜, 장바구니 버튼 클릭 이벤트
		$(".btn_like_toggle").click(function(){ //찜목록 추가 삭제
			let $obj = $(this);
			//하트클래스 포함여부
			if($obj.children().hasClass("heart_white_full")){
				removeLikeEvent($(this).val(),$obj);
			}
			else {
				addLikeEvent($(this).val(),$obj);
			}
		});
		$(".btn_shopping-cart").click(function(){ //장바구니 add
			addCartEvent($(this).val());
		})
		
	}
	// -- 처음에는 클릭이벤트와 같이있었지만 상품리스트출력후 클릭이벤트를 다시등록해줄때에 루프를 돌아서 따로 분리하였다.
	function categoryParentChange(){ //부모 카테고리
		$("input[type=radio][name=brand]").change(function(){
			var obj = $(this);
			//obj.val()는 부모카테고리 넘버
			if(obj.val() != 0){
				setDisplay(obj); //상세카테고리를 그려주는 함수
				setProductList();//상품을 그려주는 함수
			}else{
				setProductList();//상품을 그려주는 함수
			}
		})
	}
	function categoryDetailChange(){//상세 카테고리
		$("input[type=radio][name=details-parts]").change(function(){
			setProductList();//상품을 그려주는 함수
		})
	}
	function search(){ //검색(프론트에서 구현)
		let searchInputBox = $("#search-input-box"); //검색창
		let productArea = $(".product-area"); //상품
		searchInputBox.keyup(function(){
			let text = $(this).val(); //키보드입력에따라 매 순간 text값을 받아온다.
			productArea.hide(); //키보드가 입력 될때에 모든 상품을 숨긴다.
			let obj = $(".product-area[data-product-name]:contains('"+text+"')"); //상품클래스 중 date-product-name속성에 text가 포함(contains이용)
			$(obj).show(); //검색어를 포함하면 다시 보여준다.
		
		})
	}
	function sortOption(){ //정렬 
		let sortingAmountOrName = $("#sortingAmountOrName"); //정렬 방법 선택창
		sortingAmountOrName.change(function(){
			setProductList();//상품을 그려주는 함수
		})
	}
	function ProductViewEvent(){//몇개씩 볼것인지 선택
		$("#viewProduct").change(function(){
			setProductList();//상품을 그려주는 함수
		})
	}
	function pagingEvent(){//페이지 함수(프론트에서 구현)
		//$("#pagination-div").empty();를 하면 실행이 안된다.(아직 이유를 못찾음..)
		$("#pagination-parent").empty(); //페이지 버튼이 들어갈 곳을 비워준다.		
		$("#pagination-parent").append("<div id= 'pagination-div'></div>"); //페이지 버튼이 들어갈곳을 생성해준다.
		
		let pageCnt = 1; //페이지 저장 변수
		let productArea = $(".product-area");//상품클래스
		let totalProductCnt = 0; //총 상품의 갯수를 저장할 변수
		let viewProduct =  $("#viewProduct option:selected").val();//상품출력 갯수 select option중 선택된값을 저장
		productArea.each(function(index,item){//상품갯수를 파악, 페이지 크기도 파악하기위한 each문
			totalProductCnt++;
    		if((index+1)%viewProduct == 0){//상품목록의 크기와 상품출력갯수를 나누어서 나머지가 없으면 페이지카운트를 늘려준다.
    			pageCnt++;
    		}
    		
    	})
		let totalPages = Math.ceil(totalProductCnt/viewProduct); //총 상품갯수와 상품출력갯수를 나눈후 올림하여 페이지의 크기를 구한다.
		let visiblePages = totalPages > 5 ? 5 : totalPages; //하단에 한번에 보여지는 페이지 번호 수 5보다 크면 5 작으면 작은값을 출력하도록하였다.
		productArea.hide(); //최초 함수 실행시 모든상품을 숨긴다.
		$('.page1').show();//최초 함수 실행시 page1클래스를 보여준다.
		$('#pagination-div').twbsPagination({
		    totalPages: totalPages,	// 총 페이지 번호 수
		    visiblePages: visiblePages,	// 하단에서 한번에 보여지는 페이지 번호 수
		    startPage : 1, // 시작시 표시되는 현재 페이지
		    initiateStartPageClick: true,	// 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
		    first : "<<",	// 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
		    prev : "이전",	// 이전 페이지 버튼에 쓰여있는 텍스트
		    next : "다음",	// 다음 페이지 버튼에 쓰여있는 텍스트
		    last : ">>",	// 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
		    nextClass : "page-item next",	// 이전 페이지 CSS class
		    prevClass : "page-item prev",	// 다음 페이지 CSS class
		    lastClass : "page-item last",	// 마지막 페이지 CSS calss
		    firstClass : "page-item first",	// 첫 페이지 CSS class
		    pageClass : "page-item",	// 페이지 버튼의 CSS class
		    activeClass : "active",	// 클릭된 페이지 버튼의 CSS class
		    disabledClass : "disabled",	// 클릭 안된 페이지 버튼의 CSS class
		    anchorClass : "page-link",	//버튼 안의 앵커에 대한 CSS class
		    
		    onPageClick: function (event, page) { //페이지 버튼이 클릭되었을때 실행합수 파라미터 page는 클릭한 페이지번호이다.
		    	paging(page,totalProductCnt,totalPages); //paging 함수에 (page:클릭한페이지,totalProductCnt:총 상품갯수,totalPages:총페이지)를 넘겨준다.
		    }
		});
		
	}
	 function paging(page,totalProductCnt,totalPages) {//페이지함수
		$(".product-area").hide(); //상품목록을 숨긴다.
		let pageSize = $("#viewProduct option:selected").val(); //한 페이지당 보여줄 게시물의 갯수
		let totalCount = totalProductCnt; // 게시물 총 갯수
		
		var startRow = (page - 1) * pageSize; //출력할 상품의 번호 ex) product1에서 시작할지 product7에서 시작할지
		var endRow = page * pageSize; //마지막 상품번호
		if (endRow > totalCount){ 
			endRow = totalCount;
		}  
		for (var j = startRow+1; j <= endRow; j++){	
			$("#product" + j).show(); //상품출력
		}
		
	}
	function init(){ //이벤트함수 init
		setProductList(); // 최초 상품목록 불러오기
		categoryParentChange(); //부모카테고리 값이 바뀌면 동작하는 이벤트
		sortOption();//정렬옵션함수
		search();//검색
		ProductViewEvent();//몇개씩 볼것인지
		
	}
	$(document).ready(function() {
		init();
	})