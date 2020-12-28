<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	<!--================ End Header Menu Area =================-->
<html>
<head>
    <title>http://www.happycgi.com</title>
       
    <link rel="stylesheet" href="css/form-field-tooltip.css" media="screen" type="text/css">
    <script type="text/javascript" src="http://www.blueb.co.kr/SRC/javascript/js/rounded_corners.js"></script>
    <script type="text/javascript" src="http://www.blueb.co.kr/SRC/javascript/js/formfieldtooltip.js"></script>
   
</head>
<style>
#DHTMLgoodies_formTooltipDiv{
    color:#FFF;
    font-family:arial;
    font-weight:bold;
    font-size:11px;
    line-height:120%;
}
.DHTMLgoodies_formTooltip_closeMessage{
    color:#FFFFFF;
    font-weight:normal;
    font-size:11px;
}

</style>
<body>
각각의 입력폼을 클릭해보세요
       
        <table>
            <tr>
                <td><label for="lastname">name:</label></td>
                <td><input type="text" id="lastname" name="lastname" tooltipText="Type in your last name in this box"></td>
            </tr>
            <tr valign="top">
                <td><label for="address">Address:</label></td>
                <td><textarea id="address" name="address" tooltipText="This is the box for the address"></textarea></td>
            </tr>
            <tr valign="top">
                <td><label for="address">email:</label></td>
                <td><input id="email" name="email" tooltipText="This is the box for the email"></td>
            </tr>
        </table>       


<script type="text/javascript">
var tooltipObj = new DHTMLgoodies_formTooltip();
tooltipObj.setTooltipPosition('right');
tooltipObj.setPageBgColor('#EEEEEE');
tooltipObj.setTooltipCornerSize(15);
tooltipObj.initFormFieldTooltip();
</script>

</body>
</html>
	<!--================End Login Box Area =================-->
<%@ include file="../include/footer.jsp"%>
