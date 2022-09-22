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
    <link href="css/login/import.css" rel="stylesheet">
    <link href="css/login/common.css" rel="stylesheet">
    <script src="js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.min.js" ></script>
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


<div id="container">
    <div class="inner">
        <div class="form_content signup_wrap">
            <h1>내 정보</h1>
            <form action="updatemember" method="post">
                <label>아이디</label>
                <input type="text" id="id" name="m_id" placeholder="ID" value="${memberdto.m_id }">
                <label>비밀번호</label>
                <input type="password" name="m_password" placeholder="Password" value="${memberdto.m_password }" readonly>
                <label>이름</label>
                <input type="text" name="m_name" placeholder="Name" value="${memberdto.m_name }">
                <label>주소</label>
                <input type="text" name="m_address" placeholder="Address" value="${memberdto.m_address }">
                <label>폰번호</label>
                <input type="text" name="m_phone" placeholder="010-1234-5678" value="${memberdto.m_phone }">
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
</body>
</html>


