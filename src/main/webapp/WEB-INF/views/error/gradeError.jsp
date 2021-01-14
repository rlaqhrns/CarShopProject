<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<body>
    	<h2>권한이 없습니다.</h2>
        <h2 class="countdown"></h2>
   
</body>

<script>
	$(document).ready(function(){
        //카운트 시작 숫자
        var count = 3;
        //카운트다운함수
        var countdown = setInterval(function(){
        //해당 태그에 아래 내용을 출력
        $("h2.countdown").html( count +"초 후 이전 페이지로 이동 합니다.");
            //0초면 초기화 후 이동되는 사이트
            if (count == 0) {
                clearInterval(countdown);
                window.history.back();
                }
            count--;//카운트 감소
        }, 1000);
		
		   

	})

</script>

<%@ include file="../include/footer.jsp"%>
