<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
	
	 	<title>재고관리</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			#tableTitle {
				text-align:center;
			}
		</style>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
		<script>
		
		/* var formObj = $("form[name='sendForm']");
		
		$(document).ready(function(){
			
			$("#sendBtn").on("click", function(){
				
				formObj.attr("action", "/board/send");
				formObj.attr("method", "post");
				formObj.submit();
				
			})
			
		}) */
		
		</script>
		
		
	</head>
	<body>
	
	
	
	
	
	
	<%@include file="../include/header.jsp"%>
	
	<%-- <%System.out.println("${member.userId}"); %> --%>
	
		<div class="container">
			<header style="text-align:center; margin-top:50px;">
				<h1>재고관리</h1>
			</header>
			
				<!-- <form name="cartForm" action="/controller/cart/delete" method="post"> -->
					<c:forEach items="${list}" var = "list">
						
							<%-- <input type="hidden" id="userId" name="userId" value="${member.userId}">
							<input type="hidden" id="pdCategory" name="pdCategory" value="${list.pdCategory}">
							<input type="hidden" id="pdNo" name="pdNo" value="${list.pdNo}">
							<input type="hidden" id="cartNo" name="cartNo" value="${list.cartNo}"> --%>
							<table border="1">
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
									<td>상품카테고리
									</td>
									<td><c:out value="${list.pdCategory}" />
									</td>
								<tr>
								<tr>
									<td>남은 재고량
									</td>
									<td><c:out value="${list.pdStock}" />
									</td>
								<tr>
							</table>
							<br>
					</c:forEach>
				<!-- 	</form> -->
					
					<!-- <div><button class="btn btn-success" type="button" id="paymentBtn" onclick="payment();">장바구니 품목 모두 주문하기</button></div>	 -->
			<hr />
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
</html>