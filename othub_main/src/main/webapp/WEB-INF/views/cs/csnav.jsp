<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	// 글쓰기 로그인 확인
	$("#cswrite").on("click",function(e){
		if(<%=session.getAttribute("m_id")%>==null){
			alert("로그인 후 이용해주세요.");
			e.preventDefault();
		}
	});//onclick end
	
});//ready end
</script>
</head>
<body>

<ul> 

<li>
 <a href="/cslistPage?csnum=1">글 목록</a> 
</li>
 
 <li id="cswrite">
  <a href="/cswrite">글 작성</a> 
 </li> 
</ul>

</body>
</html>