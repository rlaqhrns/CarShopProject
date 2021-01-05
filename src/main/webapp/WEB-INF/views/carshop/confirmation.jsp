<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

	<title>Aroma Shop</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
	<link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link href='/resources/lib/main.css' rel='stylesheet' />
	<script src='/resources/lib/main.js'></script>
<body>
	<!-- ================ start banner area ================= -->	
 	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1><img src="/resources/img/confirmation/bill.png" style="width:80px; heigh:100%; padding-right:10px"/>주문 확인서</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">구매이력을 조회합니다.</a></li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section> 
	
	<!-- ================ end banner area ================= -->
  
  <!--================Order Details Area =================-->
  <section class="order_details section-margin--small">
    <div class="container">
      <p class="text-center billing-alert">감사합니다. 주문 상세정보를 확인하세요.</p>
		
		<div id='calendar'></div>
	
      <div class="order_details_table">
        <h2>주문 상세정보</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">구매물품</th>
                <th scope="col">상품수량</th>
                <th scope="col">상품가격</th>
                <th scope="col">결제수단</th>
                <th scope="col">교환</th>
                <th scope="col">반품</th>
                <th scope="col">구매날짜</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${buylist}" var ="buylist" varStatus="status"> 
                    <tr>                   
                      <td><c:out value="${buylist.pname}"></c:out></td>
                      <td><c:out value="${buylist.quantity}"></c:out></td>
                      <td><c:out value="${buylist.amount}"></c:out></td>
                      <td><c:out value="${buylist.pay}"></c:out></td>
                      <td><button id="getItemChange" class="btn btn-warning" type="submit" onclick="" data-toggle="modal" data-target="#exampleModalCenter">교환</button></td>
                      <td><button id="getItemRefund" class="btn btn-warning" type="submit" onclick="" data-toggle="modal" data-target="#exampleModalCenter">반품</button></td>
             		  <td><c:out value="${buylist.order_date}"></c:out></td> 
             		</tr>
              </c:forEach> 
            </tbody>
          </table>          
        </div>
      </div>
    </div>
  </section>
 </body>	
  <!--================End Order Details Area =================-->
  
  		  	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">교환/반품 forms</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					<div class="form-group">
						<label for="user-name" class="col-form-label">유저</label><input type="text" class="form-control" id="user-name" name="u_id">
					</div>
					<div class="form-group">
						<label for="product-name" class="col-form-label">상품명</label><input type="text" class="form-control" id="product-name" name="p_id">
					<!-- p_id를 pname으로 변경해야함 vo도 -->
					</div>
					<div class="form-group">
						<label for="seller-name" class="col-form-label">판매자</label><input type="text" class="form-control" id="seller-name" name="s_id">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">사유</label>
						<textarea class="form-control" id="message-text" name="content"></textarea>
					</div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary">신청하기</button>
			      </div>
			    </div>
			  </div>
			</div> 
<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	  
      		$(document).ready(function(){
      			
      			getCalendarDataDB();
      			
      		    $("#getItemChange").click(function(){
      		        $("#exampleModal").appendTo("body").modal();
      		    });
      		    
      		  $("#getItemRefund").click(function(){
    		        $("#exampleModal").appendTo("body").modal();
    		    });
      		  
      		  	
      		});
      		
      		
      		function getCalendarDataDB() { 
      			//캘린더에 띄울 정보를 배열로 받아옵니다. (재원/21.01.04)
      			//Json 배열 만들기 (..) (재원/21.01.04)
      			
      			var result = new Array();
      			
                <c:forEach items="${buylist}" var ="buylist"> 
                	var json = new Object();    
	                //json.put("pname", "${buylist.pname}");
		            json.pname = "${buylist.pname}";    
	                //json.put("quantity", "${buylist.quantity}");
	                json.quantity = "${buylist.quantity}";
	                //json.put("amount", "${buylist.amount}");
	                json.amount = "${buylist.amount}";
	                //json.put("pay",  "${buylist.pay}");
	                json.pay = "${buylist.pay}";
	       		 	//json.put("order_date", "${buylist.order_date}");
	       		 	json.order_date = "${buylist.order_date}";
	       		 	result.push(json);
        		</c:forEach>
        		
        		//var str = JSON.stringify(json, replacer);
        		//var newValue = JSON.parse(str, reviver);
        		console.log("json = " + json.pname);
        		console.log("jsoninfo = " + JSON.stringify(result));
      			
        		var dataJson = JSON.stringify(result);
        		
      			$.ajax({
      		        contentType:'application/json',
      		        dataType:'post',
      		        url:'calendar/getAll',
      		        type:'get',
      		        async: false,
      		        data:dataJson,
      		        success:function(data) {
      		        	console.log(data);
      		        }

      			})
      			
      		}
      		
    		// 캘린더 이벤트
      	    document.addEventListener('DOMContentLoaded', function() {
      	    	let tbody = $('#tbodyid');
      	    	let str = '';
      	    	
      	        var calendarEl = document.getElementById('calendar'); 
      	        var calendar;
	
      	        	  calendar = new FullCalendar.Calendar(calendarEl, {
            	        	editable: true,
            	          	selectable: true,
            	          	nowIndicator: true,
            	          	dayMaxEvents: true,
            	          	//캘린더에 물품 구매 날짜별로 물품리스트 띄움 (재원/21.01.04)
      	        	  		events: function(start, end, successCallback) {
      	        	  			
      	        	  			$.ajax({
      	        	  				
      	        	  				url:'/confirmation',
      	        	  				method:'POST',
      	        	  				dataType: 'JSON',
      	        	  				success: function(data) {
      	        	  					$.each(data, function(key, value) {
      	        	  						
      	        	  					});
      	        	  					successCallback();
      	        	  				}
      	        	
      	        	  			
      	        	  			})
      	        	  		},
      	        	  		
            	        	 // 캘린더 이벤트 클릭 시 이벤트 발생 (재원/21.01.04)            	        	 
            	           /*   eventClick: function(info) {
            	            	  tbody.empty();
            	            	  let text = '';
//            	                   alert('Date: ' + info.dateStr);
//            	                   alert('Resource ID: ' + info.resource.id);
            				// ajax 로 주문날짜와 현재날짜를 비교하여 가져온다
            	           		$.ajax({
            	            	    url :'clickDate?order_date=' + info.dateStr,
            	               		type : 'get',
            	               		dataType : 'JSON',
            	               		success : function(data){
            	              		console.log(data);
            	            		let result = '';
            	            		   $.each(data,function(key,value){
            	            	  		 text += '<tr><td scope="col" id="ono">'+value.ono+'</td><td scope="col" id="u_id">'+value.u_id+'</td>'
            	            	   	   	 text += '<td scope="col" id="p_name">'+value.pname+'</td><td scope="col" id="content" data-content="'+value.content+'"data-toggle="modal" data-target="#exampleModalCenter">'
            	            	  		if(value.content.length >2){
            						result =	value.content.substring(0,2) +'...<small>더보기</small>';
            							console.log("if문 실행",result);
            	            	   }else{
            	            		  result= value.content;
            							console.log("else문 실행",result);
            	            		   
            	            	   }
            	            	   text += ''+result+'</td>'
            	            	   text += '<td scope="col" id="order_date">'+value.order_date+'</td><td scope="col" id="pay">'+value.pay+'</td>'
            	            	   text += '<td scope="col" class="span1" id=""><button id="btn_click" class="btn btn-success"><span><strong>교환/반품</strong></span></button></td></tr>'
            	               })
            	        	   tbody.append(text);

            	               },
            	               error : function(){	
            	                  console.log("통신실패");
            	               }
            	               
            	              
            	            })
            	            
            	              },  */

            	        initialView: 'dayGridMonth'

            	          
            	        });
            	        calendar.render();
            	        
            	     });
      	        	
      	    

</script>
<style>
#calendar { /* 달력 크기 */
	max-width: 750px;
	margin: 0 auto;
}
</style>	

<%@ include file="../include/footer.jsp"%>