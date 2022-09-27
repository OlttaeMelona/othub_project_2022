
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="community.CommunityDTO"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STYLE | OtHub</title>
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
	<link href="css/lookbook/board/comment.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {


	//좋아요 
	$("#like_btn").click(function(){
		var s_seq = ${oneCommu.s_seq}
		var m_id = "<%=session.getAttribute("m_id") %>";
		if(m_id == 'null'){
			alert("로그인 후 이용가능합니다");
		}
		
		$.ajax({
			type : "POST",
			url : "boardlike",
			dataType : "json",
			data : {'s_seq' : s_seq, 'm_id' : m_id},
			
			success : function(resp){
				if(resp.result == 0){
					$(".off").attr("class","on");
				}
				else if(resp.result == 1){
					$(".on").attr("class","off");
					
				}
				$("#likecnt").html(resp.result2);
			}
		});//ajax
	});//onclick end
	
	
	//댓글등록
	$("#replyRegist").click(function(){
		var b_seq = ${oneCommu.s_seq} ;//글번호
		var cm_contents = $("#reply").val();
		var cm_writer = "<%=session.getAttribute("m_id") %>";
		
		if(cm_contents == ''){
			alert("내용을 입력해주세요");
		}
		else if(cm_writer == "null"){
			alert("로그인 후 이용해주세요");
		}
		
		$.ajax({
			type: "post",
			url : "../reply/replyRegist",
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({"b_seq": b_seq, "cm_contents" : cm_contents, "cm_writer": cm_writer}),
			success : function(data){
				if(data == 1){ //성공
					$("#reply").val("");
					getList();
					commentCount();
				}else{ //실패
					alert("잠시 후 다시 확인해주세요")
				}//if else end
			},//success end
		});//ajax end

	})//댓글 end
	
	getList(); //데이터 조회 메소드 호출
	//데이터 조회
	function getList(){
		
		var b_seq = ${oneCommu.s_seq} ;//글번호
		var pageNum = 1;
		
		$.getJSON("../reply/getList/" + b_seq + "/" + pageNum,
		function(data) {
            
            var str = "";
			
        	for(var i = 0 ; i < data.length ; i++){
                var date = new Date(data[i].cm_writingtime);
                var writingtime = date.getFullYear() + "/" + (date.getMonth()+1) + "/" +date.getDate();
        		
                str += "<div class='comment'>";
                str += "<div class='profile clearfix'>";
                str += "<span class='img fl'></span>";
                str += "<span class='id fl'>" + data[i].cm_writer + "</span>";
                str += "</div>";
                str += "<div class='comment_content'>" +  data[i].cm_contents + "<em>" +writingtime +"</em>";
                str += "</div>";
                str += "</div>";
        	}
            
            $("#comments").html(str);
            $("#comment_num").html(data[i])
        });
    } //getList end
    commentCount();
    
	function commentCount(){
		
		var b_seq = ${oneCommu.s_seq} ;//글번호
		var pageNum = 1;
		
		$.getJSON("../reply/commentCount/" + b_seq + "/" + pageNum,
		function(data) {
            
            $("#comment_num").html("댓글 "+data)
        });
    }//commentCount end
	

	
});//ready end
</script>

</head>

<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
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
                        <th>No. ${oneCommu.s_seq }</th>
                        <th>${oneCommu.s_title }</th>
                        <th>조회수 ${oneCommu.s_viewcount }</th>
                    </tr>
                </thead>
                <tbody>

                   <tr class="stylenone">
                   <td colspan="1">작성자 ${oneCommu.s_writer}</td>
                   <% if(request.getAttribute("writer").equals(session.getAttribute("m_id"))){ %>
                        <td colspan="5">
                            <a href="deleteCommunity?s_seq=${oneCommu.s_seq }" id="deletechk" class="delete_btn btns">삭제하기</a>
                            <a href="updatecommuform?s_seq=${oneCommu.s_seq }" class="edit_btn btns">수정하기</a>                           
                   </td>
                   <% }else{} %>
                    </tr>
                 
                  
                    <tr>
                        <td colspan="6"><img src="images/community/styleimg/${oneCommu.imagename1 }" alt="firstimage" style="width: 600px"></td>
                    </tr>
                    <% if(!request.getAttribute("image2").equals("")){ %>
                    <tr>
                        <td colspan="6"><img src="images/community/styleimg/${oneCommu.imagename2 }" alt="secondimage"style="width: 600px"></td>
                    </tr>
                    <%} %>
                      <% if(!request.getAttribute("image3").equals("")){ %>
                    <tr>
                        <td colspan="6"><img src="images/community/styleimg/${oneCommu.imagename3 }" alt="thirdimage"style="width: 600px"></td>
                    </tr>
                    <%} %>
                    <tr class="lasttr" >
                    	<td colspan="6" style="color:black; font-size: 22px">${oneCommu.s_contents}</td>
                    </tr>
                </tbody>
            </table>
            <script type="text/javascript">imgSize("img");</script>
            <!-- 댓글 -->
            <div class="comment_box">
                <div class="clearfix">
                    <div class="comment_num fl" id="comment_num"></div>
  
                    
					<div class="like fl">
						<%if(((Integer)request.getAttribute("result")).intValue()==1) {%>
                        <a id="like_btn" class="on"><%} else{ %><a id="like_btn" class="off"><%} %>
                        <span class="heart"></span>좋아요 <span id="likecnt">${oneCommu.s_like }</span></a>
                    </div>
                </div>
                
                <!-- 댓글 조회 -->
            	<div class="comments" id="comments">
                    
                </div>
                    <!-- 댓글 작성 -->
                    <div class="clearfix">
                        <div class="fl">
                            <textarea placeholder="댓글을 작성해주세요." width="300px" id="reply"></textarea>
                        </div>
                        <div class="fl">
                            <button type="button" class="write_btn" id="replyRegist">댓글달기</button>
                        </div>
                    </div>
                </div>
            </div>
                    
            <a href="/community" class="more" style="color:white">목록</a>
        </div>
    </div>
</div>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>