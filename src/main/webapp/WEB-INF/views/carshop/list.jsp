<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">
		<button type="button" onclick="location.href='../bank/register'">
			계좌 등록
		</button>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#번호</th>
                      <th>이름</th>
                      <th>비밀번호</th>
                      <th>계좌</th>
                      <th>입금액</th>
                      <th>출금액</th>
                      <th>통장잔액</th>
                      <th>대출 가능여부</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>#번호</th>
                      <th>이름</th>
                      <th>비밀번호</th>
                      <th>계좌</th>
                      <th>입금액</th>
                      <th>출금액</th>
                      <th>통장잔액</th>
                      <th>대출 가능여부</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <c:forEach items="${list}" var ="bank">
                    <tr>
                      <td><c:out value="${bank.free_id}"></c:out></td>                    
                      <td><c:out value="${bank.free_name}"></c:out></td>
                      <td><c:out value="${bank.free_password}"></c:out></td>
                      <td><c:out value="${bank.free_serial}"></c:out></td>
                      <td><a href='/bank/get?free_id=<c:out value="${bank.free_id}"/>'>
                      <c:out value="${bank.deposit_amount}"></c:out></a></td>
                      <td><a href='/bank/sub?free_id=<c:out value="${bank.free_id}"/>'>
                      <c:out value="${bank.withdrawal_amount}"></c:out></a></td>
                      <td><c:out value="${bank.balance}"></c:out></td>
                      <td><a href='/bank/person?free_id=<c:out value="${bank.free_id}"/>'>
                      <c:out value="${bank.loan_ava}"></c:out></a></td> 
                   </c:forEach>
                  </tbody>
                </table>
                <!-- End of Tables Example -->
                <!-- modal 추가 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> <!-- x 표시임 &;요게 -->    
                      </div>
                      <div class="modal-body">처리가 완료되었습니다</div>
                      <div class="modal-footer">
                        <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save Changes</button>
                      </div>
                    </div>
                    <!-- modal-content -->
                  </div>
                  <!-- modal dialog -->
                </div>
                <!-- modal -->

          <!-- Scroll to Top Button-->
  				<a class="scroll-to-top rounded" href="#page-top">
   					<i class="fas fa-angle-up"></i>
  				</a>
 			<script type="text/javascript">
	            $(document).ready(function() {
	              var result = '<c:out value="${result}"/>'; //246pg
	              checkModal(result);
	              function checkModal(result) {
	                if(result==='') {
	                  return;
	                }
	                if(parseInt(result) > 0) {
	                  $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
	                }
	                $("#myModal").modal("show");
	              }
	              function checkA() {
	              }
	            });
          </script>
                
              </div>
            </div>
  

<%@ include file="../include/footer.jsp" %>
  