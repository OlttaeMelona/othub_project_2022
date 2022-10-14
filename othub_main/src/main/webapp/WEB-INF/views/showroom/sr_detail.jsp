<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Post | OtHub</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/showroom/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
	
	<main class="postMain">
		<header class="postHead">
			<h3 class="postTitle">${onePost.sr_title }</h3>
		</header>
		<section class="PostImg">
			<article class="postImgBox">
				<div class="postBigImg">
					<img class="bigImg" src="images/showroom/user_img/${onePost.sr_imgname1 }">
				</div>
				<div class="postSmallImg">
					<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname1 }">
					<c:if test="${onePost.sr_imgname2 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname2 }">
					</c:if>
					<c:if test="${onePost.sr_imgname3 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname3 }">
					</c:if>
					<c:if test="${onePost.sr_imgname4 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname4 }">
					</c:if>
					<c:if test="${onePost.sr_imgname5 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname5 }">
					</c:if>
				</div>
			</article>
		</section>
		<aside class="postAside">
			<form action="" method="post">
				<table>
					<thead></thead>
					<tbody>
						<tr>
							<td class="rowname">상품명</td>
							<td class="col_p">${onePost.sr_title }</td>
						</tr>
						<tr>
							<td class="rowname">유형</td>
							<td class="col_p">
								<c:if test="${onePost.sr_kind == 1}">
									스튜디오
								</c:if>
								<c:if test="${onePost.sr_kind == 2}">
									사진관
								</c:if>
								<c:if test="${onePost.sr_kind == 3}">
									사진작가
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="rowname" colspan="2">
								<label class="rowname" for="">예약인원</label><br>
								<input type="number" neme="">
							</td>
						</tr>
						<tr>
							<td class="rowname" colspan="2">
								<label class="rowname" for="">예약 날짜</label><br>
								<input type="date" name="" min="" >
							</td>
						</tr>
						<tr>
							<td class="rowname" colspan="2">
								<input type="submit" value="예약하기">
								<input type="button" value="찜하기">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</aside>
		<section class="postContents">
			<div id="map" style="width:500px;height:400px;"></div>
		</section>
	</main>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>


<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de99cf4145328e6411314ae05caa843b"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});  
</script>
<script>
	window.onload = function(){
		var bigImg = document.querySelector(".bigImg");
		var smallImgs = document.querySelectorAll(".smallImg");
		
		
		for(var i = 0; i < smallImgs.length; i++){
			console.log(smallImgs[i].getAttribute("src"));
			smallImgs[i].addEventListener("click", changeImg);
		}
		function changeImg(){
			var smallPicAttribute = this.getAttribute("src");
			bigImg.setAttribute("src", smallPicAttribute);
		}
	}
	
</script>
</html>
