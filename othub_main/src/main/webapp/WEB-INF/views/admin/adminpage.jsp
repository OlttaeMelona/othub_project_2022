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

<link href="css/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>

<title>AdminPage | Othub</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<div>
	<h3>관리자 페이지</h3>
	<h5>쇼핑정보 조회</h5>
	<ul>
		<li><a href="ordered">주문내역</a></li>
		<li><a href="goCart">장바구니</a></li>
	</ul>
	
	<h5>회원정보</h5>
	<ul>
		<li><a href="memberlist">전체 회원 조회</a></li>
		<li><a href="">장바구니</a></li>
		<li><a href="mycommunity">내 게시글</a></li>
		<li><a href="mylikecommunity">좋아요한 게시물</a></li>
		<li></li>
	</ul>
</div>	

	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
