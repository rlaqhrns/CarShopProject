<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
	button#write {
    width: 120px;
    height: 50px;
    font-size: 20px;
    font-weight: bold;
    border: 2px solid black;
    border-radius: 5px;
    box-shadow: 0px 2px 3px grey, inset 0px -8px 10px rgba(0, 0, 0, .1);
	}
	button#write:active {
	    transform: translateY(4px);
	    box-shadow: 0px 2px 3px grey, inset 0px -8px 10px rgba(0, 0, 0, .2);
	}
	.update_title, .update_content {
    background: transparent;
    border: none;
    color: #777777;
    width:100%;
	}
	#title, #content {
    width: 100%;
	}
	.delete {
    	text-align: center;
    	padding: 0.75rem !important;
	}
	.deleteBtn {
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	}
</style>

	<title>Aroma Shop</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
	<link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">
	
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>공지 목록</h1>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
<script>
	var writeCount=0;
	var $this;
	$(document).ready(function(){
		console.log("레디 완료");
		
		$("#write").click(function(){
			writefn();
		})
		
		//제목 수정
		$(document).on("click",'.update_title', function () {
			$this = $(this);
			before_title = $this.val();
	    });
		$(document).on("blur",'.update_title', function () {
			after_title = $(this).val();
	        $.ajax({
				url : 'update_title?before_title=' + before_title + "&&after_title=" + after_title,
				type : 'get',
				success : function(data) {
					console.log("update_title seccess!");
					update_date();
					
				},
				error : function() {
					console.log("update_title error!!");
				}
			})
	        
	        
	    });
		
		//내용 수정
		$(document).on("click",'.update_content', function () {
			$this = $(this);
			before_content = $(this).val();
	    });
		$(document).on("blur",'.update_content', function () {
			after_content = $(this).val();
	        
	        $.ajax({
				url : 'update_content?before_content=' + before_content + "&&after_content=" + after_content,
				type : 'get',
				success : function(data) {
					console.log("update_content seccess!");
					update_date();
				},
				error : function() {
					console.log("update_content error!!");
				}
			})
	    });
		
		//삭제 기능
		$(document).on("click",'.deleteBtn', function () {
			$this = $(this);
	        $.ajax({
				url : 'delete?date=' + $this.attr("id"),
				type : 'get',
				success : function(data) {
					console.log("deleteBtn seccess!");
					$this.parent().parent().remove();
				},
				error : function() {
					console.log("deleteBtn error!!");
				}
			})
	    });
	})
		
	
	function update_date(){
		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월
		let date = ("0" + today.getDate()).slice(-2);  // 날짜
		let hours = ("0" + today.getHours()).slice(-2); // 시
		let minutes = ("0" + today.getMinutes()).slice(-2);  // 분
		let seconds = ("0" + today.getSeconds()).slice(-2);  // 초
		result_update_date = year + '-' + month + '-' + date + " " + hours + ':' + minutes + ':' + seconds;
		$this.parent().parent().children('td.update_date').text(result_update_date);
	}
	
	
	function writefn(){
		if(writeCount==0){
			console.log("writefn들어옴");
			$("#write_input").css("display","");
			$("#write").html("완료");
			writeCount=1;
		} else{
			console.log("ok");
			title = $("#title").val();
			content = $("#content").val();
			$.ajax({
				url : 'anncAdd?title=' + title + "&&content=" + content,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					console.log(data.title);
					$('#write_input').before(
		                       '<tr><td><input type="text" class="update_title" value="' + data.title + '"></td>\n\
		                   <td><input type="text" class="update_content" value="' + data.content + '"></td>\n\
		                   <td>' + data.annc_date + '</td>\n\
		                   <td class = "update_date"></td>\n\
		                   <td class="delete"><button class="deleteBtn" id="' + data.annc_date + '"></button></td></tr>'
		                       );
					$("#write_input").css("display","none");
					writeCount=0;
					$("#write").html("글쓰기");
					$("#title").val("");
					$("#content").val("");
				},
				error : function() {
					console.log("writefn error!!");
				}
			})
						
		}
		
	}
	
	
	
	
	
</script>
	
  <!--================Order Details Area =================-->
  <section class="order_details section-margin--small" style="text-align: -webkit-center;">
    <div class="container" style="max-width:1300px">
      <p class="text-center billing-alert">공지 목록</p>

      <div class="order_details_table" style="width:1200px">
        <h2>상세정보</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
              	<th scope="col" style="width:200px">제목</th>
                <th scope="col" style="width:300px">내용</th>
                <th scope="col" style="width:100px">작성날짜</th>
                <th scope="col" style="width:100px">수정날짜</th>
                <th scope="col" style="width:10px">삭제</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${annclist}" var ="annc" varStatus="status">
                    <tr>
                      <td><input type="text" class="update_title" value="<c:out value="${annc.title}"></c:out>"></td>                    
                      <td><input type="text" class="update_content" value="<c:out value="${annc.content}"></c:out>"></td>                    
                      <td><c:out value="${annc.annc_date}"></c:out></td>
                      <td class = "update_date"><c:out value="${annc.update_date}"></c:out></td>
                      <td class="delete"><button class="deleteBtn" id="<c:out value='${annc.annc_date}'></c:out>"></button></td>
                    </tr>
                   </c:forEach>
                   <tr id="write_input" style="display:none">
	                   	<td><input type="text" id="title" placeholder="제목"></td>
	                   	<td><input type="text" id="content" placeholder="내용"></td>
                   </tr>
                   
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div style="text-align:center; margin-top:50px;">
	    <button type="button" id="write">글쓰기</button>
    </div>
  </section>
  <!--================End Order Details Area =================-->


<%@ include file="../include/footer.jsp"%>