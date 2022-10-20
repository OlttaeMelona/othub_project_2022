<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="css/cart/import.css" rel="stylesheet">
<link href="css/cart/common.css" rel="stylesheet">
<script>
$(document).ready(function() {
	//check box 클릭스 담아주는 변수
	var cart = {
			buyList : [],
			init : function(){
				//buyList 초기화
				this.buyList = [];
			},
			getBuyList
	}
});
</script>
<script>

</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
 

<table>
	<tr>		
			<th> <input type="checkbox" checked="checked" id="checkAll" value="1"> </th>
			<th> 상품정보 </th>
			<th> 상품이미지 </th>
			<th> 색상 </th>
			<th> 수량 </th>
			<th> 금액 </th>			
	</tr>
<c:forEach items="${cart_list}" var="a">		
		<tr>
			<td> <input type="checkbox" checked="checked"> </td> 
			<td> 상품이름 :<a href="productdetail?p_id=${a.p_id }">  ${a.p_name } </a><br>
				상품가격 : <fmt:formatNumber value='${a.p_price}' pattern="#,###"/><br>
				브랜드 : ${a.p_brand }
			</td>
			<td>  <a href="productdetail?p_id=${a.p_id }"> <img src='images/${a.p_image1 }' height="150" width="150"/> </a></td>
			<td> ${a.p_color }</td>
			<td>
				<form action="cartAmount">
				<input name="newamount" type="number" value="${a.amount }"/>
				<input name="newcart_id" type="hidden" value="${a.cart_id}"/>
				<input id="zero" type="submit" value="수정하기">
				</form>
			</td>
			<td> <fmt:formatNumber value='${a.p_price * a.amount}' pattern="#,###"/></td>
		</tr>
	
</c:forEach>
</table>
<a href="/cartToOrder">주문하기</a>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>