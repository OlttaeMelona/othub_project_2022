<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	
	<c:if test="${m_id == csview.cs_writer }">
	
	<div>
	<a href="/csmodify?cs_seq=${csview.cs_seq }">게시물 수정</a>
	<a href="/csdelete?cs_seq=${csview.cs_seq}">게시물 삭제</a>
	</div>
	
	</c:if>

</form>

<!-- 답변 -->

<hr>

	<label>답변 내용</label>
	
	<c:forEach items="${answere}" var="answere">
<li>
	<div>
		<p>${answere.answere_contents }</p>
		<p><fmt:formatDate value="${answere.answere_regdate}" pattern="yyyy-MM-dd"/></p>		
	</div>
</li>	

</c:forEach>

<c:if test="${role == 'admin' }">
<form method="post" action="/answere">
	<label>답변 입력</label>
	<textarea cols="50" rows="5" name="answere_contents"></textarea><br>
	<input type="hidden" name="cs_seq" value="${csview.cs_seq}">
	
	<button type="submit" id="add_question">작성</button>

</form>
</c:if>

</body>
</html>