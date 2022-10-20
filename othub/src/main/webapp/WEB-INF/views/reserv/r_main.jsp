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
	
	<!-- main container -->
	<main>
		<section>
			<article>
				<img src="images/showroom/user_img/${showroomInfo.sr_imgname1 }" width="100px">
			</article>
			<div>
				${showroomInfo.sr_image1 }
				<h3>${showroomInfo.sr_title }</h3>
				<span>${showroomInfo.sr_kind }</span><br>
				<span>${showroomInfo.sr_operatingtime }</span><br>
				<span>${showroomInfo.sr_closed }</span><br>
				<span>${showroomInfo.sr_address2 }</span><br>
			</div>
		</section>
		<section>
			<form method="post">
				<label for="r_orderer">주문자명</label>
				<input type="text" name="r_orderer" placeholder="주문자 이름을 입력해주세요.">
				<input type="hidden" name="r_id" value="${reservView.r_id }">
				<input type="hidden" name="r_price" value="${showroomInfo.sr_price }">
				<button type="submit" onclick="javascript:form.action='/reservprocess'">예약 하기</button>
				<button type="submit" onclick="javascript:form.action='/cenclereserv'">예약 취소</button>
			</form>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
