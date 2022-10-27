<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>of-hub-product-detail</title>
<link href="css/productdetail/productdetail.css" rel="stylesheet">
<link href="css/productdetail/import.css" rel="stylesheet">
<link href="css/productdetail/common.css" rel="stylesheet">
</head>
<script src="js/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	
	$("#orderbtn").on("click", function(){
		if("${mid}" != null){
		//var q = $("#amount").val() 
			if($("#amount").val() > 0 && $("#amount").val() <= ${productdetail.p_stock}){
			$.ajax({
				url:  'ordermain',
				data: {amount:$("#amount").val(),p_id:${productdetail.p_id},m_id:"${mid}"},
				type: 'post',
				//datatype: 'json',
				success: function(a){
					alert('주문페이지로 이동합니다.');
					let url ="/ordermain2";
					location.replace(url);
				},
				error: function(){
					alert($("#amount").val() / 3);
					alert('로그인 해주세요.');
				}
			});//ajax
			}//if 양수판단 및 재고 판단.
			else if($("#amount").val() < 1) {alert("수량을 1개 이상 입력해주세요.");}
			else if($("#amount").val() > ${productdetail.p_stock}) {alert("주문수량이 재고보다 많습니다.");}
		}//if login
		else{alert("로그인 해주세요.");}
	});//order click
	$("#cartbtn").on("click", function(){
		$.ajax({
			url: 'insertCart',
			data: {amount:$("#amount").val(),p_id:${productdetail.p_id},m_id:"${mid}"},
			type: 'post',
			success: function(){
				var result = confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?");
				if(result){
					location.replace("/goCart");
				}
				else{
					
				}
			},
			error: function(){
				alert('수량을 선택해주세요.');
			}
		});//ajax
	});
});//ready

</script>
<script>
var bigPic;
window.onload = function(){
bigPic = document.querySelector("#big");
var smallPics = document.querySelectorAll(".small");


for(var i = 0; i < smallPics.length; i++){
	console.log(smallPics[i].getAttribute("src"));
	smallPics[i].addEventListener("click", changepic);
}
}

function changepic(){
	//console.log(this.getAttribute("src"));
	var smallPicAttribute = this.getAttribute("src");
	bigPic.setAttribute("src", smallPicAttribute);
	
}
</script>

<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<!-- main container -->
<div id="qqq">
	<div id="images">
		<div id="bigImages">
			<img id="big" src='images/${productdetail.p_image1 }'>
		</div>
		<div id="smallImages">
			<img class="small" src='images/${productdetail.p_image1 }'>
			<img class="small" src='images/${productdetail.p_image2 }'>
			<img class="small" src='images/${productdetail.p_image3 }'>
		</div>
	</div>

	<div id="information">
		<div id="fixed"> 
			상품명<br>
			브랜드<br>
			성별<br>
			조회수<br>
			좋아요<br>
			가격<br>
			재고<br>
			수량선택<br>
			<div id="orderss"> <input type=button value="구매하기" id="orderbtn">
			<input type=button value="장바구니" id="cartbtn"> 
			</div>
		</div>
		<div id="dynamic">
		${productdetail.p_name }<br>
		${productdetail.p_brand }<br>
		<%
		String sex = "male";
		String p_sex = (String)pageContext.getAttribute("p_sex");
		if(sex.equals( p_sex  )){
		%>
		남성 <br>		
		<%}
		else{%>
		여성 <br>		
		<%}%>
		${productdetail.p_viewcount }<br>
		${productdetail.p_like }<br>
		<fmt:formatNumber value='${productdetail.p_price}' pattern="#,###"/><br>
		${productdetail.p_stock }<br>
		<input type=number id="amount" name="amount" value=1 min=1 max="${productdetail.p_stock }" size="10"><br>
		
		
				
		</div>

	</div>
	
</div>
<img id=contents src='images/${productdetail.p_contents }'/>

	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
	
	
	
</body>

</html>