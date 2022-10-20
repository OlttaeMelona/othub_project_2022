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
	<h1><%=m_id %>님의 쿠폰함</h1>
		<div class= "table">
			<table id="inventory">
				<colgroup>
					<col width="100px"><col width="100px"><col width="100px"><col width="150px"><col width="150px"><col width="150px"><col width="100px">
					<col width="100px"><col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th>쿠폰명</th>
						<th>할인금액</th>
						<th>발급일자</th>
						<th>만료일자일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${couponlist }" var="list">
					<tr class="styleone">
						<div>
						<td>${list.cp_code} 쿠폰</td>
						<td>${list.cp_discountValue } 원 </td>
						<td>${list.cp_createdAt }</td>
						<td>${list.cp_endAt }</td>
						<td>
						</td>
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