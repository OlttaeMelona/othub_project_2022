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

<script>
debugger;
$(document).ready(function(){
	
	function checkId(){
		
		var m_id = $('#m_id').val();
		
		$.ajax({
			url : '/idCheck',
			type : 'post',
			data : {m_id:m_id},
			success : function(cnt){
				if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                $('.id_ok').css("display","inline-block"); 
	                $('.id_already').css("display", "none");
	            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                $('.id_already').css("display","inline-block");
	                $('.id_ok').css("display", "none");
	                alert("아이디를 다시 입력해주세요");
	                $('#id').val('');
				}
			},
			error:function(){
				alert("에러입니다");
			}
				
		});
	}
	
});//ready


</script>
</head>

</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
<div id="container">
    <div class="inner">
        <div class="form_content signup_wrap">
            <h1>Sign Up</h1>
            <form action="signin" method="post">
                <label>아이디</label>
                <input type="text" name="m_id" placeholder="ID" id="m_id" oninput = "checkId()">
              	<span class="id_ok">사용 가능한 아이디입니다.</span>
				<span class="id_already">이미 사용중인 아이디입니다.</span>
                <label>비밀번호</label>
                <input type="password" name="m_password" placeholder="Password">
                <label>이름</label>
                <input type="text" name="m_name" placeholder="이름">
                <label>주소</label>
                <input type="text" name="m_address" placeholder="주소">
                <label>폰번호</label>
                <input type="text" name="m_phone" placeholder="010-1234-5678">
                <label>이메일</label>
                <input type="email" name="m_email" placeholder="Email">
                <label>성별</label>
                <input type="radio" name="m_sex" value="남" id="man">
                <div class="radio">
                <label for="man" class="on">남</label>
				<input type="radio" name="m_sex" value="여" id="woman">
				<label for="woman" class="on">여</label>
                <input id="signbtn" type="submit" value="가입하기" style="background-color:#2186db;">
                <c:if test="${message == 'error'}">
 					<div style="color:red;"> 중복된 아이디 입니다.
 					</div>
 				</c:if>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
