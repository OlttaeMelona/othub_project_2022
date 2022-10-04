<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#btn").click(function(){
	    alert("Hello");
	  });
});
</script>
</head>
<body>

${order_id}  : order_id<br>
${product_id } : product_id<br>
${productdetail.p_name } : productdetail<br>
${ordersdetail.orderdate } : ordersdetail<br>
${memberdetail.m_id } : membersdetail<br>

<a href="doOrder?order_id=${order_id}" onClick="alert('주문 완료되었습니다.')">주문하기</a>
<a href="cancleOrder?order_id=${order_id}" onClick="alert('주문 취소되었습니다.')">취소하기</a>
<input type="button" id="btn" value="bttn"/>
</body>
</html>