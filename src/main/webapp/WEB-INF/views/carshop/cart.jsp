<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
/*팝업창 css style 생성 2021.01.09 yun.hj*/

button {
  height: 2.5em;
  cursor: pointer;
}

#popup {
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, .7);
  z-index: 1;
}

#popup.hide {
  display: none;
}

#popup.has-filter {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}

#popup .content {
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}

</style>


<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
   
   <img class="img-fluid" src="/resources/img/cart/title.png" alt="cart배너"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
      <div class="blog-banner">
         <div class="text-center">
            <h1>CART</h1>
            <nav aria-label="breadcrumb" class="banner-breadcrumb">
               <ol class="breadcrumb">
                   <li class="breadcrumb-item active" aria-current="page">장바구니에 담긴 상품은 10일 동안 보관됩니다.</li>
               </ol>
            </nav>
         </div>
      </div>
</section>
<!-- ================== end banner area =================== -->




<!--=======================Cart Area ========================-->
<section class="cart_area">
   <div class="container">
      <div class="cart_inner">
         <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr align="center">
                     <th scope="col"><b>장바구니</b></th>
                     <th scope="col">price</th>
                     <th scope="col"><b>수량</b></th>
                     <th scope="col">total</th>
                     <th scope="col"><b>삭제 </b></th>
                  </tr>
               </thead>



               <tbody>
                  <c:forEach items="${cartList}" var="cart">
                     <tr align="center">
                        <td>${cart.pname}</td>
                        <td><fmt:formatNumber value="${cart.amount}" pattern="#,###,###" />원</td>
                        <td>${cart.quantity}</td>
                        <td><input type="hidden" class="product-total-amount" value='${cart.total}'><fmt:formatNumber value="${cart.total}" pattern="#,###,###" />원</td>
                       	<!--  <td><input type="hidden" name="quantity" value="${row.quantity}"></td> -->
                        <td><a class= "gray_btn ml-2" href= "${path}/carshop/delete?u_id=${cart.u_id}">삭제</a></td>
                      	<!-- <a class="gray_btn" id="btnUpdate" href="delete">삭제</a> -->
                       	<!-- delete 구현 -->
                     </tr>
                  </c:forEach>



                  <tr>
                   	
                     <td> 
                     	<div class="checkout_btn_inner d-flex align-items-center">
                     		<a class="gray_btn ml-2" id="btnUpdate" href="#" onclick = "showPopup()">Update</a> 
                        	<a class="gray_btn ml-2" id="btnDelete" href="#">비우기</a>
                        </div>
                     </td>
                  </tr>
                  



                  <tr class="total-amount_area">
                     <td class="d-none d-md-block"></td>
                     <td></td>
                     <td></td>
                     <td>
                        <h5>total</h5>
                     </td>
                     <td  id="totalMoney"></td>
                  </tr>


                  <tr class="out_button_area">
                     <td class="d-none-l"></td>
                     <td class=""></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td>
                        <div class="checkout_btn_inner d-flex align-items-center">
                           <a class="gray_btn" href="productList" id="btnList">쇼핑계속하기</a> 
                           <a class="primary-btn ml-2" href="checkout">상품주문</a>
                        </div>
                        
                        
                        
                        
                     </td>
                  </tr>
					<div id="popup" class="hide">
  						<div class="content">
							<p>장바구니 물품이 업데이트 되었습니다.</p>
								<button onclick="closePopup()">확인</button>
						</div>
					</div>              
               </tbody>
            </table>
         </div>
      </div>
   </div>
</section>
<!--================End Cart Area =================-->
<%@ include file="../include/footer.jsp"%>
<!-- footer 안에 쿼리 링크가 있어서 하단에 쿼리문 작성 -->

<!--================쿼리문 start Area ===============-->

<script>

   $(document).ready(function(){
	   productTotalCalc();
   })
   
   function productTotalCalc(){//장바구니 총 합계
	   
	  let productTotalAmount = 0; // 초기화 선언
      console.log("ready 동작 ");
      $(".product-total-amount").each(function(index,item){
    	  console.log(parseInt($(item).val()));
    	  productTotalAmount += parseInt($(item).val());
      });
      $("#totalMoney").html(productTotalAmount + "원");
      //console.log("돈 : " + money);
   }
      
   
   // 팝업창 쿼리 2021.01.09 yun.hj
   function showPopup(hasFilter) {
		const popup = document.querySelector('#popup');
	  
	  if (hasFilter) {
	  	popup.classList.add('has-filter');
	  } else {
	  	popup.classList.remove('has-filter');
	  }
	  
	  popup.classList.remove('hide');
	}

	function closePopup() {
		const popup = document.querySelector('#popup');
	  popup.classList.add('hide');
	}
   
</script>