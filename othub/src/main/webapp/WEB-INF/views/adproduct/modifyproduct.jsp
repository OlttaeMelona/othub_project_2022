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
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../adproduct/adpnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>


<form method="post" enctype="multipart/form-data" class="writing_box">

<button type="submit" class="product_submit">등록</button>

상품명 <input type="text" name="p_name"> <br>
브랜드명 <input type="text" name="p_brand"> <br>
성별 <input type="radio" name="p_sex" value="male"> 남성
<input type="radio" name="p_sex" value="female"> 여성 <br>
색 <select name="p_color">
<option value="white"> white </option>
<option value="black"> black </option>
<option value="blue"> blue </option>
<option value="red"> red </option>
<option value="orange"> orange </option>
<option value="yellow"> yellow </option>
<option value="green"> green </option>
<option value="brown"> brown </option>
<option value="silver"> silver </option>
<option value="gold"> gold </option>
<option value="ivory"> ivory </option>
<option value="beige"> beige </option>
</select> <br>
가격 <input type="number" name="p_price"> <br>
재고 <input type="number" name="p_stock"> <br>
카테고리 <select name="category_id">
<option value=1> 상의 </option>
<option value=2> 하의 </option>
<option value=3> 아우터 </option>
<option value=4> 신발 </option>
<option value=5> 가방 </option>
</select>




<div class="inputpic">
   <label for="p_thumb">p_thumb</label>
   <input type="file" id="p_thumb" name="p_thumb" onchange="readURL1(this)"/>
   <br><img id="select_img1" style="width:400px">
   
   <script>
   function readURL1(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img1').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img1').src = "";
		}
	}
   </script>
   
</div>

<div class="inputpic">
   <label for="p_image1">p_image1</label>
   <input type="file" id="p_image1" name="p_image1" onchange="readURL2(this)"/>
   <br><img id="select_img2" style="width:400px">
   
   <script>
   function readURL2(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img2').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img2').src = "";
		}
	}
   </script>
   
</div>

<div class="inputpic">
   <label for="p_image2">p_image2</label>
   <input type="file" id="p_image2" name="p_image2" onchange="readURL3(this)"/>
   <br><img id="select_img3" style="width:400px">
   
   <script>
   function readURL3(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img3').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img3').src = "";
		}
	}
   </script>
   
</div>

<div class="inputpic">
   <label for="p_image3">p_image3</label>
   <input type="file" id="p_image3" name="p_image3" onchange="readURL4(this)"/>
   <br><img id="select_img4" style="width:400px">
   
   <script>
   function readURL4(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img4').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img4').src = "";
		}
	}
   </script>
   
</div>

<div class="inputpic">
   <label for="p_contents">p_contents</label>
   <input type="file" id="p_contents" name="p_contents" onchange="readURL5(this)"/>
   <br><img id="select_img5" style="width:400px">
   
   <script>
   function readURL5(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img5').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img5').src = "";
		}
	}
   </script>
   
</div>



</form>


<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>