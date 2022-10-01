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
			<ul class="lookup">
				<li><a herf="">최신</a></li>
				<li><a herf="">조회순</a></li>
			</ul>
			<%if(a_id != null){%> 
			<div class="writeBtn"><a herf="">글쓰기</a></div>
			<%}%>
			<article class="card">
			</article>
		</section>
	</main>
 
	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>
