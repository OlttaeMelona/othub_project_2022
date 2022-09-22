<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link href="css/main/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		//반응형 메뉴버튼
		$(".nav_toggleBtn").on("click", function(){
			$('.nav_user_menu').toggleClass('active');
			$('.nav_main_menu').toggleClass('active');
		})//on click
	});//ready end
</script>
</head>
<body>
	<header>
		<nav class="nav">
			<div href="" class="nav_toggleBtn">
				<i class="fa-solid fa-bars"></i>
			</div>
			<div class="nav_bar1">
				<div class="nav_logo">
					<a href="">OT-HUB</a>
				</div>
				<ul class="nav_user_menu">
					<li><a href="login">login</a></li>
					<li><a href="signin">sign up</a></li>
					<li><a href="">Customer Support</a></li>
				</ul>
			</div>
			<div class="nav_bar2">
				<div class="nav_main_menu">
					<span><a href="">룩북</a></span>
					<span><a href="">쇼핑몰</a></span>
					<span><a href="">쇼룸</a></span>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>
