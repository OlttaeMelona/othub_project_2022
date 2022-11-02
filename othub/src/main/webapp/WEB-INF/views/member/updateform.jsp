<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
    <link href="css/login/update/import.css" rel="stylesheet">
    <link href="css/login/update/common.css" rel="stylesheet">
    <script src="js/jquery-3.6.0.min.js"></script>
<title>OtHub</title>
<script src="resources/js/jquery-3.6.0.min.js" ></script>
<link href="css/product/productmain.css" rel="stylesheet">
<script>
$(document).ready(function(){
	
	$("#deletechk").click(function(ev){
		 if(!confirm("회원탈퇴 하시겠습니까?")) {
			 ev.preventDefault();
		 }
	 });
});
</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>

<div class=container">
	<div class="container1" >
		<h3> 나의 쇼핑 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="ordered">주문내역</a></li>
					<li><a id="c_nav_d" href="goCart">장바구니</a></li>
					<li><a id="c_nav_d" href="myreserv?m_id=<%=session.getAttribute("m_id")%>">예약정보</a></li>
				</ul>
		<h3> 내 정보 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="updateform">프로필 정보/수정</a></li>
					<li><a id="c_nav_d" href="mycoupon">쿠폰함</a></li>
				</ul>
				
		<h3> 커뮤니티 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="mycommunity">내 게시글</a></li>
					<li><a id="c_nav_d" href="mylikecommunity">좋아요한 게시글</a></li>
				</ul>
	</div>
	
    <div class="container2" >
		   <h1><%=m_id %> 님의 정보</h1>
            <form action="updatemember" method="post">
                <label>아이디</label>
                <input type="text" id="m_id" name="m_id" placeholder="ID" value="${memberdto.m_id }" readonly>
                <label>비밀번호</label>
                <input type="password" id="m_password" name="m_pw" placeholder="Password" value="${memberdto.m_pw }" readonly>
                <label>이름</label>
                <input type="text" id="m_name" name="m_name" placeholder="Name" value="${memberdto.m_name }">
                <label>주소</label>
                <input type="text" id="m_address" name="m_address" placeholder="Address" value="${memberdto.m_address }">
                <label>폰번호</label>
                <input type="text" id="m_phone"name="m_phone" placeholder="010-1234-5678" value="${memberdto.m_phone }">
                <label>이메일</label>
                <input type="email" name="m_email" placeholder="Email" value="${memberdto.m_email }">
                <label>가입일</label>
                <input type="text" name="m_regdate" placeholder="regdate" value="${memberdto.m_regdate  }" readonly="readonly">
                <input id="updatebtn" type="submit" value="수정하기" style="background-color:#2186db;" >
                <h1><a id="deletechk" href="deletemember" >회원 탈퇴</a></h1>
            </form>

    </div>
</div>

		</div>
	</div>
</div>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>


