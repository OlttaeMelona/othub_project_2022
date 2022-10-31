<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberList | Othub</title>
   <link href="css/order/orderdetail/import.css" rel="stylesheet">
    <link href="css/order/orderdetail/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$("#deletebtn").click(function(ev){
			 if(!confirm("탈퇴 처리 하시겠습니까?")) {
				 ev.preventDefault();
			 }
		 });
		
		});//ready end
	</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
	

<div class=container">
	<div class="container1" >
		<h3> 나의 쇼핑 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="ordered">주문내역</a></li>
					<li><a id="c_nav_d" href="goCart">장바구니</a></li>
					<li><a id="c_nav_d" href="myreserv?m_id=<%=session.getAttribute("m_id")%>">예약정보</a></li>
					<li><a id="c_nav_d" href="myreviewlist?reviewnum=1">내 리뷰</a></li>
				</ul>
		<h3> 내 정보 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="updateform">프로필 정보/수정</a></li>
					<li><a id="c_nav_d" href="mycoupon">쿠폰함</a></li>
				</ul>
				
		<h3> 커뮤니티 </h3>
				<ul class="nav_category">
					<li><a id="c_nav_d" href="mycommunity">내 게시글</a></li>
					<li><a id="c_nav_d" href="mylikecommunity">좋아요한 게시글</a></li>
				</ul>
	</div>
	
    <div class="container2" >
		      <div class="inner">
   <h1>주문 내역</h1>
      <div class= "table">
         <table id="inventory">
            <colgroup>
               <col width="150px"><col width="250px"><col width="200px"><col width="70px"><col width="70px"><col width="150px">
            </colgroup>
            <thead>
               <tr>
                <th colspan="2">상품정보</th>
				<th>주문날짜</th>
				<th>색상</th>
				<th> 수량 </th>
				<th> 금액 </th>
				<th> 리뷰 </th>
               </tr>
            </thead>
            <tbody>
               	<c:forEach items="${ordered}" var="a">
				<tr><td> <img src='images/${a.p_thumb}' height="150" width="150"/></td>
					<td> 
						<p class="top">${a.p_brand }</p>
						<p class="middle">상품명 : ${a.p_name }</p>
						<p class="bottom">상품가격 : <fmt:formatNumber value='${a.p_price}' pattern="#,###"/> 원</p>

					</td>
					<td> ${a.orderdate }</td> 
					
					<td> ${a.p_color }</td>
					<td> ${a.amount } </td>
					<td> <fmt:formatNumber value='${a.p_price * a.amount}' pattern="#,###"/> 원</td>
					<td> 
					<c:if test="${a.review_check == 'n'}">
					<a href="/reviewwrite?order_id=${a.order_id }" id="review_write">리뷰 작성 </a>
					</c:if>
					<c:if test="${a.review_check == 'y'}">
					<a href="/reviewview?order_id=${a.order_id}" id="review_write">작성한 리뷰 보러 가기</a>
					</c:if>
					</td>
				</tr>
				</c:forEach>
            </tbody>
         </table>
         <h3 id="last"> 총 주문 금액 : <fmt:formatNumber value='${total_price}' pattern="#,###"/> 원</h3>
      </div>
   </div>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
	</div>

</div>

	
</body>


</html>