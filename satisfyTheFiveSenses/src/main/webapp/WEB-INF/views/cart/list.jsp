<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
	
	 	<title>장바구니</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			#tableTitle {
				text-align:center;
			}
		</style>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
		
		<script>
		
		 $(document).ready(function(){
			
			 
			 /* $("#paymentAllBtn").on("click", function() {
				 document.getElementById('paymentBtn').click()
			 }); */
			
			
			
			$("#paymentBtn").on("click", function(){
				
				var formObj = $("form[name='cartForm']");
				
				formObj.attr("action", "/controller/cart/paymentComplete");
				formObj.attr("method", "post");
				formObj.submit();
			}) 
		
		 })
		/* 	
			
		function payment() {
			
			var formObj = $("form[name='paymentForm']");
			
			 $(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/controller/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			}) 
			
				formObj.attr("action", "/controller/cart/paymentComplete");
				formObj.attr("method", "post");
				formObj.submit();
			
			
		}
			 */ 
		 
		
		/* var cateName;
		
			
		
		var userId = "<c:out value="${member.userId }" />";
		
		function userChk(){
			if(userId == "" || userId == null){
				alert("로그인을 해주세요.");
				event.preventDefault();
				location.href="/controller/";
			}
		} */
		
		
		
		</script>
		
	</head>
	<body>
	
	
	
	
	
	
	<%@include file="../include/header.jsp"%>
	
	<%-- <%System.out.println("${member.userId}"); %> --%>
	
		<div class="container">
			<header style="text-align:center; margin-top:50px;">
				<h1>장바구니</h1>
			</header>
			
			<input type="text" value="${member.userId}">
			
				<form name="cartForm" action="/controller/cart/delete" method="post">
					<c:forEach items="${list}" var = "list">
						
						
							<input type="hidden" id="userId" name="userId" value="${member.userId}">
							<input type="hidden" id="pdCategory" name="pdCategory" value="${list.pdCategory}">
							<input type="hidden" id="pdNo" name="pdNo" value="${list.pdNo}">
							<input type="hidden" id="cartNo" name="cartNo" value="${list.cartNo}">
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
							</table>
							<br>
								<div><img src="/controller/resources/img/${list.pdDetailImg}" alt=""></div>
								<div><button class="btn btn-success" type="button" id="delete_${list.cartNo}_Btn">장바구니에서 빼기</button></div>
								<script>
								$("#delete_${list.cartNo}_Btn").on("click", function(){
									
									var formObj2 = $("form[name='cartForm']");
									
									formObj2.attr("action", "/controller/cart/delete?cartNo=" + ${list.cartNo});
									formObj2.attr("method", "post");
									formObj2.submit();
								})
								</script>
<!-- 								<div><button type="button" id="paymentBtn" style="background-color:transparent;  border:0px transparent solid;"></button></div>
 -->								
					</c:forEach>
					<div><button class="btn btn-success" type="button" id="paymentBtn">장바구니 품목 모두 주문하기</button></div>
					</form>
					
					<!-- <div><button class="btn btn-success" type="button" id="paymentBtn" onclick="payment();">장바구니 품목 모두 주문하기</button></div>	 -->
			<hr />
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
</html>