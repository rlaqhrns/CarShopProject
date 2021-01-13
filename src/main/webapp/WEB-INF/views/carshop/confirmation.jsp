<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>

	<title>저리카 | 주문이력</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
	<link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link href='/resources/lib/main.css' rel='stylesheet' />
	<script src='/resources/lib/main.min.js'></script>
	<script src='/resources/lib/main.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
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
      <button id="confirmationAllList" style="float:right;" class="btn btn-outline-secondary"> 전체 주문이력 불러오기 </button>
        <h2>주문 상세정보</h2> 
        <div class="table-responsive">
          <table class="table" style="display:">
            <thead>
              <tr>
              	<th scope="col">주문번호</th>
                <th scope="col">구매물품</th>
                <th scope="col">상품수량</th>
                <th scope="col">상품가격</th>
                <th scope="col">결제수단</th>
                <th scope="col">교환/반품</th>
                <th scope="col">구매날짜</th>
              </tr>
            </thead>
            <tbody id="originalTr">
             <c:forEach items="${buylist}" var ="buylist" varStatus="status">              
                  <tr>
                      <td><c:out value="${buylist.ono}"></c:out></td>               
                      <td><c:out value="${buylist.pname}"></c:out></td>
                      <td><c:out value="${buylist.quantity}"></c:out></td>
                      <td><c:out value="${buylist.amount}"></c:out></td>
                      <td><c:out value="${buylist.pay}"></c:out></td>
                      <c:choose>
                      	<c:when test="${buylist.o_no == 0 && buylist.o_no2 == 0}">             	               
                      		<td><button id="getItemRefund" class="btn btn-warning" value='<c:out value = "${buylist.ono}"/>' data-notifyid="${buylist.pname}" data-nnotifyid="${buylist.u_id}" data-nnnotifyid="${buylist.seller}">교환/반품</button></td>	 
             		  	</c:when>
             		  	<c:when test="${buylist.o_no != 0 && buylist.o_no2 == 0}">
             		  		<td><button id="getItemRefund" class="btn btn-success" disabled value='<c:out value = "${buylist.ono}"/>' data-notifyid="${buylist.pname}" data-nnotifyid="${buylist.u_id}" data-nnnotifyid="${buylist.seller}">교환/반품</button></td>	 
             		  	</c:when>
             		  	<c:when test="${buylist.o_no != 0 && buylist.o_no2 != 0}">
             		  		<td><button id="getItemRefund" class="btn btn-secondary" disabled value='<c:out value = "${buylist.ono}"/>' data-notifyid="${buylist.pname}" data-nnotifyid="${buylist.u_id}" data-nnnotifyid="${buylist.seller}">환불 완료</button></td>	 
             		  	</c:when>
             		  	<c:otherwise>
             		  		<td><button id="getItemRefund" class="btn btn-secondary" disabled value='<c:out value = "${buylist.ono}"/>' data-notifyid="${buylist.pname}" data-nnotifyid="${buylist.u_id}" data-nnnotifyid="${buylist.seller}">환불 완료</button></td>	 
             		  	</c:otherwise>
             		  </c:choose> 
             		  <td><c:out value="${buylist.order_date}"></c:out></td>              		             		
             		</tr>
             	</c:forEach>	      
            </tbody>
            <tbody id="emptyTr">
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
			        <form name="returnFormAjax" action="confirmation" method="post">
			        <div class="form-group">
						<label for="user-name" class="col-form-label">주문번호</label><input type="text" class="form-control" id="ono" name="ono" readonly>
					</div>
					<div class="form-group">
						<label for="user-name" class="col-form-label">유저</label><input type="text" class="form-control"id="u_id" name="u_id" readonly>
					</div>
					<div class="form-group">
						<label for="product-name" class="col-form-label">상품명</label><input type="text" class="form-control"id="pname" name="pname" readonly>
					<!-- p_id를 pname으로 변경해야함 vo도 -->
					</div>
					<div class="form-group">
						<label for="seller-name" class="col-form-label">판매자</label><input type="text" class="form-control" id="s_id" name="s_id" readonly>
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">사유</label>
						<textarea class="form-control" id="message-text" name="content"></textarea>
					</div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" id="applyBtn">신청하기</button>
			      </div>
			    </div>
			  </div>
			</div> 
<!-- moment lib -->
<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>

<!-- fullcalendar bundle -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js'></script>

<!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>
			
<script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	  
      		
      		//세션을 받아옵니다. (재원/21.01.13)
  	      	<% 
  	      	
  	      		session = request.getSession();
	      	   
  	      	%>
  	    	//세션 id를 u_id로 설정합니다. (재원/21.01.13)
  	      	var u_id = "<%=session.getAttribute("id")%>";
      		
      		$(document).ready(function(){
		     	
	      			//hovering을 위함 (재원/21.01.13)
	      			$('[data-toggle="tooltip"]').tooltip();
	  		
	      		  //주문이력 전체를 볼 수 있게 함 (재원/21.01.13)
	      		  $('#confirmationAllList').click(function() {
	      			    			
	      			let originalTr = $('#originalTr');
	      	    	let emptyTr = $('#emptyTr');
	      			originalTr.css("display", "");
	      			emptyTr.empty();  
	      		  
	      		  });
      		  
      	    		       		 
      		});
      		
      		//교환반품 버튼을 클릭하면 모달에 해당 주문번호에 맞게 데이터를 띄웁니다. (재원/21.01.13)
      		//function으로 만들어서 다양하게 사용하도록 만듬 (재원/21.01.13)
      		 function writeRefundForms() {
      			 $('.btn-warning').click(function() {
       			 	$('#ono').val($(this).val());
       			 	
       			 	var ono = $('#ono').val();
       			 	
       			 	notifyid= $(this).data('notifyid');
       			 	nnotifyid= $(this).data('nnotifyid');
       			 	nnnotifyid= $(this).data('nnnotifyid');
       			 	$('#pname').val(notifyid);
       			 	$('#u_id').val(nnotifyid);	
       			 	$('#s_id').val(nnnotifyid);
       		  });
      		} 
      		
      		
      		//사유가 없으면 신청하지 못합니다. (재원/21.01.13)
      		//교환반품 form post를 성공적으로 마치면 윈도우를 relaod합니다. (재원/21.01.13)
      		function getReloadSuccess() {
      		  $('.btn-primary').click(function() {
      			  if(!$("#message-text").val()) {
      				Swal.fire({
      				  icon: 'error',
      				  title: 'Oops...',
      				  text: '사유를 적어주세요.',      				  
      				});
      			 }
      			  else{
          			  var param = $("form[name=returnFormAjax]").serialize();
          			  $.ajax({
    	            	    url :'confirmation',
    	            	    type : 'post',
    	               		data : param,
    	               		success : function(data){
    	              		console.log(data);	
    	            		window.location.reload();
    	            		
    	               },
    	               error : function(){	
    	                  console.log("통신실패");
    	               }    	               
    	              
    	            })
      				  
      			  }
	            
      		    
      		  });
      		  
      		
      		}
      		
      		//교환 반품 신청하기를 진행합니다. (재원/21.01.13)
      		//교환 반품 신청을 완료하면 버튼의 색깔을 초록색으로 바꾸고 버튼을 더이상 누를 수 없도록 합니다. (재원/21.01.13) 
      		function refundChangeModal() {
      			 $(".btn-warning").click(function(){
 					$('#ono').val($(this).val());
        			 	var btn = $(this);
        			 	console.log(btn);
        			 	var ono = $('#ono').val();
        			 	
        			 	notifyid= $(this).data('notifyid');
        			 	nnotifyid= $(this).data('nnotifyid');
        			 	nnnotifyid= $(this).data('nnnotifyid');
        			 	$('#pname').val(notifyid);
        			 	$('#u_id').val(nnotifyid);	
        			 	$('#s_id').val(nnnotifyid);

 	  				$.ajax({
 	            	    url :'isRefundTrue?ono=' + ono,
 	            	    type : 'post',
 		               	dataType : 'JSON',
 	               		success : function(data){
 	              		console.log(data);

 	            		if(data == false) {
 	            			console.log(btn);
 	            			btn.addClass('btn-success');
 	            			btn.removeClass('btn-warning');	            			
 	            			btn.attr('disabled', 'true');
 	            		}
 	            		else {
 	            			$("#exampleModalCenter").modal('show');

 	            		}

 	               },
 	               error : function(){	
 	                  console.log("아이템통신실패");
 	               }
 	               
 	              
 	            });  				
   			
     		   });
      		}     	
      		
    		// 캘린더 이벤트  (재원/21.01.06)
      		//The ready event occurs after the HTML document has been loaded, while the onload event occurs later, when all content (e.g. images) also has been loaded.
      	    //The onload event is a standard event in the DOM, while the ready event is specific to jQuery. The purpose of the ready event is that it should occur as early as possible after the document has loaded, so that code that adds functionality to the elements in the page doesn't have to wait for all content to load.
      		document.addEventListener('DOMContentLoaded', function() {
      			getReloadSuccess();
      			refundChangeModal();
      			
      			//테이블 안에 <td>들을 숨기거나 없앰(재원/21.01.13)
      	    	let tbody = $('tbody');
      	    	let originalTr = $('#originalTr');
      	    	let emptyTr = $('#emptyTr');
      	    	let allTr = $('tbody tr');
      	    	let str = '';
      	    
      	    	//이벤트 추가를 위해 배열로 데이터를 저장함.(재원/21.01.13)
				var result = new Array();
      			
                <c:forEach items="${buylist}" var ="buylist"> 
                	var json = new Object();
                	<c:set var ="order_date" value="${buylist.order_date}"/>
                	json.id = "${buylist.ono}";
		            json.title = "${buylist.pname}";    
	       		 	json.start = "${fn:substring(order_date,0,10)}";
	       		 	json.end = "${fn:substring(order_date,0,10)}";
	       		 	result.push(json);
        		</c:forEach>

        		//캘린더 api -> fullcalendar.io(재원/21.01.13)
      	        var calendarEl = document.getElementById('calendar'); 
      	        var calendar;
      	      	var jsId = document.cookie.match(/JSESSIONID=[^;]+/);
      	      	
      	        	  calendar = new FullCalendar.Calendar(calendarEl, {
            	        	editable: true,
            	          	selectable: true,
            	          	nowIndicator: true,
            	          	dayMaxEvents: true,
            	          
            	          	
            	          	//캘린더 이벤트별로 주문정보 확인 가능 (재원/21.01.06)
            	      		eventClick:function (info) { 
            	      			info.jsEvent.preventDefault(); // don't let the browser navigate
            	      			originalTr.hide();
            	      		  	emptyTr.empty();
            	      			
            	      		 	var ono = info.event.id;
            	      		  	console.log("ono = " + ono);
            	      			var jsId = document.cookie.match(/JSESSIONID=[^;]+/);
            	      			
            	      			var start = moment(info.event.start).format("YYYY-MM-DD"); 
	      						let text = '';
	      						
	      						$.ajax({
	      		            	    url :'clickeventOrder?order_date=' + start + '&' + 'u_id=' + u_id + '&' + 'ono=' + ono,
	      		            	    type : 'get',
	      		               		dataType : 'JSON',
	      		               		async:false,
	      		               		success : function(data){
	      		              		console.log(data);
	      		            		let result = '';
	      		            		//교환반품이 되었는지에 따라 버튼 색깔과 disabled를 적용합니다. (재원/21.01.13)
	      		            		$.each(data,function(key,value){
	      		            			text+= '<tr id='+ start +'><td>'+ value.ono + '</td>' +'<td>'+value.pname+'</td>'+'<td>'+value.quantity+'</td>'+'<td>'+value.amount+'</td>'+'<td>'+value.pay+'</td>'
	      		            			if(value.o_no == 0 && value.o_no2 == 0) {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-warning" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+'>교환/반품</button></td>'
	      		            			}
	      		            			else if(value.o_no !=0 && value.o_no2 == 0) {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-success" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+' disabled>교환/반품</button></td>'
	      		            			}
	      		            			else if(value.o_no !=0 && value.o_no2 !=0 ) {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-secondary" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+' disabled>환불 완료</button></td>'
	      		            			}
	      		            			else {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-secondary" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+' disabled>환불 완료</button></td>'
	      		            			}	      		            			
	      		            			text += '<td>'+value.order_date+'</td>'
	      		            			text += '</tr>'
	      		            		});
	      		            		emptyTr.append(text);
	      		            		//console.log(text);
	      		            		writeRefundForms();
	      		            		refundChangeModal();

	      		               },
	      		               error : function(){	
	      		                  console.log("통신실패");
	      		               }
	      		               
	      		              
	      		            })
	      						
            	      			
            	      		},
            	      		
            	      		//캘린더 날짜 클릭시 해당 날짜 주문상세 정보 확인 가능 (재원/21.01.06)
            	      		 dateClick: function(info) {
            	      			info.jsEvent.preventDefault(); // don't let the browser navigate
            	      		    originalTr.hide();
            	      		  	emptyTr.empty();
            	      		    let text = '';
            	      		               	      		   
            	      		    var start = info.dateStr;
            	      		    
            	      		  	$.ajax({
	      		            	    url :'clickdateOrder?order_date=' + start + '&' + 'u_id=' + u_id,
	      		            	    type : 'get',
	      		               		dataType : 'JSON',
	      		               		async:false,
	      		               		success : function(data){
	      		              		console.log(data);
	      		            		let result = '';
	      		            		//교환반품이 되었는지에 따라 버튼 색깔과 disabled를 적용합니다. (재원/21.01.13)
	      		            		$.each(data,function(key,value){
	      		            			text+= '<tr id='+ start +'><td>'+ value.ono + '</td>' +'<td>'+value.pname+'</td>'+'<td>'+value.quantity+'</td>'+'<td>'+value.amount+'</td>'+'<td>'+value.pay+'</td>'
	      		            			if(value.o_no == 0 && value.o_no2 == 0) {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-warning" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+'>교환/반품</button></td>'
	      		            			}
	      		            			else if(value.o_no !=0 && value.o_no2 == 0) {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-success" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+' disabled>교환/반품</button></td>'
	      		            			}
	      		            			else if(value.o_no !=0 && value.o_no2 !=0 ) {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-secondary" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+' disabled>환불 완료</button></td>'
	      		            			}
	      		            			else {
	      		            				text += '<td> <button id="getItemRefund" class="btn btn-secondary" value='+value.ono+' data-notifyid='+value.pname+' data-nnotifyid='+value.u_id+' data-nnnotifyid='+value.seller+' disabled>환불 완료</button></td>'
	      		            			}	      		            			
	      		            			text += '<td>'+value.order_date+'</td>'
	      		            			text += '</tr>'
	      		            		});
	      		            		emptyTr.append(text);	      		            		
	      		            		writeRefundForms();
	      		            		refundChangeModal();
	      		            		
	      		               },
	      		               error : function(){	
	      		                  console.log("통신실패");
	      		               }
	      		               
	      		              
	      		            })

            	      	  },
            	      	  
            	      		//캘린더 이벤트 hovering 클릭하여 상세 확인 띄움 (재원/21.01.06)
            	      		eventMouseEnter: function(el) {
            	      			//console.log(this);
            	      			//console.log(el);
            	      			$('a').attr("data-toggle","tooltip");
            	      			$('a').attr("title", "클릭하여 상세를 확인하세요");
            	      	      	           
            	      	  },
      	        	  		

            	        initialView: 'dayGridMonth'

            	          
            	        });
      	        	  
      	        		//캘린더에 물품 구매 날짜별로 물품리스트 띄움 (재원/21.01.04)
      	        		
      	        		calendar.addEventSource(result);
            	        calendar.render();
            	        
            	           			
  	        
            	     });
      	        	
      	    

</script>
<style>
#calendar { /* 달력 크기 */
	max-width: 750px;
	margin: 0 auto;
}
.hover-end{
padding:0;
margin:0;
font-size:75%;
text-align:center;
position:absolute;
bottom:0;
width:100%;
opacity:.8
}
</style>	

<%@ include file="../include/footer.jsp"%>