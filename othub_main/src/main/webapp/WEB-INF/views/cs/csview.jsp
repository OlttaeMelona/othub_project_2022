<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	${csview.cs_title}<br>
	
	<label>작성자</label>
	${csview.cs_writer}<br>
	
	<label>문의 내용</label>
	${csview.cs_question}<br>
	
	<div>
	<a href="/csmodify?cs_seq=${csview.cs_seq }">게시물 수정</a>
	<a href="/csdelete?cs_seq=${csview.cs_seq}">게시물 삭제</a>
	</div>

</form>

<!-- 답변 -->

<hr>

<div>
답변 내용
</div>


</body>
</html>