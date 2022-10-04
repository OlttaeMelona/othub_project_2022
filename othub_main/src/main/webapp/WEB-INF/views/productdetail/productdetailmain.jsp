<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>of-hub-product-detail</title>
<link href="css/productdetail/import.css" rel="stylesheet">
<link href="css/productdetail/common.css" rel="stylesheet">
</head>
<script src="js/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	$("#orderbtn").on("click", function(){
		$.ajax({
			url: 'ordermain',
			data: {amount:$("#amount").val(),p_id:${productdetail.p_id},m_id:"${mid}"},
			type: 'post',
			//datatype: 'json',
			success: function(a){
				alert('order success');
				let url ="/ordermain2";
				location.replace(url);
			},
			error: function(){
				alert('error!!');
			}
		});//ajax
	});//order click
	$("#cartbtn").on("click", function(){
		$.ajax({
			url: 'insertCart',
			data: {cart_qty:$("#amount").val(),p_id:${productdetail.p_id},m_id:"${mid}"},
			type: 'post',
			success: function(){
				var result = confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?");
				if(result){
					location.replace("/goCart");
				}?
				else{
					location.replace("/")
				}
			},
			error: function(){
				alert('cart error!!');
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
	${productdetail.p_name }
	
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

	<div class="information">
		<div> 브랜드 ${productdetail.p_brand } </div>
		<c:set var="p_sex" value="${productdetail.p_sex }" />

<%
String sex = "male";
String p_sex = (String)pageContext.getAttribute("p_sex");
if(sex.equals( p_sex  )){
%>
<div > 성별 : 남성 </div>		
<%}
else{%>
<div > 성별 : 여성 </div>		
<%}%>
		
		<div> 조회수 ${productdetail.p_viewcount } </div>
		<div> 좋아요 ${productdetail.p_like } </div>
		<div> 가격 ${productdetail.p_price } </div>
		<div> 수량선택 <input type=text id="amount" name="amount" ></div>
		<div> 구매하기 <input type=button id="orderbtn"> </div>
		<div> 장바구니 <input type=button id="cartbtn"> </div>
	</div>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
	
	
	
</body>

</html>