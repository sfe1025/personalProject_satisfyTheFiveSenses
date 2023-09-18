<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<%-- <link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet"> --%>
	
	 	<title>혼밥탈출 게시판</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			#tableTitle {
				text-align:center;
			}
		</style>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
		
		<script>
		
		var cateName;
		
		  /* $(document).ready(function(){
			 var formObj = $("form[name='listForm']");
			
			 
			
			$("#delete_Btn").on("click", function(){
				
				alert(document.getElementById('pdNo').value);
				
				  var pdNo = document.getElementById('pdNo').value;
				
				//alert(document.getElementById('pdNo').value);
				
				formObj.attr("action", "/controller/board/delete?pdNo=" + pdNo);
				formObj.attr("method", "post");
				formObj.submit();
			})
			
		 }) */
			
			/* $(".selectDelete_btn").click(function(){
				var confirm_val = confirm("정말 삭제하시겠습니까?");
				
				if(confirm_val){
					var checkArr = new Array();
					
					$("input[class='chBox']:checked").each(function(){
						checkArr.push($(this).attr("data-pdNo"));
					})
					
					$.ajax({
						url : "/controller/board/delete",
						type : "post",
						data : { chbox : checkArr},
						success : function(){
							location.href = "/controller/board/list?pdCategory=" + document.getElementById('pdCategory').value;
						}
					})
				}
				
			})
			
			$("#deleteBtn").click(function(){
				var checkArr = new Array();
				
				checkArr.push($(this).attr("data-cartNum"));
				
				$
			})
			
			
			
			
			
		 }) */
		 
		 /* function btnclick() {
			
			alert($(this).attr("data-pdNo"));
			
			
			/*  var formObj = $("form[name='listForm']");
			 
			 var pdNo = document.getElementById('pdNo').value;
				
				
				
				formObj.attr("action", "/controller/board/delete?pdNo=" + pdNo);
				formObj.attr("method", "post");
				formObj.submit(); */
			 
		
			

		
		var userId = "<c:out value="${member.userId }" />";
		
		function userChk(){
			if(userId == "" || userId == null){
				alert("로그인을 해주세요.");
				event.preventDefault();
				location.href="/controller/";
			}
		}
		
		</script>
		
	</head>
	<body>
	
	
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style=" margin-top:50px;">
				<h1>상품 리스트
				</h1>
					
					<c:forEach items="${list}" var = "list">
						<form name="listForm"  action="/controller/cart/regist" method="post">
						
						<input type="hidden" id="userId" name="userId" value="${member.userId}">
						<input type="hidden" id="pdCategory" name="pdCategory" value="${list.pdCategory}">
						<input type="hidden" id="pdNo" name="pdNo" value="${list.pdNo}" data-pdNo="${list.pdNo}">
						
							<img src="/controller/resources/img/${list.pdDetailImg}" alt="">
							<table border="1" style="">
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
								
							<c:if test="${member.userStatus == '0'}">
							<div><button class="btn btn-success" type="submit" id="cartBtn">장바구니 담기</button></div>
							</c:if>
							<c:if test="${member.userStatus == '1'}">
							<button class="btn btn-success" type="button" id="delete_${list.pdNo}_Btn">상품 삭제</button>
							</c:if>
							<script>
								$("#delete_${list.pdNo}_Btn").click(function(){
								var formObj = $("form[name='listForm']");
									
									  /* var pdNo = document.getElementById('pdNo').value;
									  
									  alert(pdNo); */
									
									formObj.attr("action", "/controller/board/delete?pdNo=" + ${list.pdNo});
									formObj.attr("method", "post");
									formObj.submit();
								  });
								</script>
							<!-- <div id = "display_btn"></div> -->
					</form>
					</c:forEach>
						<%-- <c:forEach items="${list}" var = "list">
							<tr>
								<td><a href="/controller/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}" onclick="userChk();"><c:out value="${list.title}" /></a></td>
								<td><c:out value="${list.content}" /></td>
								<td><c:out value="${list.cp}" /></td>
								<td><c:out value="${list.mp}" /></td>
								<td><c:out value="${list.location}" /></td>
								<td><c:out value="${list.writer}" /></td>
								<td style="text-align:center" ><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach> --%>
					<%-- <div class="search">
				    <select name="searchType">
				      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				    </select>
				
				    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
				
				    <button id="searchBtn" type="button">검색</button>
				    <script>
				      $(function(){
				        $('#searchBtn').click(function() {
				          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				        });
				      });
				    </script>
				  </div>
					<div>
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>	
					</div> --%>
				<!-- </form> -->
				<!-- </div> -->
			<!-- </section> -->
			<hr />
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
</html>