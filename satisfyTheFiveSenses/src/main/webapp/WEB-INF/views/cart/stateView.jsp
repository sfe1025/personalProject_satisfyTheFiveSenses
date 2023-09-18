<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
	
	 	<title>주문배송</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			#tableTitle {
				text-align:center;
			}
		</style>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
			
		
	</head>
	<body>
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style="text-align:center; margin-top:50px;">
				<h1>주문배송</h1>
			</header>
			
			<form name="tempForm" >
					<input type="hidden" name="fkf">
				</form>
			
				<!-- <form name="cartForm" action="/controller/cart/delete" method="post"> -->
					<c:forEach items="${list}" var = "list">
					<form name="confirmForm" action="controller/cart/review" method="post">
						
							<input type="hidden" id="userId" name="userId" value="${member.userId}">
							<input type="hidden" id="pdNo" name="pdNo" value="${list.pdNo}">
							<input type="hidden" id="cartNo" name="cartNo" value="${list.cartNo}">
							<input type="hidden" id="eeee2" name="eeee2" >
							<table border="1">
								<tr>
									<td>카트번호
									</td>
									<td><c:out value="${list.cartNo}" />
									</td>
								<tr>
								<tr>
									<td>상품번호
									</td>
									<td><c:out value="${list.pdNo}" />
									</td>
								<tr>
								<tr>
									<td>주문일
									</td>
									<td><c:out value="${list.orderDate}" />
									</td>
								<tr>
								<tr>
									<td>상품이름
									</td>
									<td><c:out value="${list.pdName}" />
									</td>
								<tr>
								<tr>
									<td>상품정보
									</td>
									<td><c:out value="${list.pdSimple}" />
									</td>
								<tr>
								<tr>
									<td>상품가격
									</td>
									<td><c:out value="${list.pdPrice}" />
									</td>
								<tr>
								<tr>
									<td>상품주문배송상태
									</td>
									<td><c:out value="${list.state}" />
									</td>
								<tr>
							</table>
							<br>
								<div><img src="/controller/resources/img/${list.pdDetailImg}" alt=""></div>
							<c:if test="${list.state == '배송중'}">
								<div>
									<button type="button" id="confirmBuy${list.cartNo}">구매확정</button>
									<button type="button" id="review${list.cartNo}">구매확정과 리뷰쓰기</button>
								</div>
							<div id="reviewView${list.cartNo}" style="display:none;">
								<select name="rvScore" id="rvScore">
							        <option value="1">1점</option>
							        <option value="2">2점</option>
							        <option value="3">3점</option>
							        <option value="4">4점</option>
							        <option value="5" selected>5점</option>
							    </select>
								<input type="text" id="rvContent" name="rvContent" placeholder="구매 후기를 솔직하게 작성해주세요.">
								
								<button type="submit" id="sendReview${list.cartNo}">작성</button>
								
							</div>
							<script>
								$("#confirmBuy${list.cartNo}").click(function(){
									
									var formObj1 = $("form[name='confirmForm']");
									
									formObj1.attr("action", "/controller/cart/confirmBuy?cartNo="+${list.cartNo})
									formObj1.attr("method", "post")
									formObj1.submit()
								});
								$("#review${list.cartNo}").click(function(){
									$("#reviewView${list.cartNo}").show();
								});
								$("#sendReview${list.cartNo}").click(function(){
									
									var formObj2 = $("form[name='confirmForm']");
					
									formObj2.attr("action", "/controller/cart/review?pdNo="+${list.pdNo}+"&cartNo="+${list.cartNo})
									formObj2.attr("method", "post")
									formObj2.submit()
								});
								
								
							</script>
							</c:if>
 -->				</form>
					</c:forEach>
				<!-- 	</form> -->
				
				
					
					<!-- <div><button class="btn btn-success" type="button" id="paymentBtn" onclick="payment();">장바구니 품목 모두 주문하기</button></div>	 -->
			<hr />
		</div>
		
		<%@include file="../include/footer.jsp"%>
	</body>
	
</html>