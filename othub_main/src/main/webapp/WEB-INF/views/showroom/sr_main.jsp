<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ShowRoom | OtHub</title>
	<!-- css, javascript -->
	<link href="css/showroom/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
	
		});//ready end
	</script>
</head>
<body>
		
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
	

	<!-- main container -->
	<main>
		<section class="main showroom">
			<div class="sub_sr_menu">
				<ul class="lookup">
					<li><a href="">전체</a></li>
					<li><a href="">스튜디오</a></li>
					<li><a href="">사진관</a></li>
					<li><a href="">사진작가</a></li> 
				</ul>
				<% if(role != null){if(role.equals("admin")){ %>
				<a href="sr_writing"><div class="writeBtn">게시글 등록하기</a>
				<%} }%>
			</div>
			<hr class="hr">
			<article class="sr_card_box">
				<c:forEach items="${sr_newList }" var="showroom">
					<div class="sr_card">
						<div class="sr_card_img">
							<a href="">
								<img src="images/showroom/user_img/${showroom.sr_imgname1 }">
							</a> 
						</div>
						<div class="sr_card_info">
							<h3>${showroom.sr_title }</h3>
							<div class="location">
								<i class="fa-solid fa-location-dot"></i>
								<span>${showroom.sr_region }</span>
							</div>
							<div class="price">
								<span class="price_val">${showroom.sr_price } </span>
								<span class="price_unit">원/시간</span>
								<% if(role != null){if(role.equals("admin")){ %>
								<span class="editBtn"><a href="">수정</a></span>
								<%} }%>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="sr_paging">
					<% int totalPage = (Integer)request.getAttribute("sr_totalPage");
						for(int i = 1; i<= totalPage; i++){ %>
							<a href="showroom?page=<%=i%>"><%=i%></a> 
					<%}%>
				</div>
			</article>
		</section>
	</main>

	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>
