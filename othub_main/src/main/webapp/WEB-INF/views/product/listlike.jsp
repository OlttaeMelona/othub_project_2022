<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

	
});//ready end



</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@include file="categorybar.jsp" %>

<h3> 상품 리스트 </h3>

<ul id="product" class="like">

<c:forEach items="${like}" var="like" end="0" >
<div id="productlist">
 <a href="/listrecent?c=${like.category_id}"> 최신순 </a> &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
 <a href="/listlike?c=${like.category_id}"> 인기순 </a>
</div>
</c:forEach>

   <c:forEach items="${like}" var="like">
   <li>
    <div class="p_image1">
     <img src="${like.p_image1}">
    </div>   
    <div class="p_name">
     <a href="/view?n=${like.p_name}">${like.p_name}</a>
    </div>
    <div class="p_brand">
     📍 ${like.p_brand}
     </div>
    <div class="p_price">
     💰 <fmt:formatNumber value="${like.p_price}" pattern="#,###" />
    </div>
    <div class="p_like">
     💗 ${like.p_like}
    </div>
   </li>
   </c:forEach>
</ul>

<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>