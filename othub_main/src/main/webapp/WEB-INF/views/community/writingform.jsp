<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Meta Tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="expire" content="-1" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
	<link href="css/lookbook/board/import.css" rel="stylesheet">
	<link href="css/lookbook/board/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
$(document).ready(function(){
	

});
</script>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
<form action="writingcommunity" method="post" enctype="multipart/form-data" >
<div id="container">
    <div class="inner">
        <h1>STYLE</h1>
    	<div class="table">
            <table class="detail">
                <colgroup>
                    <col width="100px"><col width=""><col width="180px">
                </colgroup>
                <thead>
                    <tr>
                        <th>No. ${totalboard }</th>
                        <th><input type="text" name="s_title" placeholder="제목을 입력하세요."></th>
                        <th><%=sf.format(nowTime) %></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type=file name="s_image1" ></td>
                        <td><input type=file name="s_image2"></td>
                        <td><input type=file name="s_image3"></td>
                    </tr>
                    <tr>
                        <td colspan="3"><textarea col="2000" rows="10" name="s_contents" placeholder="내용을 입력하세요."></textarea>
                    </tr>
                </tbody>
            </table>
			<input type="hidden" name="s_writer" value="<%=session.getAttribute("m_id")%>">
			<input id="btnWriting" type="submit" value="글 등록" style="background-color: #2186db;">
        </div>
    </div>
</div>
</form>
</body>
</html>