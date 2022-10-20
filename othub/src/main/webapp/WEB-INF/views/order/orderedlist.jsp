<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
<table border="1">

	<tr>
		<th>상품정보</th>
		<th>주문날짜</th>
		<th>상품이미지</th>
		<th>색상</th>
		<th> 수량 </th>
		<th> 금액 </th>
	</tr>


	<c:forEach items="${ordered}" var="a">
		<tr>
			<td> 상품이름 : ${a.p_name }<br>
				상품가격 : <fmt:formatNumber value='${a.p_price}' pattern="#,###"/><br>
				브랜드 : ${a.p_brand }
			</td>
			<td> ${a.orderdate }</td> 
			<td> <img src='images/${a.p_thumb}' height="150" width="150"/></td>
			<td> ${a.p_color }</td>
			<td> ${a.amount } </td>
			<td> <fmt:formatNumber value='${a.p_price * a.amount}' pattern="#,###"/></td>
		</tr>
	</c:forEach>
</table>

<h3> 총 주문 금액 : <fmt:formatNumber value='${total_price}' pattern="#,###"/> 원</h3>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
	

</body>
</html>