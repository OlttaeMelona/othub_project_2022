<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Partner | Othub</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/partner/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<main class="pt_main">
		<section class="pt_sec">
			<form id="ocrform" class="partnerform" method="post" enctype="multipart/form-data">
				<h2 class="h2">OT-HUB 입점 신청서</h2>
				<div class="pt_Info">
					<span>입점 카테고리를 선택해주세요<i>*</i></span><br>
					<select class="pt_kind" name="pt_kind">
						<option selected value=""></option>
						<option value="쇼핑몰">쇼핑몰</option>
						<option value="포토룸">포토룸</option>
					</select>
				</div>
				<div class="pt_Info">
					<label>회사명을 입력해주세요.<i>*</i></label><br>
					<input type="text" name="pt_companyName" placeholder="ex)adidas"/>
				</div>
				<div class="pt_Info">
					<label>담당자 성함과 직위를 입력해주세요.<i>*</i></label><br>
					<input type="text" name="pt_contectPerName" placeholder="ex)김철수"/>
					<input type="text" name="pt_contectPerPosition" placeholder="ex)대리"/>
				</div>
				<div class="pt_Info">
					<label>담당자 휴대폰 번호를 입력해주세요.<i>*</i></label><br>
					<input type="text" name="pt_contectPerPhone" placeholder="ex)010-1234-5678"/>
				</div>
				<div class="pt_Info">
					<label>홈페이지 주소를 입력해주세요.<i>*</i></label><br>
					<input type="text" name="pt_homePageURL" placeholder="http://부터 입력"/>
				</div>
				<div class="pt_Info">
					<label>이메일 주소를 입력해주세요.<i>*</i></label><br>
					<input type="text" name="pt_email" placeholder="Email"/>
				</div>
				<div class="pt_Info">
					<label>사업자 등록 번호를 입력해주세요.<i>*</i></label><br>
					<input type="text" name="pt_companyRegistNum" placeholder="ex)000-00-00000" />
				</div>
				<div>
					<input type="hidden" name="m_id" value="<%=session.getAttribute("m_id")%>">
				</div>
				<div class="pt_Info file">
					<span>사업자등록증 사진 파일을 업로드 해주세요.<i>*</i></span><br>
					<span>
						<label for="sr_image1">File Upload</label>
						<input id="sr_image1" type=file name="pt_companyRegistNumImg" onchange="readURL1(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview1">
					</span>
				</div>
				<div class="pt_last_box ">
					<span>※입점 신청일로 부터 2일 이내 검토 후 email이 발송됩니다.(공휴일 제외) </span><br>
					<button type="submit" class="pt_btn" onclick="javascript:form.action='/partnerRegist'">입점신청하기</button>
					<!-- <input class="pt_btn" type="submit" value="입점 신청하기 Click!"> -->
				</div>
			</form>
			<form method="post" enctype="multipart/form-data">
				<div class="pt_Info file">
					<label for="ocr_img">File Upload2</label>
					<input id="ocr_img" type=file name="ocr_img" onchange="readURL2(this)" accept="image/jpg,jpeg,png,jifi" required>
					<br><img id="preview2">
				</div>
				<input type="hidden" name="m_id" value="<%=session.getAttribute("m_id")%>">
				<button class="pt_btn" id="fileBtn" onclick="javascript:form.action='/ocr'">파일검사</button>
			</form>
			<div>
				<c:if test="${result != null }">  
					<!-- 결과 출력 (텍스트) -->
			        <h3>OCR : 텍스트 추출 결과</h3>
			        	<div id="Condition1"></div>
			        	<div id="Condition2"></div>
			      	<div id ="text1"></div>
					<h3 id="text" style ="border:1px solid navy"></h3>
			        <br><br>
			
			        <!-- 이미지 출력 (새로운 방법으로 알려줄 것임)  -->
			        <h3>OCR : 원본 이미지 파일</h3>
			        <img src="${ocrpath}${ocrimg.ocr_imgname }">
				</c:if>
			</div>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
<script>
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
	
	<!--
	//파일 업로드
	function fileCheck(){
        var form = new FormData();
        form.append( "ocr_img", $("#ocr_img")[0].files[0] );
        var fileName = $('#ocr_img').val().split("\\").pop();
        
        $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "ocr",
	        data: form,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	 //$('#resultDiv').text(result);
	                // 이미지 출력 (div에 append)
	               // $('#resultImg').empty();
	                //$('#resultImg').append('<img src="images/partner/ocr_test/'+fileName+'"/>');
	            alert("성공");
	        },
	        error: function (e) {
	            alert("실패");
	        }
	    });
	}
	-->
</script>

<script>
	$(document).ready(function() {
		var json = JSON.parse('${result}');
		var fieldlist = json.images[0].fields;
			
		$("#Condition1").append("inferText : "+fieldlist[1].inferText + "<br>");	
		
		//inferText
		for(var i =0; i<fieldlist.length; i++){
			$("#text1").append("inferText : "+fieldlist[i].inferText + "<br>");	
		}
		
		for(var i =0; i<fieldlist.length; i++){
			if(fieldlist[i].lineBreak == true){
				$("#text").append(fieldlist[i].inferText + "<br>");	
			}
			else{
				$("#text").append(fieldlist[i].inferText + "&nbsp;");	
			}
		}
		
		//var iftext = document.getElementById('#Condition1').value;
		//$("#Condition2").append(iftext + "<br>");
		
		//숨기기
		$("#text1").hide();
	});//ready end
</script>
</html>
