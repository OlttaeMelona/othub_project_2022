<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Editor | Showroom</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/showroom/common.css" rel="stylesheet">
<!-- ckeditor / jquery 라이브러리 연결 -->
<script src="js/ko.js"></script>
<script src="js/ckeditor.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
	
	<%//variable
		String Date = new java.text.SimpleDateFormat("yyyy.MM.dd").format(new java.util.Date());
	%>
	
	<!-- main container -->
	<main class="sr_write_main" >
		<section class="writingform">
			<form action="uploadpost" method="post" enctype="multipart/form-data">
				<h3 class="h3">Showroom Editor</h3>
				<div class="wrt_info">
					<span>⭐ No.${totalpost } </span>
					<span>✒️ ${a_name } 관리자</span>
					<span>⏱️ <%=Date %></span><br>
				</div>
				<input id="sr_title" type="text" name="sr_title" placeholder="제목을 입력해주세요.">
				<textarea id="ckeditor" name="sr_contents" placeholder="내용을 입력하세요."></textarea>
				<div class="file">
					<span>
						<label for="sr_image1">ImageFile1</label>
						<input id="sr_image1" type=file name="sr_image1" onchange="readURL1(this)" accept="image/jpg,jpeg,png,jifi" required>
						<br><img id="preview1">
					</span>
					<span>
						<label for="sr_image2">ImageFile2</label>
						<input id="sr_image2" type=file name="sr_image2" onchange="readURL2(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview2">
					</span>
					<span>
						<label for="sr_image3">ImageFile3</label>
						<input id="sr_image3" type=file name="sr_image3" onchange="readURL3(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview3">
					</span>
					<span>
						<label for="sr_image4">ImageFile4</label>
						<input id="sr_image4" type=file name="sr_image4" onchange="readURL4(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview4">
					</span>
					<span>
						<label for="sr_image5">ImageFile5</label>
						<input id="sr_image5" type=file name="sr_image5" onchange="readURL5(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview5">
					</span>
				</div>
				<input type="hidden" name="sr_writer" value="<%=session.getAttribute("a_id")%>">
				<input class="sr_write_btn" type="submit" onclick="sr_fileCheck(this)" value="작성하기">
			</form>
		</section>
	</main>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>
<script>
	//ckeditor 생성
	ClassicEditor
	    .create( document.querySelector( '#ckeditor' ), {
	        language: 'ko' //언어설정
	    })
	    .catch( error => {
	        console.error( error );
	 });
	
	//글쓰기폼 미입력,미선택 경고창
	var titleCheck = document.getElementById("sr_title");
	var fileCheck = document.getElementById("sr_image1");
	function sr_fileCheck(){
		if(titleCheck.value == ''){
			titleCheck.focus();
			alert("제목 및 내용을 입력해 주세요.");
		}
		else if(!fileCheck.value){
			alert("이미지 파일을 첨부해 주세요.");
			return false;
		}
	}
	//file priveiw
	function readURL1(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview1').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview1').src = "";
		}
	}
	function readURL2(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview2').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview2').src = "";
		}
	}
	function readURL3(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview3').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview3').src = "";
		}
	}
	function readURL4(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview4').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview4').src = "";
		}
	}
	function readURL5(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview5').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview5').src = "";
		}
	}
</script>
</html>
