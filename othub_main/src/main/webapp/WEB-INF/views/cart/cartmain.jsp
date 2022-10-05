<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="${cart_list }" items="${cart_list }">
	${cart_list.m_id }<br>
</c:forEach>

</body>
</html>