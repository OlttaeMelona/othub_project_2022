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
</head>
<body>
	<footer>
	 	<div class="footer_line"></div>
		<div class="footer">
			<span><a href="#">team.mandlejo</a></span>
			<span><a href="#">연락처</a></span>
			<span><a href="#">인스타그램</a></span>
			<span><a href="#">깃허브</a></span>
			<span><a href="#">주소</a></span>
			<span><a href="#">고객센터</a></span>
			<%if(session.getAttribute("a_id") == null){ %>
			<span><a href="admin_login">관리자</a></span>
			<%} %>
		</div>
	</footer>
</body>
</html>
