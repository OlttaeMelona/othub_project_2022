<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> </title>

<style>
.mybar {
	display:inline-block;
}
nav.c_nav {
	display:inline-block;
	float:left;
	text-align:center;
	padding-left:50px;
	margin-bottom:10px;
	margin-top : 7em;
	width:150px;
	font-size:16px;
	height: 780px;

}

ul.nav_category{
	margin:0;
	padding:0;
}

h3 { 
	margin:0;
	padding:0;
	font-size:22px;
	margin-bottom:2px;
	text-align:center;
	margin-top: 10px;
}

a#c_nav_d {
	color:#000;
	display:block;
	padding:10px 0;
	
}
.nav_category last{
	margin-bottom: 10px;
}
a#c_nav_d:hover {
 	text-decoration:none;
 	background:#eee;
}

</style>

<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>

</script>
</head>
<body class="mybar">
	

	<nav class="c_nav">
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
	</nav>
	
</body>
</html>
