<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/login/import.css" rel="stylesheet">
    <link href="css/login/common.css" rel="stylesheet">
    <script src="js/jquery-3.6.0.min.js"></script>
<title>MyPage | OtHub</title>
<link href="css/style.css" rel="stylesheet">


<script>
	$(document).ready(function() {
	
	});//ready end
</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>

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
		   <h1>마이페이지</h1>
	   	<div class="inner1">
	   		<div class="x">회원등급</div>
	   		<div class="y">${role2 }</div>
	   	</div>
		<div class="inner2">
			<div class="x">사용가능쿠폰</div>
	   		<div class="y">${couponcount }장</div>
		</div>
	</div>
</div>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
