<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

	});
</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
<div> 저희 분석 프로그램에 의하면 ${m_id }회원님은 ${head}등신이십니다. </div>

<div> 회원님과 비슷한 체형의 모델이 입은 옷은 다음과 같습니다. (사진을 클릭하면 제품 링크로 이동합니다)</div>


<c:forEach items="${pid_list }" var="onefile">
<h3> ${onefile.p_name } </h3>
<h3> <a href="productdetail?p_id=${onefile.p_id }"> <img src="/images/${onefile.p_thumb }"> </a> </h3>


</c:forEach>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>