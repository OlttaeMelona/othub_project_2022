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


</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../cs/csnav.jsp" %>


	
<form method="post">

	<label>제목</label>
	<input type="text" name="cs_title" /><br>
	
	<label>작성자 </label>
	<input type="text" name="cs_writer" value="${cs_writer}" readonly/><br>
	
	<label>문의 내용</label>
	<textarea cols="50" rows="5" name="cs_question"></textarea><br>
	
	<label>비밀글</label>
	<input type="radio" value="y" name="cs_open" checked/> 공개 
	<input type="radio" value="n" name="cs_open" /> 비공개 <br>
	
	<button type="submit">작성</button>

</form>



</body>
</html>