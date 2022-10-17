<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	
$(document).ready(function() {
	// 일반글 로그인 확인
	$("#cs_title").on("click",function(e){
		if(<%=session.getAttribute("m_id")%> == null){
			alert("로그인하셔야 확인 가능합니다.");
			e.preventDefault();
		}
		
	});//onclick end
	
	// 비밀글 열람 확인
	$("#cs_title_secret").on("click",function(e){
		if(<%=session.getAttribute("m_id")%> != null){
			alert("작성자만 열람 가능합니다.");
			e.preventDefault();
		}
		
	});//onclick end
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../cs/csnav.jsp" %>

<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성자</th>
   <th>작성일</th>
  </tr>
 </thead>
 
 <tbody>
 
 <c:forEach items="${cslist}" var="cslist">
 <tr>
  <td>${cslist.cs_seq}</td>
  
  <!-- no 비밀글 -->
  <c:if test="${cslist.cs_open == 'y'}" >
  <td><a href="/csview?cs_seq=${cslist.cs_seq}" id="cs_title">
  ${cslist.cs_title}</a></td>
  </c:if>
  
  <!-- 비밀글 -->
  <c:if test="${cslist.cs_open == 'n'}" >
  <c:choose>
  	<c:when test="${cslist.cs_writer == m_id || role1 == 'admin'}">
	  	<td><a href="/csview?cs_seq=${cslist.cs_seq}" id="cs_title_secret">
	  	<img src="../images/cs/lock.png" style="width:15px; height:15px">
	  	${cslist.cs_title} </a></td>
  	</c:when>
  	<c:otherwise>
  	<td>
  	<img src="../images/cs/lock.png" style="width:15px; height:15px">
  	비밀글입니다.</td>
  	</c:otherwise>
  	</c:choose>
  </c:if>
  
  <td>${cslist.cs_writer}</td>
  <td><fmt:formatDate value="${cslist.cs_regdate}" pattern="yyyy-MM-dd"/></td>
 </tr>
</c:forEach>
  
 </tbody>

</table>

<div>
<c:if test="${csprev}">
 <span>[ <a href="/cslistPage?csnum=${csstartPageNum - 1}">이전</a> ] 
  </span>
</c:if>

<c:forEach begin="${csstartPageNum}" end="${csendPageNum}" var="csnum">
  <span>
    <c:if test="${csselect != csnum}">
   <a href="/cslistPage?csnum=${csnum}">${csnum}</a>
  </c:if>    
  
  <c:if test="${csselect == csnum}">
   <b>${csnum}</b>
  </c:if>
  </span>
</c:forEach>

<c:if test="${csnext}">
 <span>[ <a href="/cslistPage?csnum=${csendPageNum + 1}">다음</a> ] 
 </span>
</c:if>
</div>


</body>
</html>