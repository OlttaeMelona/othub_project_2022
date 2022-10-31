<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberList | Othub</title>
    <link href="css/member/coupon/import.css" rel="stylesheet">
    <link href="css/member/coupon/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		
		
		});//ready end
	</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>

<div class=container">
	<div class="container1" >
		<h3> 나의 쇼핑 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="ordered">주문내역</a></li>
					<li><a id="c_nav_d" href="goCart">장바구니</a></li>
					<li><a id="c_nav_d" href="myreserv?m_id=<%=session.getAttribute("m_id")%>">예약정보</a></li>
				</ul>
		<h3> 내 정보 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="updateform">프로필 정보/수정</a></li>
					<li><a id="c_nav_d" href="mycoupon">쿠폰함</a></li>
				</ul>
				
		<h3> 커뮤니티 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="mycommunity">내 게시글</a></li>
					<li><a id="c_nav_d" href="mylikecommunity">좋아요한 게시글</a></li>
				</ul>
	</div>
	
    <div class="container2" >
		   <h1><%=m_id %>님의 쿠폰함</h1>
	   		<c:forEach items="${couponlist }" var="list">
	     	 <div id="screen1">
		         <div id = "period">유효기간 ${list.period }일</div>
		         <div id="name">${list.cp_code} 쿠폰</div>
		         <div id = "discount">${list.cp_discountValue } 원</div>
		         <div id="date">${list.cp_createdAt } ~ ${list.cp_endAt }</div>
 			</div>
  			 </c:forEach>
		
	</div>
</div>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>