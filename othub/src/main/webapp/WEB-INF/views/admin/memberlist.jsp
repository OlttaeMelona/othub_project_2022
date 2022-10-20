<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberList | Othub</title>
    <link href="css/admin/import.css" rel="stylesheet">
    <link href="css/admin/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		
		
		});//ready end
	</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
	
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
						<th>등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberlist }" var="member">
					<tr class="styleone">
						<div>
						<form action ="updateMemberByAdmin" method="post">
						<td><input type="text" value="${member.m_id}" name="m_id"></td>
						<td>${member.m_pw }</td>
						<td>${member.m_name }</td>
						<td>${member.m_address }</td>
						<td>${member.m_phone}</td>
						<td>${member.m_email }</td>
						<td>${member.m_sex}</td>
						<td>${member.m_regdate }</td>
						<td>
							<select name="role1">
								<c:if test="${member.role1.equals('admin') }">
								    <option value="${member.role1}">${member.role1}</option>
								    <option value="user">user</option>
								    <option value="partner">partner</option>
								</c:if>
								<c:choose>
									<c:when test="${member.role1.equals('partner')}">
										<option value="${member.role1}">${member.role1}</option>
									    <option value="user">user</option>
									    <option value="admin">admin</option>
								    </c:when>
									<c:when test="${member.role1.equals('user')}">
										<option value="${member.role1}">${member.role1}</option>
									    <option value="admin">admin</option>
									    <option value="partner">partner</option>
								    </c:when>
								    
								</c:choose>>    
							</select>
						</td>
						<td class="deletemember"><button type="submit">수정</button></td>
						</form>
						</div>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>