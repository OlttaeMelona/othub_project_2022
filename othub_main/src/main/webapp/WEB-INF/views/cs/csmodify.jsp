<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<%@ include file="../cs/csnav.jsp" %>
	
	
<form method="post">

	<label>제목</label>
	<input type="text" name="cs_title" value="${csview.cs_title}" /><br>
	
	<label>작성자</label>
	<input type="text" name="cs_writer" value="${csview.cs_writer}"/><br>
	
	<label>문의 내용</label>
	<textarea cols="50" rows="5" name="cs_question">${csview.cs_question}</textarea><br>
	
	<button type="submit">완료</button>

</form>

</body>
</html>