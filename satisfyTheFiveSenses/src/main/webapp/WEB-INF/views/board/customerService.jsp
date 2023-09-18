<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	 	<title>QnA 게시판</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			#tableTitle {
				text-align:center;
			}
		</style>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
		
		<script>
		$(document).ready(function(){
		
		
		//글 작성
		$(".writeBtn").on("click",function(){
			
			alert("afw");
			
			location.href = "/controller/board/writeView";
			
		});
		
		})
		
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
	
		<div class="container">
			<header style="text-align:center; margin-top:50px;">
				<h1>QnA 게시판
				</h1>
			</header>
			 
			<%-- <div style="margin-top:20px">
				<%@include file="nav.jsp" %>
			</div> --%>
			
			<!-- <div class="container"> -->
			<!-- <section id="container"> -->
				<!-- <form role="form" method="get"> -->
					<table class="table table-bordered" style="table-layout:fixed">
						<%-- <colgroup>
							<col width="5%">
							<col width="*%" />
							<col width="9%" />
							<col width="10%" />
							<col width="5%">
							</colgroup> --%>
						<tr id="tableTitle">
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
						
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.boardNo}"/></td>
								<td><a href="/controller/board/readView?boardNo=${list.boardNo}"><c:out value="${list.title}" /></a></td>
								<td><c:out value="${list.userId}" /></td>
								<td style="text-align:center" ><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
					
					
					
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
					<%--  <div class="search">
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
				  </div> --%>
					 <div>
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="customerService${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li><a href="customerService${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="customerService${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					  <button type="button" class="writeBtn" id="writeBtn">작성</button>
					</div>
				<!-- </form> -->
				<!-- </div> -->
			<!-- </section> -->
			<hr />
		</div>
	</body>
</html>