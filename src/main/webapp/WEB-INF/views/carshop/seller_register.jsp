<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

</head>

<body>
<div id="test2" style="color: gold; font-size: 70px; font-weight: 900; height: 100px; position: relative;z-index=1;">
가나다라  ABCD
</div>
<div id = "test" style="color: lime; font-size: 70px; font-weight: 900; height: 100px; position: relative; z-index=2; left: 0px;  top: -100px;">
가나다라  ABCD
</div>
<input type="button" value="버튼" id="button" onClick="tt()">
<script>
	function tt(){
		console.log("들옴");
		document.getElementById('test2').style.zindex=2;
		document.getElementById('test').style.zindex=1;
		document.getElementById('test').style.backgroundColor='red';
	}
</script>
</body>

</html> 