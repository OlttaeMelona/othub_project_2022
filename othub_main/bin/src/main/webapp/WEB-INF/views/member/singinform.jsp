<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="expire" content="-1" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="imagetoolbar" content="no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta name="robots" content="index,follow" />
<!-- css, javascript -->
<link href="css/member/import.css" rel="stylesheet">
<link href="css/member/common.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>

<title>회원가입</title>

<script>
	$(document).ready(function() {

	});//ready
</script>
</head>

</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>

	<!-- main container -->
	<div id="container">
		<div class="inner">
			<div class="form_content signup_wrap">
				<h1>Sign Up</h1>
				<form action="signin" method="post">
					<label>아이디</label> <input type="text" name="m_id" placeholder="ID">
					<label>비밀번호</label> <input type="password" name="m_password"
						placeholder="Password"> <label>이름</label> <input
						type="text" name="m_name" placeholder="이름"> <label>주소</label>
					<input type="text" name="m_address" placeholder="주소"> <label>폰번호</label>
					<input type="text" name="m_phone" placeholder="010-1234-5678">
					<label>이메일</label> <input type="email" name="m_email"
						placeholder="Email"> <label>성별</label> <input type="radio"
						name="m_sex" value="남">남 <input type="radio" name="m_sex"
						value="여">여 <input id="signbtn" type="submit" value="가입하기"
						style="background-color: #2186db;">
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
