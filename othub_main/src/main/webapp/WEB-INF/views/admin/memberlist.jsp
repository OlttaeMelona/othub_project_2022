<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/admin/import.css" rel="stylesheet">
    <link href="css/admin/common.css" rel="stylesheet">
    <script src="js/jquery-3.6.0.min.js"></script>


<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>

<title>MemberList | Othub</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	
	});//ready end
</script>
</head>
<body>

<div id="container">
	<div class="inner">
	<h1>가입 회원 정보</h1>
		<div class= "table">
			<table id="inventory">
				<colgroup>
					<col width="100px"><col width="100px"><col width="100px"><col width="150px"><col width="150px"><col width="150px"><col width="100px">
					<col width="100px"><col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>주소</th>
						<th>폰</th>
						<th>이메일</th>
						<th>성별</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberlist }" var="member">
					<tr class="styleone">
						<div>
						<td><input type="text" value="${member.m_id}" name="m_id"></td>
						<td><input type="text" value="${member.m_pw }" name="m_pw"></td>
						<td><input type="text" value="${member.m_name }" name="m_name"></td>
						<td><input type="text" value="${member.m_address }" name="m_address"></td>
						<td><input type="text" value="${member.m_phone}" name="m_phone" class="phone"></td>
						<td><input type="text" value="${member.m_email }" name="m_email" class="email"></td>
						<td><input type="text" value="${member.m_sex}" name="m_sex"></td>
						<td>${member.m_regdate }</td>
						<td class="deletemember"><button>회원탈퇴</button></td>
						</div>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>