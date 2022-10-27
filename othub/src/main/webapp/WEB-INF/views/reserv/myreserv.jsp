<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/reserv/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<!-- mypage nav -->
	<%@include file="../member/mypagebar.jsp" %>
	
	
	<section class="myReserv">
		<div>
			<h3 class="reservTitle">MY예약</h3>
			<c:forEach items="${myList}" var="myreserv">
				<div class="reserv_card">
					<div>
						<span>${myreserv.r_date }</span>
					</div>
					<div>
						<span>예약자</span>
						<span>${myreserv.r_orderer }</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
